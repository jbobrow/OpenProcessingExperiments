
void setup(){
  
  size(500,650);
  background(0);
  smooth();
  noStroke();
  noLoop();
  
  fill(#0E244B);
  beginShape();
  vertex(255,90);
  bezierVertex(327,135,425,288,194,335);
  vertex(128,224);
  bezierVertex(173,128,365,218,244,110);
  endShape();
  
  strokeWeight(2);
  stroke(#16325A);
  fill(#152F55,245);
  beginShape();
  vertex(160,191);
  bezierVertex(378,104,230,377,144,359);
  endShape();
  
  strokeWeight(.5);
  stroke(#0D2143);
  fill(#0E244B);
  beginShape();
  curveVertex(192,94);
  curveVertex(192,94);
  curveVertex(203,73);
  curveVertex(252,74);
  curveVertex(265,90);
  curveVertex(260,103);
  curveVertex(242,115);
  curveVertex(215,117);
  curveVertex(192,94);
  curveVertex(192,94);
  endShape();
  
  fill(#8C846D,220);
  beginShape();
  vertex(192,94);
  vertex(162,107);
  vertex(198,109);
  vertex(215,108);
  vertex(215,100);
  vertex(221,93);
  vertex(202,96);
  vertex(204,86);
  vertex(192,94);
  endShape();
  
  strokeWeight(1);
  stroke(#F8FCDE);
  noFill();
  bezier(235,71,240,73,250,28,242,25);
  bezier(246,72,250,73,270,40,257,20);
  bezier(256,75,263,75,290,35,277,17);
  
  strokeWeight(2);
  stroke(#163C9B);
  fill(#0E244B);
  triangle(245,31,235,21,246,17);
  triangle(261,29,252,20,262,14);
  triangle(280,27,268,16,280,10);
  
  strokeWeight(2);
  stroke(#70787E);
  fill(#FCFCF2,240);
  ellipse(234,86,22,14);
  noStroke();
  fill(#000000,240);
  ellipse(230,85.5,13,9);

}

void draw(){
  noStroke();
  feather(212,175);
  translate(-194,191);
  scale(1.25);
  rotate(-PI/5);
  feather(212,175);
  translate(58,-146);
  scale(1.25);
  rotate(PI/10);
  feather(212,175);
  translate(-190,70);
  scale(1.3);
  rotate(-PI/10);
  feather(212,175);
  translate(-190,70);
  scale(1.3);
  rotate(-PI/10);
  feather(212,175);
  translate(-190,70);
  scale(1.35);
  rotate(-PI/10);
  feather(212,175);
  translate(-205,73);
  scale(1.4);
  rotate(-PI/10);
  feather(212,175);
  translate(-218,73);
  scale(1.45);
  rotate(-PI/10);
  feather(212,175);
  translate(-210,73);
  scale(1.4);
  rotate(-PI/10);
  feather(212,175);
  
  translate(575,70);
  scale(.8);
  rotate(PI/2);
  feather(212,175);
  translate(-190,100);
  scale(1.35);
  rotate(-PI/8);
  feather(212,175);
  translate(-210,100);
  scale(1.45);
  rotate(-PI/8);
  feather(212,175);
  translate(-225,100);
  scale(1.5);
  rotate(-PI/8);
  feather(212,175);
  translate(-235,90);
  scale(1.5);
  rotate(-PI/8);
  feather(212,175);
  translate(-200,80);
  scale(1.3);
  rotate(-PI/8);
  feather(212,175);
  
  translate(550,150);
  scale(.7);
  rotate(PI/2);
  feather(212,175);
  translate(-190,100);
  scale(1.35);
  rotate(-PI/8);
  feather(212,175);
  translate(-210,100);
  scale(1.45);
  rotate(-PI/8);
  feather(212,175);
  translate(-225,100);
  scale(1.5);
  rotate(-PI/8);
  feather(212,175);
  
  translate(390,-110);
  scale(.9);
  rotate(PI/3);
  feather(212,175);
  translate(-190,100);
  scale(1.35);
  rotate(-PI/8);
  feather(212,175);
  translate(-210,100);
  scale(1.45);
  rotate(-PI/8);
  feather(212,175);
  translate(-235,70);
  scale(1.5);
  rotate(-PI/8);
  feather(212,175);
  translate(-180,24);
  scale(1.35);
  rotate(-PI/15);
  feather(212,175);
  translate(280,-13);
  scale(.85);
  rotate(PI/6);
  feather(212,175);
  
}

void feather(int x, int y) {
  noStroke();
  fill(#00370D,230);
  beginShape();
  vertex(212,175);
  bezierVertex(217,240,155,218,125,225);
  bezierVertex(125,245,140,160,212,175);
  endShape();
  
  fill(#808A00,220);
  beginShape();
  curveVertex(193,185);
  curveVertex(193,185);
  curveVertex(199,192);
  curveVertex(184,207);
  curveVertex(163,215);
  curveVertex(154,207);
  curveVertex(173,188);
  curveVertex(193,185);
  curveVertex(193,185);
  endShape();
  
  fill(#974500,210);
  scale(.8);
  translate(45,50);
  beginShape();
  curveVertex(193,185);
  curveVertex(193,185);
  curveVertex(199,192);
  curveVertex(184,207);
  curveVertex(163,215);
  curveVertex(154,207);
  curveVertex(173,188);
  curveVertex(193,185);
  curveVertex(193,185);
  endShape(); 
  
  strokeWeight(1.5);
  stroke(#002C02);
  fill(#002C02);
  bezier(189,208,193,213,185,235,187,240);
  stroke(#001F01);
  fill(#001F01);
  bezier(175,220,179,223,165,245,165,255);
  stroke(#001F01);
  fill(#001F01);
  bezier(155,223,159,233,135,255,130,265);
  stroke(#000F01);
  fill(#000F01);
  bezier(140,223,132,226,124,255,120,250);
  
  stroke(#002C02);
  fill(#002C02);
  bezier(178,180,180,177,140,168,135,165);
  stroke(#001F01);
  fill(#001F01);
  bezier(160,187,158,183,101,182,97,178);
  stroke(#001F01);
  fill(#001F01);
  bezier(143,198,140,195,96,215,100,210);
  
  strokeWeight(2);
  stroke(#5766B4);
  fill(#3F04AF);
  beginShape();
  vertex(192,192);
  bezierVertex(191,190,188,208,176,197);
  bezierVertex(176,197,173,190,192,192);
  endShape();
  
  noStroke();
  fill(#000000);
  beginShape();
  vertex(189,193);
  bezierVertex(189,193,186,202,180,197);
  bezierVertex(180,197,179,194,189,193);
  endShape();

}

