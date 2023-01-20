**Q**: True or False: we can prevent the heap being erased during upgrades by using a stable heap.

**A**: true

**Q**: A.call() -> B.call() -> C How much time (or rounds of consensus) do we need to wait for an answer?

**A**: If A and B and C are in different subnets, it takes 4 rounds of consensus (8 sec); if A and B are in different subnets and C is in the same of A, then it takes 3 rounds of consensus (6 sec) and the same if B and C are in the same subnet and A in a different one; Instead if all of them are in the same subnet, it takes 2 rounds of consensus (4 sec).


**Q**: Is possible to realize an intercanister call in query mode?

**A**: Originally no, but since Aug 2021 seems it's something in progress, according to this: https://forum.dfinity.org/t/inter-canister-query-calls-community-consideration/6754#summary-1