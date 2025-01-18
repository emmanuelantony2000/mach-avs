OWNER_PRIVATE=$(cast wallet private-key --mnemonic-path "$MNEMONIC")
OWNER_ADDR=$(cast wallet address --private-key "$OWNER_PRIVATE")
RPC_URL=$BUILDBEAR_RPC_URL

cd contracts

forge script script/EigenLayerDeployer.s.sol --broadcast -vvvv --slow \
    --private-key $OWNER_PRIVATE \
    --rpc-url $RPC_URL

forge script script/MachServiceManagerDeployer.s.sol \
    --private-key $OWNER_PRIVATE \
    --broadcast -vvvv --slow --rpc-url $RPC_URL

cd ..
bash ./scripts/register_operator.sh $OWNER_ADDR $OWNER_PRIVATE $METADATA_URI 0xE9A7669aC9eBE9b7E21E0A323FC3A6f34CE744eb test1
bash ./scripts/register_operator.sh $OWNER_ADDR $OWNER_PRIVATE $METADATA_URI 0x957D781ab2Bc6D27Fde0a0b427ebF46ee1395661 test2
bash ./scripts/register_operator.sh $OWNER_ADDR $OWNER_PRIVATE $METADATA_URI 0x91d45D72e36c5a6838f14f49D607e9b16eD33f58 test3
