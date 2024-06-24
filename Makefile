.PHONY: help
.DEFAULT_GOAL := help

# run: ## Run Python Script
# 	@rye run main

train-mnist: ## Train on MNIST dataset
	@bash scripts/train/mnist.sh

train-anime: ## Train on Anime dataset
	@bash scripts/train/anime.sh

train-biggan: ## Train BigGAN
	@bash scripts/train/biggan.sh

train-proggan: ## Train progGAN
	@bash scripts/train/proggan.sh

train-stylegan2: ## Train StyleGAN2
	@bash scripts/train/stylegan2.sh

eval-mnist: ## Evaluate on MNIST dataset
	@bash scripts/eval/mnist.sh

eval-anime: ## Evaluate on Anime dataset
	@bash scripts/eval/anime.sh

eval-biggan: ## Evaluate BigGAN
	@bash scripts/eval/biggan.sh

eval-proggan: ## Evaluate progGAN
	@bash scripts/eval/proggan.sh

eval-stylegan2: ## Evaluate StyleGAN2
	@bash scripts/eval/stylegan2.sh

fmt: ## Format python code
	@rye run fmt

lint: ## Lint python code
	@rye run lint

test: ## Run test
	@rye run test

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'