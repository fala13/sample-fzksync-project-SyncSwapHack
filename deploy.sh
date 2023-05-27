PK=
MY_ACCT=
RPC=https://mainnet.era.zksync.io
CHAIN=324
../foundry-zksync/target/debug/zkforge zkc src/SyncSwapHackPool.sol:SyncSwapHackPool --constructor-args $MY_ACCT --private-key $PK --rpc-url $RPC --chain $CHAIN