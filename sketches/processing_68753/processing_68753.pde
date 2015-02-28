
void setup(){
 size(500,500);
 rectMode(CENTER);
 textAlign(CENTER);
 smooth();
}
 
void draw(){
  background(map(mouseX,0,500,200,255),map(mouseY,0,500,100,200),
             map(mouseX,0,500,200,255));
   
  //shirt
  stroke(0);
  fill(0);
  beginShape();
  curveVertex(112,500);
  curveVertex(130,500);
  curveVertex(150,450);
  curveVertex(200,412);
  curveVertex(300,380);
  curveVertex(362,404);
  curveVertex(420,430);
  curveVertex(450,500);
  curveVertex(437,500);
  endShape();
 
  //face
  strokeWeight(4);
  stroke(0);
  fill(255,215,188);
  beginShape();
  curveVertex(132,175);
  curveVertex(132,175);
  curveVertex(134,182);
  curveVertex(139,202);
  curveVertex(138,211);
  curveVertex(134,237);
  curveVertex(131,243);
  curveVertex(123,256);
  curveVertex(129,266);
  curveVertex(138,270);
  curveVertex(141,274);
  curveVertex(139,284);
  curveVertex(141,289);
  curveVertex(138,296);
  curveVertex(143,307);
  curveVertex(141,314);
  curveVertex(137,318);
  curveVertex(135,325);
  curveVertex(138,335);
  curveVertex(147,340);
  curveVertex(161,343);
  curveVertex(193,341);
  curveVertex(202,362);
  curveVertex(216,391);
  curveVertex(211,405);
  curveVertex(201,413);
  curveVertex(197,437);
  curveVertex(198,458);
  curveVertex(191,475);
  curveVertex(196,479);
  curveVertex(224,473);
  curveVertex(252,471);
  curveVertex(273,465);
  curveVertex(288,448);
  curveVertex(313,430);
  curveVertex(334,420);
  curveVertex(363,409);
  curveVertex(340,389);
  curveVertex(326,368);
  curveVertex(297,290);
  curveVertex(332,267);
  curveVertex(368,175);
  curveVertex(302,83);
  curveVertex(208,67);
  curveVertex(124,146);
  curveVertex(132,175);
  curveVertex(132,175);
  endShape();
  //end face
   
  strokeWeight(4);
 //hair
  stroke(67,41,1);
  fill(106,64,1);
  beginShape();
  curveVertex(124,196);
  curveVertex(124,196);
  curveVertex(115,164);
  curveVertex(127,112);
  curveVertex(176,62);
  curveVertex(225,45);
  curveVertex(264,44);
  curveVertex(299,48);
  curveVertex(354,72);
  curveVertex(381,105);
  curveVertex(398,167);
  curveVertex(400,192);
  curveVertex(392,246);
  curveVertex(332,293);
  curveVertex(310,300);
  curveVertex(264,284);
  curveVertex(286,275);
  //curveVertex(295,270);
  curveVertex(296,247);
  curveVertex(291,240);
  curveVertex(303,226);
  //curveVertex(306,216);
  curveVertex(310,205);
  //curveVertex(308,190);
  curveVertex(305,176);
  curveVertex(290,168);
  curveVertex(277,170);
  curveVertex(264,184);
  curveVertex(247,189);
  curveVertex(227,190);
  curveVertex(205,183);
  curveVertex(187,170);
  curveVertex(176,153);
  curveVertex(170,137);
  curveVertex(161,117);
  //curveVertex(151,133);
  curveVertex(135,154);
  //curveVertex(136,173);
  curveVertex(124,196);
  curveVertex(124,196);
  endShape();
  beginShape();
  curveVertex(162,118);
  curveVertex(162,118);
  //curveVertex(175,100);
  curveVertex(198,86);
  curveVertex(198,86);
  endShape();
  //end hair
   
  //eyebrow
  beginShape();
  curveVertex(143,202);
  curveVertex(143,202);
  curveVertex(142,197);
  curveVertex(146,191);
  curveVertex(177,187);
  curveVertex(178,189);
  curveVertex(184,189);
  curveVertex(150,195);
  //curveVertex(149,200);
  curveVertex(143,202);
  curveVertex(143,202);
  endShape();
   
  //nostril
  stroke(0);
  fill(0);
  strokeWeight(1);
  beginShape();
  curveVertex(133,261);
  curveVertex(133,261);
  curveVertex(134,260);
  curveVertex(136,259);
  curveVertex(139,258);
  curveVertex(147,262);
  curveVertex(141,261);
  curveVertex(139,262);
  curveVertex(133,261);
  curveVertex(133,261);
  endShape();
   
  //lip
  stroke(255,100,255);
  fill(255,100,255);
  beginShape();
  curveVertex(141,287);
  curveVertex(141,287);
  curveVertex(146,290);
  curveVertex(153,288);
  curveVertex(152,287);
  curveVertex(151,285);
  curveVertex(149,288);
  curveVertex(147,287);
  curveVertex(139,284);
  curveVertex(141,287);
  curveVertex(141,287);
  endShape();
   
  //jaw
  stroke(0);
  strokeWeight(4);
  beginShape();
  curveVertex(191,340);
  curveVertex(191,340);
  curveVertex(205,338);
  curveVertex(205,338);
  endShape();
   
  //pierce body
  stroke(150);
  fill(200);
  beginShape();
  vertex(276,178);
  vertex(280,174);
  vertex(303,184);
  vertex(305,192);
  vertex(276,178);
  //vertex();
  endShape();
   
  //pierce top
  ellipse(271,173,6,6);
   
  //pierce bottom
  ellipse(312,191,6,6);
   
  //eye
  stroke(0);
  strokeWeight(3);
  fill(0);
  line(map(mouseX,0,500,130,170),map(mouseY,0,500,180,220),map(mouseX,0,500,150,190),map(mouseY,0,500,200,240));
  line(map(mouseX,0,500,130,170),map(mouseY,0,500,200,240),map(mouseX,0,500,150,190),map(mouseY,0,500,180,220));
  //text("LOL",162,216);
   
   
   
   
   
}
