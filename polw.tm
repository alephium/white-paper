<TeXmacs|1.99.5>

<style|generic>

<\body>
  <doc-data|<doc-title|Proof of Less Work>|<doc-author|<author-data|<author-name|Cheng
  Wang>|<\author-affiliation>
    Alephium Project
  </author-affiliation>>>>

  <subsubsection|Introduction>

  This paper is about PoLW to reduce the energy consumption of Nakamoto
  PoW<cite|nakamoto2008bitcoin>. This paper is inspired by the recent and
  great paper from Itay, Alexander and Ittay <cite|tsabary2019just> which
  describes several algorithms with reduced external costs. It's also
  inspired by the white paper of Alephium project <cite|alephium> which
  introduces dynamic mining rewards with lockup. We propose two algorithms
  (linear PoLW and exponential PoLW) which could reduce the energy
  consumption of Nakamoto PoW.

  From Section <math|2> to Section <math|6> we discuss about our linear PoLW.
  Then generalize it to other PoLW.

  <subsubsection|Linear PoLW>

  Let <math|W> be the amount of work needed for one block. Let the maximal
  block reward be <math|1> coin. The miner could choose to get only
  <math|\<alpha\>> coin reward (<math|0\<less\>\<alpha\>\<leqslant\>1>). If
  the actual work of the new block is <math|W<rprime|'>>, then the weighted
  work is <math|<around*|(|1+<frac|1-\<alpha\>|\<gamma\>>|)>W<rprime|'>>,
  where <math|\<gamma\>\<leqslant\>1> is a system parameter. Each miner could
  choose a different <math|\<alpha\>> to ample it's mining work. The idea is
  that the <math|1-\<alpha\>> coins are burned for some amount of weighted
  work.

  <big-table|<tabular|<tformat|<cwith|3|3|1|1|cell-tborder|0ln>|<cwith|5|5|1|1|cell-bborder|0ln>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-lborder|1ln>|<table|<row|<cell|<math|W>>|<cell|amount
  of work needed for a regularly mined block>>|<row|<cell|<math|W<rprime|'>>>|<cell|actual
  work the miner produces>>|<row|<cell|<math|\<alpha\>\<leqslant\>1>>|<cell|actual
  block rewards. maximal is <math|1> coin>>|<row|<cell|<math|\<beta\>>>|<cell|cost
  for regular block mining>>|<row|<cell|<math|\<gamma\>\<leqslant\>1>>|<cell|system
  parameter for weight calculation>>>>>|>

  <subsubsection|Mining Strategy>

  The question arises that which <math|\<alpha\>> should a miner use to
  maximize its return. Let's say a miner <math|M> has <math|x> coin to use
  for mining the block. Let <math|\<beta\>> coin be the resource cost of
  <math|W> work for the regular Nakamoto mining. Then in the equilibrium
  case, the probability of <math|M> getting the block is

  <\equation*>
    p<rsub|M>=<frac|x<around*|{|1+<around*|(|1-\<alpha\><rsub|M>|)>/\<gamma\>|}>|\<beta\>>
  </equation*>

  The expected return is

  <\equation*>
    p<rsub|M>\<alpha\><rsub|M>-x=<around*|(|1+<frac|1-\<alpha\><rsub|M>|\<gamma\>>|)>\<alpha\><rsub|M><frac|x|\<beta\>>-x
  </equation*>

  The maxmized return is

  <\equation*>
    max<around*|(|p<rsub|M>\<alpha\><rsub|M>-x|)>=max<around*|(|<around*|(|1+<frac|1-\<alpha\><rsub|M>|\<gamma\>>|)>\<alpha\><rsub|M>|)><frac|x|\<beta\>>-x
  </equation*>

  We could easily deduce that

  <\equation*>
    \<alpha\><rsub|M>=<frac|1+\<gamma\>|2>
  </equation*>

  Therefore, the long term strategy <math|\<cal-S\>> for a miner is to set
  <math|\<alpha\>> to be <math|<frac|1+\<gamma\>|2>> to mine new blocks.
  However, in short term, the miner could adjust its <math|\<alpha\>> for
  better expected return. We show that strategy <math|\<cal-S\>> is an
  equilibrium strategy by an ideal analysis.

  Note that even if the Miner <math|M>'s mining algorithm or machine is more
  efficient than the others, the optimal value of <math|\<alpha\><rsub|M>> is
  still <math|<frac|1+\<gamma\>|2>>.

  <subsubsection|Equilibrium Strategy>

  Let's assume that all the miners work together and use the same
  <math|\<alpha\>> to try to maximize the return of mining. In order to make
  the weighted work reach the target work <math|W>, the miners need to cost
  <math|<frac|\<beta\>|1+<around*|(|1-\<alpha\>|)>/\<gamma\>>> coin. The
  actual return of the miners is

  <\equation*>
    R<around*|(|\<alpha\>|)>=\<alpha\>-<frac|\<beta\>|1+<around*|(|1-\<alpha\>|)>/\<gamma\>>
  </equation*>

  With some calculation, we get the following result

  <\eqnarray*>
    <tformat|<cwith|1|1|2|2|cell-tborder|0ln>|<cwith|3|3|2|2|cell-bborder|0ln>|<cwith|1|-1|2|2|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|3|3|cell-lborder|0ln>|<table|<row|<cell|>|<cell|1+\<gamma\>-2<sqrt|\<beta\>\<gamma\>>>|<cell|when
    \<gamma\>\<leqslant\>\<beta\>\<leqslant\><frac|<around*|(|1+\<gamma\>|)><rsup|2>|4\<gamma\>>,with
    \<alpha\>=1+\<gamma\>-<sqrt|\<beta\>\<gamma\>>>>|<row|<cell|max
    R<around*|(|\<alpha\>|)>=>|<cell|1-\<beta\> >|<cell|when
    \<beta\>\<less\>\<gamma\>,with \<alpha\>=1>>|<row|<cell|>|<cell|0>|<cell|when
    \<beta\>\<gtr\><frac|<around*|(|1+\<gamma\>|)><rsup|2>|4\<gamma\>>,donot
    mine>>>>
  </eqnarray*>

  We see here that when the mining cost is very low, the miners will set
  <math|\<alpha\>=1> and it degenerates to the classic Nakamoto mining.
  However, as the mining cost goes up, the miners will have to set
  <math|\<alpha\>=1+\<gamma\>-<sqrt|\<beta\>\<gamma\>>> to maxize its return.
  Therefore, we see that in the non-equilibrium case, the miners could set
  <math|\<alpha\>> to be different from <math|<frac|1+\<gamma\>|2>> for
  better mining return.

  <paragraph|Equilibrium Case.>In equilibrium, <math|max
  R<around*|(|\<alpha\>|)>> should be equal to <math|0>. In such case, we
  have <math|\<beta\>\<gtr\>\<gamma\>> and
  <math|><math|1+\<gamma\>-2<sqrt|\<beta\>\<gamma\>>=0>. Therefore

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<beta\>>|<cell|=>|<cell|<frac|<around*|(|1+\<gamma\>|)><rsup|2>|4\<gamma\>>>>|<row|<cell|\<alpha\>>|<cell|=>|<cell|1+\<gamma\>-<sqrt|\<beta\>\<gamma\>>=<frac|1+\<gamma\>|2>>>>>
  </eqnarray*>

  We now show that <math|\<alpha\>> will be <math|<frac|1+\<gamma\>|2>> for
  all the miners in the equilibrium case. Therefore, <math|\<cal-S\>> is the
  equiliblrium strategy in the case where mining is negligible to <math|0>.

  <subsubsection|Security Analysis>

  We only compare our algorithm to the classic Nakamoto PoW algorithm to see
  the security differencies. In Nakamoto PoW, an attacker needs to first
  invest 1 coin to mine a new block and then get the reward back in the
  equilibrium case.

  In our new algorithm, the cost for an attacker <math|A> to mine a new block
  with <math|\<alpha\><rsub|A>> is

  <\equation*>
    Cost<rsub|A>=1-R<rsub|A>=1-\<alpha\><rsub|A>+<frac|\<beta\>|1+<around*|(|1-\<alpha\><rsub|A>|)>/\<gamma\>>
  </equation*>

  In equilibrium where <math|\<beta\>=<frac|<around*|(|1+\<gamma\>|)><rsup|2>|4\<gamma\>>,\<alpha\>=<frac|1+\<gamma\>|2>>,
  the cost of the attacker is <math|2<sqrt|\<beta\>\<gamma\>>-\<gamma\>=1>.
  Therefore, we show that our new PoWW algorithm has same security as
  Nakamoto PoW in terms of new block generation cost.

  We ignore the other metrics analysis similar to that of paper
  <cite|tsabary2019just>, which should be intuitive.

  <subsubsection|Energy consumption.>

  The actual work done by the miner is <math|<frac|\<beta\>|1+<around*|(|1-\<alpha\>|)>/\<gamma\>>>
  coin. In equilibrium where <math|\<beta\>=<frac|<around*|(|1+\<gamma\>|)><rsup|2>|4\<gamma\>>,\<alpha\>=<frac|1+\<gamma\>|2>>,
  the work amount is equal to the mining reward <math|<frac|1+\<gamma\>|2>>,
  less than <math|1> coin. Therefore, it costs less energy compared to
  Nakamoto PoW.

  <subsubsection|Generalization & Exponential PoLW>

  Let's assume now that the weights of work is calculated by
  <math|1+f<around*|(|1-\<alpha\>|)>>. In our previous analysis,
  <math|f=<frac|1-\<alpha\>|\<gamma\>>>. Similarly, let's first find out the
  optimal <math|\<alpha\>> for miners in long term.

  <\equation*>
    p<rsub|M>=<frac|x<around*|{|1+f<around*|(|1-\<alpha\><rsub|M>|)>|}>|\<beta\>>
  </equation*>

  The expected return is

  <\equation*>
    p<rsub|M>\<alpha\><rsub|M>-x=<around*|{|1+f<around*|(|1-\<alpha\><rsub|M>|)>|}>\<alpha\><rsub|M><frac|x|\<beta\>>-x
  </equation*>

  The maxmized return is

  <\equation*>
    max<around*|(|p<rsub|M>\<alpha\><rsub|M>-x|)>=max<around*|(|<around*|{|1+f<around*|(|1-\<alpha\><rsub|M>|)>|}>\<alpha\><rsub|M>|)><frac|x|\<beta\>>-x
  </equation*>

  The optimal mining parameter would be better to satisfy the following
  equation of derivative.

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|1-f<rprime|'><around*|(|1-\<alpha\><rsub|M>|)>\<alpha\><rsub|M>+f<around*|(|1-\<alpha\><rsub|M>|)>>|<cell|=>|<cell|0>>>>>
  </equation*>

  We want to choose good function <math|f> such that
  <math|0\<less\>\<alpha\><rsub|M>\<less\>1>. As in the equilibrium case, the
  energy cost would be close to <math|\<alpha\><rsub|M>>, we also want the
  optimal <math|\<alpha\><rsub|M>> to be small if possible. There might be
  many ways to choose such kind of functions. We focus on this following
  simple case.

  <paragraph|Case <math|f<around*|(|1-\<alpha\>|)>=e<rsup|\<gamma\><around*|(|1-\<alpha\>|)>>-1
  <around*|(|\<gamma\>\<geqslant\>1|)>>.>In this case, we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|max<around*|(|<around*|{|1+f<around*|(|1-\<alpha\><rsub|M>|)>|}>\<alpha\><rsub|M>|)>>|<cell|=>|<cell|max<around*|(|\<alpha\><rsub|M>e<rsup|\<gamma\><around*|(|1-\<alpha\><rsub|M>|)>>|)>>>>>
  </eqnarray*>

  With simple calculation, we know that the optimal
  <math|\<alpha\><rsub|M>=<frac|1|\<gamma\>>>.

  In the following, we apply the similar analysis as before, without
  repeating all the details.

  <paragraph|Equilibrium.>The actual return of miners is

  <\equation*>
    R<around*|(|\<alpha\>|)>=\<alpha\>-\<beta\>e<rsup|-\<gamma\><around*|(|1-\<alpha\>|)>>
  </equation*>

  <\eqnarray*>
    <tformat|<table|<row|<cell|R<rprime|'><around*|(|\<alpha\>|)>>|<cell|=>|<cell|1-\<beta\>\<gamma\>e<rsup|-\<gamma\><around*|(|1-\<alpha\>|)>>>>>>
  </eqnarray*>

  <\eqnarray*>
    <tformat|<cwith|1|1|2|2|cell-tborder|0ln>|<cwith|1|3|2|2|cell-lborder|1ln>|<cwith|1|3|1|1|cell-rborder|1ln>|<cwith|1|3|2|2|cell-rborder|0ln>|<cwith|1|3|3|3|cell-lborder|0ln>|<table|<row|<cell|max
    R<around*|(|\<alpha\>|)>=>|<cell|\<alpha\>-<frac|1|\<gamma\>>>|<cell|when
    \<beta\>\<geqslant\><frac|1|\<gamma\>>,with
    \<alpha\>=1-<frac|lg<around*|(|\<beta\>\<gamma\>|)>|\<gamma\>>>>|<row|<cell|>|<cell|1-\<beta\>
    >|<cell|when \<beta\>\<less\><frac|1|\<gamma\>>,with \<alpha\>=1>>>>
  </eqnarray*>

  In equilibrium, we have <math|\<alpha\>-<frac|1|\<gamma\>>=0> and
  <math|\<alpha\>=1-<frac|lg<around*|(|\<beta\>\<gamma\>|)>|\<gamma\>>>,
  therefore

  <\eqnarray*>
    <tformat|<table|<row|<cell|\<beta\>>|<cell|=>|<cell|<frac|e<rsup|\<gamma\>+1>|\<gamma\>>>>|<row|<cell|\<alpha\>>|<cell|=>|<cell|<frac|1|\<gamma\>>>>>>
  </eqnarray*>

  Therefore, using <math|\<alpha\>=<frac|1|\<gamma\>>> is an equilibrium
  mining strategy.

  <paragraph|Security.>The cost of Attack <math|A> is

  <\equation*>
    Cost<rsub|A>=1-R<rsub|A>=1-\<alpha\><rsub|A>+\<beta\>e<rsup|-\<gamma\><around*|(|1-\<alpha\><rsub|A>|)>>
  </equation*>

  In equilibrium, the cost is 1 coin.

  <paragraph|Energy consumption.>In equilibrium, the actual mining cost (i.e.
  energy consumption) is <math|<frac|1|\<gamma\>>>. If we choose
  <math|\<gamma\>> to be large enough, this could be close to 0.

  <subsubsection|Parameter Selection>

  Let's call our two PoLW algorithms as linear PoLW
  (<math|f=<frac|1-\<alpha\>|\<gamma\>>,\<gamma\>\<leqslant\>1>) and
  exponential PoLW (<math|f<around*|(|1-\<alpha\>|)>=e<rsup|\<gamma\><around*|(|1-\<alpha\>|)>>-1,\<gamma\>\<geqslant\>1>).

  In linear PoLW, we could choose <math|\<gamma\>> close to zero so that the
  energy cost could be reduce to close to <math|<frac|1|2>>. However, when
  <math|\<gamma\>> is small, the weight <math|1+<frac|<around*|(|1-\<alpha\>|)>|\<gamma\>>>
  to the actual mining work would be huge, this will make double spending
  more feasible with less actual mining work.

  Same in exponential PoLW, we could choose <math|\<gamma\>> large so that
  the energy cost could be reduced to close to <math|0>. However, when
  <math|\<gamma\>> is big, the weight <math|e<rsup|\<gamma\><around*|(|1-\<alpha\>|)>>>
  to the actual minging work would be huge, this will make double spending
  more feasible as well.

  One way to ease this issue is to set the lower bound of <math|\<alpha\>> to
  be the optimal <math|\<alpha\>>. When mining is in equilibrium, the
  attackers could not get better weight than the other miners.

  The issue is still serious before mining reaching a equilibrium state. One
  possible solution is to adjust <math|\<gamma\>> when the blockchain
  evolves, so that the weights are lower from the beginning, but getting
  higher eventually. For example, we could adjust <math|\<gamma\>> based on
  the currently work target.

  <subsubsection|Implementation considerations.>

  The only thing to change is to use weighted work instead of the classic
  work. Therefore, there is neglagible implementation overhead.

  <subsubsection|Discussion.>

  It would be good to analysis PoLW in more complicated models.

  <\bibliography|bib|tm-plain|/Users/chengwang/Code/alephium/white-paper/poww.bib>
    <\bib-list|3>
      <bibitem*|1><label|bib-nakamoto2008bitcoin>Satoshi Nakamoto
      et<nbsp>al.<newblock> Bitcoin: a peer-to-peer electronic cash
      system.<newblock> 2008.<newblock>

      <bibitem*|2><label|bib-tsabary2019just>Itay Tsabary, Alexander
      Spiegelman<localize|, and >Ittay Eyal.<newblock> Just enough security:
      reducing proof-of-work ecological footprint.<newblock>
      <with|font-shape|italic|ArXiv preprint arXiv:1911.04124>,
      2019.<newblock>

      <bibitem*|3><label|bib-alephium>Cheng Wang.<newblock> Alephium: a
      scalable cryptocurrency system based on blockow.<newblock>
      <slink|https://github.com/alephium/white-paper/raw/master/white-paper.pdf>,
      2018.<newblock>
    </bib-list>
  </bibliography>
</body>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|7.1|3>>
    <associate|auto-11|<tuple|7.2|3>>
    <associate|auto-12|<tuple|7.3|3>>
    <associate|auto-13|<tuple|7.4|4>>
    <associate|auto-14|<tuple|8|4>>
    <associate|auto-15|<tuple|9|4>>
    <associate|auto-16|<tuple|10|4>>
    <associate|auto-17|<tuple|10|4>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|1|1>>
    <associate|auto-4|<tuple|3|1>>
    <associate|auto-5|<tuple|4|2>>
    <associate|auto-6|<tuple|4.1|2>>
    <associate|auto-7|<tuple|5|2>>
    <associate|auto-8|<tuple|6|2>>
    <associate|auto-9|<tuple|7|3>>
    <associate|bib-alephium|<tuple|3|4>>
    <associate|bib-nakamoto2008bitcoin|<tuple|1|4>>
    <associate|bib-tsabary2019just|<tuple|2|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      nakamoto2008bitcoin

      tsabary2019just

      alephium

      tsabary2019just
    </associate>
    <\associate|table>
      <tuple|normal||<pageref|auto-3>>
    </associate>
    <\associate|toc>
      <with|par-left|<quote|2tab>|1<space|2spc>Introduction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|2tab>|2<space|2spc>Linear PoLW
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|3<space|2spc>Mining Strategy
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|4<space|2spc>Equilibrium Strategy
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|4tab>|Equilibrium Case.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.15fn>>

      <with|par-left|<quote|2tab>|5<space|2spc>Security Analysis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|6<space|2spc>Energy consumption.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|7<space|2spc>Generalization & exponential
      PoLW <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|4tab>|Case <with|mode|<quote|math>|f<around*|(|1-\<alpha\>|)>=e<rsup|\<gamma\><around*|(|1-\<alpha\>|)>>-1
      <around*|(|\<gamma\>\<geqslant\>1|)>>.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Equilibrium.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Security.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Energy consumption.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13><vspace|0.15fn>>

      <with|par-left|<quote|2tab>|8<space|2spc>Parameter Selection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|2tab>|9<space|2spc>Implementation considerations.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15>>

      <with|par-left|<quote|2tab>|10<space|2spc>Discussion.
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>