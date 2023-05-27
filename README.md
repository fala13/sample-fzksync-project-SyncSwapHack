# sample-fzksync-project-SyncSwapHack
PoC for small SyncSwapHack
Similar issue to TempleDAO hack: https://github.com/SunWeb3Sec/DeFiHackLabs/blob/main/src/test/Templedao_exp.sol

Problematic function:
https://github.com/syncswap/core-contracts/blob/5285a3a7b2b00ca8b7ffc5ae5ce6f6c6195e4aa7/contracts/SyncSwapRouter.sol#L446

You can supply custom "pool" contract and router will give it max allowance for the token, so the "pool" controlled by hacker can later transfer out arbitrary amount of the token from the Router contract (which I expect is unintended).
Fix would be to safeApprove only for the currently transferred amount.


For details check the files:

https://github.com/fala13/sample-fzksync-project-SyncSwapHack/blob/main/test/SyncSwapHack.sol

https://github.com/fala13/sample-fzksync-project-SyncSwapHack/blob/main/src/SyncSwapHackPool.sol

As the current zksync eroa tooling sucks I couldn't get this to work, but the bug is visible to the naked eye.
