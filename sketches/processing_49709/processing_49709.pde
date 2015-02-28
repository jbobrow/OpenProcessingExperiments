
void setup()
{
  size(640 , 480);
  background(255);
  smooth();
  
  fill(#72390F);
  
  //back arm
  beginShape();
  vertex(263,267);
  curveVertex(263,267);
  curveVertex(268,270);
  curveVertex(275,276);
  curveVertex(280,280);
  vertex(280,280);
  vertex(286,292);
  vertex(279,288);
  vertex(282,300);
  vertex(273,291);
  vertex(270,302);
  vertex(262,290);
  curveVertex(262,290);
  curveVertex(257,286);
  curveVertex(250,281);
  curveVertex(244,260);
  vertex(244,260);
  endShape(CLOSE);
  
  fill(#FFFFFF);
  
  //back foot
  beginShape();
  vertex(242,330);
  curveVertex(242,330);
  curveVertex(246,336);
  curveVertex(249,243);
  curveVertex(250,350);
  vertex(250,350);
  vertex(258,358);
  vertex(252,358);
  vertex(258,366);
  vertex(246,366);
  vertex(250,371);
  vertex(231,371);
  vertex(230,362);
  curveVertex(230,362);
  curveVertex(228,356);
  curveVertex(222,348);
  curveVertex(218,344);
  vertex(218,344);
  endShape(CLOSE);
  
   //front foot
  beginShape();
  vertex(211,345);
  curveVertex(211,345);
  curveVertex(213,350);
  curveVertex(216,356);
  curveVertex(218,361);
  vertex(218,361);
  vertex(227,368);
  vertex(219,368);
  vertex(225,377);
  vertex(214,375);
  vertex(221,383);
  vertex(190,380);
  vertex(186,375);
  curveVertex(186,375);
  curveVertex(186,363);
  curveVertex(188,347);
  curveVertex(187,329);
  vertex(187,329);
  endShape(CLOSE);
  
  fill(#72390F);
  ellipse(215,297,82,112);
  
  
     //front arm
  beginShape();
  vertex(210,280);
  curveVertex(210,280);
  curveVertex(203,297);
  curveVertex(203,320);
  curveVertex(205,332);
  vertex(205,332);
  vertex(205,346);
  vertex(195,337);
  vertex(195,349);
  vertex(186,340);
  vertex(186,353);
  vertex(175,343);
  vertex(170,353);
  curveVertex(170,353);
  curveVertex(166,339);
  curveVertex(170,295);
  curveVertex(186,266);
  vertex(186,266);
  endShape(CLOSE);
  
  noStroke();
  fill(#FFFFFF);
  //front arm stripe
  beginShape();
  vertex(202,308);
  curveVertex(202,308);
  curveVertex(202,314);
  curveVertex(203,322);
  curveVertex(203,325);
  vertex(203,325);
  curveVertex(203,325);
  curveVertex(191,322);
  curveVertex(177,322);
  curveVertex(165,328);
  vertex(165,328);
  curveVertex(165,328);
  curveVertex(165,323);
  curveVertex(166,314);
  curveVertex(166,311);
  vertex(166,311);
  curveVertex(166,311);
  curveVertex(172,306);
  curveVertex(191,304);
  curveVertex(202,308);
  vertex(202,308);
  endShape(CLOSE);
  
  stroke(#231F20);
   fill(#EF9D43);
  //backEar
  beginShape();
  vertex(251,189);
  curveVertex(251,189);
  curveVertex(273,171);
  curveVertex(299,162);
  curveVertex(327,164);
  vertex(327,164);
  curveVertex(327,164);
  curveVertex(321,169);
  curveVertex(315,177);
  curveVertex(314,183);
  vertex(314,183);
  curveVertex(314,183);
  curveVertex(313,189);
  curveVertex(308,200);
  curveVertex(301,206);
  vertex(301,206);
  curveVertex(301,206);
  curveVertex(291,207);
  curveVertex(280,208);
  curveVertex(273,210);
  vertex(273,210);
 
  endShape(CLOSE);
  
  
  fill(#72390F);
  //head 
  beginShape();
  vertex(160,200);
  vertex(224,170);
  vertex(290,184);
  vertex(298,248);
  vertex(210,287); 
  vertex(164,261);
  endShape(CLOSE);
  
  //headspot
   noStroke();
  fill(#FFFFFF);
  beginShape();
  vertex(193,185);
  curveVertex(193,185);
  curveVertex(213,180);
  curveVertex(236,180);
  curveVertex(249,198);
  vertex(249,198);
  curveVertex(239,198);
  curveVertex(243,206);
  curveVertex(232,210);
  curveVertex(221,215);
  vertex(221,215);
  curveVertex(221,215);
  curveVertex(212,217);
  curveVertex(202,208);
  curveVertex(195,197);
  vertex(195,197);
  curveVertex(195,197);
  curveVertex(192,194);
  curveVertex(190,188);
  curveVertex(193,185);
  vertex(193,185);
  endShape(CLOSE);
  
  stroke(#231F20);
  fill(#EF9D43);
  //frontEar
  beginShape();
  vertex(195,209);
  curveVertex(195,209);
  curveVertex(164,206);
  curveVertex(137,210);
  curveVertex(112,226);
  vertex(112,226);
  curveVertex(112,226);
  curveVertex(121,227);
  curveVertex(128,230);
  curveVertex(132,228);
  vertex(132,228);
  curveVertex(132,228);
  curveVertex(132,243);
  curveVertex(138,252);
  curveVertex(147,255);
  vertex(147,255);
  curveVertex(147,255);
  curveVertex(146,259);
  curveVertex(151,265);
  curveVertex(153,266);
  vertex(153,266);
  curveVertex(153,266);
  curveVertex(160,267);
  curveVertex(165,265);
  curveVertex(170,260);
  vertex(170,260);
  curveVertex(170,260);
  curveVertex(172,257);
  curveVertex(183,252);
  curveVertex(195,251);
  vertex(195,251);
  endShape(CLOSE);
  
  fill(#EF9D43);
  stroke(#EF9D43);
  ellipse(267,265,31,22);
  
  fill(#231F20);
  stroke(#231F20);
  ellipse(292,230,16,22);
  ellipse(238,247,20,22);
  ellipse(270,258,16,11);
}


