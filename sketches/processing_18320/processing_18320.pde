
size(751,981);

//quad(100,100, 100,200, 200,200, 200,100);
smooth();

//backmost layer
fill(37,9,6);
beginShape();
vertex(178,100);
vertex(184,886);
vertex(622,933);
vertex(610,447);
vertex(271,105);
endShape(CLOSE);

//Light Red face
fill(93,33,25);
beginShape();
vertex(205,351);
vertex(209,850);
vertex(613,895);
vertex(602,451);
vertex(263,103);
vertex(193,94);
vertex(194,184);
endShape(CLOSE);

stroke(124,74,63);
strokeWeight(4);
//FIRE (top)
noFill();
//F
beginShape();
vertex(336-5,788-222);
vertex(363-5,792-222);
vertex(336-5,788-222);
vertex(336-5,806-222);
vertex(357-5,809-222);
vertex(336-5,806-222);
vertex(336-5,825-222);
endShape();
//I
line(391-5,793-222, 387-5,830-222);
//R
beginShape();
vertex(418-5,796-222);
vertex(414-5,836-222);
vertex(418-5,796-222);
vertex(440-5,799-222);
vertex(444-5,802-222);
vertex(448-5,810-222);
vertex(444-5,815-222);
vertex(440-5,821-222);
vertex(414-5,815-222);
vertex(430-5,817-222);
vertex(442-5,837-222);
endShape();
//E
beginShape();
vertex(495-5,807-222);
vertex(468-5,803-222);
vertex(467-5,839-222);
vertex(494-5,843-222);
vertex(467-5,839-222);
vertex(469-5,820-222);
vertex(491-5,824-222);
endShape();


//FIRE (bottom)
//F
beginShape();
vertex(336,788);
vertex(363,792);
vertex(336,788);
vertex(336,806);
vertex(357,809);
vertex(336,806);
vertex(336,825);
endShape();
//I
line(391,793, 387,830);
//R
beginShape();
vertex(418,796);
vertex(414,836);
vertex(418,796);
vertex(440,799);
vertex(444,802);
vertex(448,810);
vertex(444,815);
vertex(440,821);
vertex(414,815);
vertex(430,817);
vertex(442,837);
endShape();
//line(418,796, 440,799);
//E
beginShape();
vertex(495,807);
vertex(468,803);
vertex(467,839);
vertex(494,843);
vertex(467,839);
vertex(469,820);
vertex(491,824);
endShape();

//xOrig:336 xNew: 331 xDiff = 5
//yorig:788 yNew: 566 yDiff = 222

noStroke();
//light casing (dark)
fill(124,108,95);
beginShape();
vertex(257,652);
vertex(259,730);
vertex(559,768);
vertex(595,732);
vertex(296,699);
vertex(292,613);
endShape(CLOSE);

//light casing (light silver)
fill(182,178,169);
beginShape();
vertex(293,609);
vertex(296,699);
vertex(592,733);
vertex(586,631);
vertex(571,631); //top right of grey
vertex(581,712);//bottom right
vertex(305,685);//bottom left
vertex(304,609);//top left
endShape(CLOSE);

//black light front
fill(62,48,45);
beginShape();
vertex(571,631); 
vertex(581,712);
vertex(305,685);
vertex(304,609);
endShape(CLOSE);

//Bell bottom circle
fill(28,8,7);
ellipse(419,275, (462-643)*2.5,(462-643)*2.5);

//Bell top circle
fill(87,22,16);
ellipse(462,275, (462-643)*2.5,(462-643)*2.5);

/*//bell embellishment
fill(117,49,38);
ellipse(470,240, (470-649)*2,(470-649)*2);*/


//Bell nut
fill(68,54,51);
ellipse(462,270, 462-478,462-478);

