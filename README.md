# Alephium


### Disclaimer

The whitepapers available in this repository were written in 2018. Please note that several areas are now outdated or have been redesigned and implemented differently. 

For example, the original whitepapers did not include a virtual machine or consider DeFi, as these concepts were not as prominent in 2018. Today, Alephium features a powerful virtual machine that significantly enhances the initial idea. It is specifically designed to take advantage of sUTXO’s strengths allowing Alephium to eliminate some of most prominent attacks vectors (reentrancy attack, unlimited authorization, double dip issue, flash loan, etc) and pioneers entirely new possibilities for smart contracts, dApps and tokens.

The current codebase serves as the source of truth and can be found here: [Alephium GitHub Repository](https://github.com/alephium/alephium).

For more high-level content on Alephium technology, please visit: [Alephium Documentation - Content](https://docs.alephium.org/misc/Content).

---

We propose a novel sharding algorithm that supports cross-shard transactions natively without using locks or other synchronization mechanisms.
With our new technology, transactions could be committed in parallel to the network achieving >10K TPS with low transactions fees.

We decompose smart contract into token protocol and data protocol to enable developers to build scalable blockchain applications easily.

