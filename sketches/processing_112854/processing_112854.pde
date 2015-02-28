
// xiahuangjing  
// 541009408@qq.com
  
void setup() {
size(500 ,620);
background(235, 235, 250);
smooth();
}
  
  
void draw() {
 
stroke(0);
strokeWeight(1);
line(380,358,485,490);//star
line(362,418,476,410);
line(362,472,472,368);
line(425,365,429,477);
 
 
 
fill(0);
beginShape();
vertex(402,496);
bezierVertex(429,502,426,530,402,530);
bezierVertex(365,530,365,497,402,496);
endShape();
 
fill(0,0,0);
beginShape();
vertex(136,438);
bezierVertex(122,422,86,438,82,460);
bezierVertex(88,500,150,464,136,438);
endShape();
 
 
 
noStroke();
fill(28,63,13);
beginShape();
vertex(282,4);
bezierVertex(230,18,178,40,144,72);
bezierVertex(134,78,114,104,110,120);
bezierVertex(98,150,120,202,144,218);
bezierVertex(182,174,145,213,197,162);
bezierVertex(200,112,244,26,282,4);
endShape();
 
fill(0,0,0);
beginShape();
vertex(197,162);
bezierVertex(182,174,145,213,144,218);
bezierVertex(156,226,186,238,212,238);
bezierVertex(200,232,194,200,197,162);
endShape();
 
beginShape();
vertex(144,72);
bezierVertex(134,78,114,104,110,120);
bezierVertex(146,120,158,86,144,72);
endShape();
 
fill(197,62,7);
beginShape();
vertex(144,72);
bezierVertex(134,78,114,104,110,120);
bezierVertex(50,104,92,32,144,72);
endShape();
 
fill(0,0,0);
beginShape();
vertex(488,290);
bezierVertex(486,296,480,306,476,312);
bezierVertex(466,322,458,334,450,338);
bezierVertex(447,342,438,346,436,345);
bezierVertex(470,386,526,330,488,290);
endShape();
 
fill(43,54,157);
beginShape();
vertex(488,290);
bezierVertex(486,296,480,306,476,312);
bezierVertex(466,322,458,334,450,338);
bezierVertex(447,342,438,346,436,345);
bezierVertex(422,306,462,274,488,290);
endShape();
 
fill(0,0,0);
beginShape();
vertex(476,312);
bezierVertex(466,322,458,334,450,338);
bezierVertex(438,314,464,302,476,312);
endShape();
 
fill(197,62,7);
beginShape();
vertex(476,312);
bezierVertex(466,322,458,334,450,338);
bezierVertex(472,356,490,326,476,312);
endShape();
 
fill(0,0,0);
beginShape();//cf
vertex(426,106);
bezierVertex(434,88,466,98,456,122);//cf
bezierVertex(474,138,480,148,486,156);//i
bezierVertex(489,161,493,173,495,183);//j
bezierVertex(530,138,530,202,486,156);//ch
bezierVertex(474,146,460,138,446,132);//cg
bezierVertex(450,130,455,125,455,123);//cg
bezierVertex(448,114,436,110,426,106);//cf
endShape();
 
fill(197,62,7);
beginShape();
vertex(426,106);
bezierVertex(436,110,448,114,455,123);
bezierVertex(455,125,450,130,446,132);
bezierVertex(434,136,416,128,426,106);//ce
endShape();
 
fill(0,0,0);//comma
beginShape();//ba
vertex(368,328);
bezierVertex(402,274,401,248,370,228);
bezierVertex(362,232,342,246,336,260);//zb
bezierVertex(362,272,380,294,368,328);
endShape();
 
fill(43,54,157);
beginShape();//bb
vertex(370,228);
bezierVertex(362,232,342,246,336,260);//zb
bezierVertex(322,238,352,220,370,228);
endShape();
 
fill(0,0,0);//horseshoe
beginShape();//bd
vertex(310,220);
bezierVertex(299,226,286,234,277,244);//zq
bezierVertex(278,239,278,232,280,230);
bezierVertex(283,223,286,215,288,208);
bezierVertex(292,196,278,186,270,204);
bezierVertex(259,240,226,230,245,196);
bezierVertex(258,156,325,156,310,220);
endShape();
 
fill(197,62,7);
beginShape();//bc
vertex(310,220);
bezierVertex(299,226,286,234,277,244);//zq
bezierVertex(286,258,308,250,310,220);
endShape();
 
fill(0,0,0);//bag
beginShape();
vertex(332,418);
bezierVertex(334,423,335,428,336,434);//zd
bezierVertex(343,451,342,479,336,492);//ze
bezierVertex(334,500,328,511,324,514);//zf
bezierVertex(318,525,299,540,286,541);//zg
bezierVertex(272,546,244,546,228,541);//zh
bezierVertex(211,536,196,524,191,508);//zi
bezierVertex(189,504,186,496,186,488);//zj
bezierVertex(184,480,182,471,183,460);//zk
bezierVertex(182,450,183,435,185,427);//zl
bezierVertex(184.5,418,187,411.5,188,407);//zm
bezierVertex(189,398,190,392,192,385);//zn
bezierVertex(224,385,258,385,286,385);
bezierVertex(287,398,287,410,287,418);
bezierVertex(302,418,320,418,332,418);
endShape();
 
 
noStroke();
fill(197,62,7);
beginShape();//r1
vertex(286,418);
bezierVertex(272,418,270,418,265,418);
bezierVertex(265,415,266,409,267,404);
bezierVertex(272,404,279,404,286,404);
bezierVertex(286,409,286,415,286,418);
endShape();
 
beginShape();//r2
vertex(332,418);
bezierVertex(334,423,335,428,336,434);//zd
bezierVertex(325,434,316,435,307,435);
bezierVertex(307,428,307,423,308,419);
bezierVertex(316,419,325,418,332,418);
endShape();
 
beginShape();//r3
vertex(336,492);
bezierVertex(334,500,328,511,324,514);//zf
bezierVertex(312,511,300,509,287,508);
bezierVertex(287,501,287,493,287,485);
bezierVertex(312,487,318,490,336,492);
endShape();
 
beginShape();//r4
vertex(286,541);
bezierVertex(272,546,244,546,231,541);//zh
bezierVertex(232,531,233,517,234,507);
bezierVertex(251,507,269,508,284,510);
bezierVertex(285,517,286,531,286,541);
endShape();
 
beginShape();//r5
vertex(191,508);
bezierVertex(189,504,186,496,188,488);//zj
bezierVertex(194,482,201,473,204,465);
bezierVertex(214,467,224,470,237,473);
bezierVertex(235,484,234,494,233,506);
bezierVertex(220,507,205,507,191,508);
endShape();
 
fill(28,63,13);
beginShape();//g1
vertex(264,420);
bezierVertex(264,425,263,430,263,435);
bezierVertex(257,435,251,435,244,434.5);
bezierVertex(244,429,246,425,246,420);
bezierVertex(252,420,258,420,264,420);
endShape();
 
beginShape();//g2
vertex(305,435);
bezierVertex(305,451,306,470,306,488);
bezierVertex(299,486,293,486,287,485);
bezierVertex(286,470,286,451,286,435);
bezierVertex(294,435,299,435,305,435);
endShape();
 
beginShape();//g3
vertex(242,435);
bezierVertex(240,441,240,448,239,453);
bezierVertex(228,453,218,452,208,451);
bezierVertex(210,445,211,439,212,433);
bezierVertex(221,434,231,434.5,242,435);
endShape();
 
fill(43,54,157);
beginShape();//b1
vertex(267,387);
bezierVertex(267,393,266,398,266,403);
bezierVertex(261,403,255,403,248,403);
bezierVertex(249,398,250,393,251,387);
bezierVertex(256,387,262,387,267,387);
endShape();
 
beginShape();//b2
vertex(306,420);
bezierVertex(306,425,305,430,305,435);
bezierVertex(299,435,293,435,286,435);
bezierVertex(285,430,287,425,287,420);
bezierVertex(293,420,299,420,306,420);
endShape();
 
beginShape();//b3
vertex(284,454);
bezierVertex(284,462,285,472,285,482);
bezierVertex(269,479,253,476,238,473);
bezierVertex(239,466,240,460,241,454);
bezierVertex(254,454,269,454,284,454);
endShape();
 
beginShape();//b4
vertex(210,432);
bezierVertex(209,443,207,454,202,463);
bezierVertex(197,462,191,461,184,460);
bezierVertex(182,450,183,435,186,428);//zl
bezierVertex(193,430,201,431,210,432);
endShape();
 
fill(252,241,2);
beginShape();//y1
vertex(285,420);
bezierVertex(284,425,284,430,284,435);
bezierVertex(278,435,271,435,263,435);
bezierVertex(263,430,264,420,264,420);
bezierVertex(272,420,278,420,285,420);
endShape();
 
fill(248,138,1);
beginShape();//o1
vertex(249,386);
bezierVertex(247,404,245,421,242,435);
bezierVertex(231,434.5,221,434,212,433);
bezierVertex(214,420,203,405,189,406);
bezierVertex(190,398,191,392,193,386);//zn
bezierVertex(212,386,231,386,249,386);
endShape();
 
//
 
noFill();
stroke(1);
beginShape();//line 3
vertex(96,66);
bezierVertex(54,16,6,46,28,84);
endShape();
 
beginShape();//line 4
vertex(86,76);
bezierVertex(54,54,28,90,42,130);
endShape();
 
beginShape();//line 5
vertex(82,86);
bezierVertex(66,76,42,102,76,146);
endShape();
 
beginShape();//line 6
vertex(488,290);
bezierVertex(486,296,480,306,476,312);//a
bezierVertex(466,322,458,334,450,338);//b
bezierVertex(447,342,438,346,436,345);//c
bezierVertex(402,352,384,328,415,288);//d
bezierVertex(442,260,456,232,454,198);//e
bezierVertex(456,168,432,148,400,148);//f
bezierVertex(326,154,350,96,426,106);//g
bezierVertex(436,108,448,112,456,122);//h
bezierVertex(474,138,480,148,486,156);//i
bezierVertex(489,161,493,173,495,183);//j
bezierVertex(502,207,498,258,488,290);//k
endShape();
 
beginShape();//line 1
vertex(246,586);
bezierVertex(281,612,361,613,378,596);
bezierVertex(385,583,386,540,387,528);
endShape();
 
beginShape();
vertex(316,0);//line 2
bezierVertex(317,50,232,120,197,162);
bezierVertex(182,174,145,213,144,218);
bezierVertex(106,265,39,382,40,460);
bezierVertex(40,486,60,532,96,532);
bezierVertex(129,532,162,514,186,488);
bezierVertex(223,452,211,406,188,407);
bezierVertex(162,408,144,422,136,438);
endShape();
 
beginShape();
vertex(495,183);//line 7
bezierVertex(484,192,474,202,468,210);
endShape();
 
beginShape();
vertex(456,196);
bezierVertex(422,205,386,218,370,228);//za
bezierVertex(362,232,342,246,336,260);//zb
bezierVertex(308,302,318,334,332,418);//zc
bezierVertex(334,423,335,428,336,434);//zd
bezierVertex(343,451,342,479,336,492);//ze
bezierVertex(334,500,328,511,324,514);//zf
bezierVertex(318,525,299,540,286,541);//zg
bezierVertex(272,546,244,546,228,541);//zh
bezierVertex(211,536,196,524,191,508);//zi
bezierVertex(189,504,186,496,186,488);//zj
bezierVertex(184,480,182,471,183,460);//zk
bezierVertex(182,450,183,435,185,427);//zl
bezierVertex(184.5,418,187,411.5,188,407);//zm
bezierVertex(189,398,190,392,192,385);//zn
bezierVertex(201,343,221,308,242,282);
bezierVertex(254,268,266,252,277,244);
bezierVertex(286,234,299,226,310,220);
bezierVertex(352,200,398,193,458,184);
endShape();
 
beginShape();
vertex(251,363);
bezierVertex(252,380,248,415,244,434);
bezierVertex(236,480,228,530,224,590);
endShape();
 
beginShape();
vertex(286,342);
bezierVertex(287,380,287,421,284,454);
bezierVertex(288,490,288,548,286,602);
endShape();
 
beginShape();
vertex(308,407);
bezierVertex(306,438,306,467,307,489);
endShape();
 
line(178,385,312,385);
line(244,418,339,418);
 
   
}



