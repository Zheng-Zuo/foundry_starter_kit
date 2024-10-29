-include .env

.PHONY: all clean remove install build format anvil

all: clean remove install build

# Clean the repo
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install foundry-rs/forge-std@v1.9.4 --no-commit && forge install OpenZeppelin/openzeppelin-contracts@v5.1.0 --no-commit && forge install Uniswap/v2-core@v1.0.1 --no-commit && forge install Uniswap/v2-periphery --no-commit && forge install Uniswap/solidity-lib@v2.1.0 --no-commit && forge install transmissions11/solmate --no-commit && forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit && forge install Cyfrin/foundry-devops@0.2.3 --no-commit

build:; forge build

format :; forge fmt

anvil :; anvil --steps-tracing --block-time 1