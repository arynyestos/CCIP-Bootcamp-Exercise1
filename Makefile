# Include .env file if it exists
ifneq (,$(wildcard .env))
    include .env
    export
endif

# Define the target
deploy-sender:
	@echo "Running deploy script for ProgrammableDefensiveTokenTransfers to deploy it on Fuji"
	forge script script/ProgrammableDefensiveTokenTransfers.s.sol --rpc-url $(FUJI_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verifier-url $(SNOWTRACE_VERIFIER_URL) --etherscan-api-key $(SNOWTRACE_API_KEY)

deploy-receiver:
	@echo "Running deploy script for ProgrammableDefensiveTokenTransfers to deploy it on Sepolia"
	forge script script/ProgrammableDefensiveTokenTransfers.s.sol --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY)

# Optional: Add a help target to describe how to use the Makefile
help:
	@echo "Usage:"
	@echo "  make deploy-sender        Run the deploy script with the specified environment variables"
