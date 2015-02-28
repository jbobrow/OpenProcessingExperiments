
void setup() {
  size(183, 275);
  background(20,6,2);
  smooth();
}

void draw() {
  noStroke();
  //green shape right
  fill(85, 99, 39);
  beginShape();
  vertex(183, 103);
  vertex(126, 97);
  vertex(60, 166);
  vertex(182, 177);
  endShape(CLOSE);
  beginShape();
  vertex(0, 77);
  vertex(32, 168);
  vertex(0, 166);
  endShape(CLOSE);


  //brown stroke
  fill(68, 40, 34);
  beginShape();
  vertex(0, 0);
  vertex(8, 0);
  vertex(13, 60);
  vertex(116, 81);
  vertex(109, 89);
  vertex(3, 70);
  vertex(45, 160);
  vertex(120, 91);
  vertex(127, 97);
  vertex(121, 107);
  vertex(111, 111);
  vertex(110, 120);
  vertex(95, 132);
  vertex(85, 140);
  vertex(76, 166);
  vertex(183, 177);
  vertex(183, 183);
  vertex(0, 168);
  vertex(0, 163);
  vertex(27, 164);
  vertex(0, 76);
  vertex(0, 0);
  endShape(CLOSE);

  //white shape
  fill(209, 206, 170);
  beginShape();
  vertex(8, 0);
  vertex(13, 60);
  vertex(116, 81);
  vertex(50, 65);
  vertex(34, 56);
  vertex(89, 22);
  vertex(98, 0);
  endShape(CLOSE);

  //blue shape
  fill(150, 189, 162);
  beginShape();
  vertex(23, 0);
  vertex(23, 41);
  vertex(40, 44);
  vertex(41, 0);
  endShape(CLOSE);

  //brownsecond
  fill(38, 21, 16);
  beginShape();
  curveVertex(98, 0);
  curveVertex(98, 0);
  curveVertex(89, 22);
  curveVertex(38, 50);
  curveVertex(33, 56);
  curveVertex(33, 58);
  curveVertex(51, 59);
  curveVertex(127, 27);
  curveVertex(106, 17);
  curveVertex(106, 0);
  curveVertex(106, 0);
  endShape(CLOSE);

  //greenish shape
  fill(90, 152, 101);
  beginShape();
  vertex(106, 0);
  vertex(106, 17);
  vertex(127, 27);
  vertex(126, 29);
  vertex(152, 33);
  vertex(153, 0);
  endShape(CLOSE);

  //blue shape
  fill(150, 189, 162);
  beginShape();
  vertex(153, 0);
  vertex(152, 33);
  vertex(162, 28);
  vertex(162, 0);
  endShape(CLOSE);

  //green shape
  fill(71, 99, 50);
  beginShape();
  vertex(162, 0);
  vertex(162, 28);
  vertex(183, 30);
  vertex(183, 0);
  endShape(CLOSE);
  

  //white shape underneath green
  fill(168, 171, 149);
  beginShape();
  vertex(152, 33);
  vertex(162, 28);
  vertex(183, 30);
  vertex(183, 42);
  vertex(159, 41);
  endShape(CLOSE);

  //yellow shape
  fill(205, 166, 19);
  beginShape();
  vertex(50, 60);
  vertex(127, 28);
  vertex(154, 36);
  vertex(183, 54);
  vertex(183, 91);
  vertex(72, 74);
  vertex(50, 65);
  endShape(CLOSE);

  //Green circles
  fill(69, 99, 39);
  ellipse(73, 57, 20, 12);
  ellipse(122, 55, 17, 14);
  ellipse(168, 71, 17, 11);

  //red triangle
  fill(219, 106, 46);
  beginShape();
  vertex(4, 70);
  vertex(110, 89);
  vertex(45, 160);
  endShape(CLOSE);

  //white stroke
  fill(203, 183, 147);
  beginShape();
  vertex(45, 160);
  vertex(115, 85);
  vertex(183, 94);
  vertex(183, 99);
  vertex(119, 90);
  vertex(65, 149);
  endShape(CLOSE);

  //yellow dots
  fill(205, 166, 19);
  ellipse(128, 109, 15, 15);
  ellipse(102, 135, 15, 15);
  ellipse(88, 160, 15, 15);
  ellipse(140, 165, 15, 15);
  ellipse(146, 146, 15, 15);
  ellipse(161, 125, 15, 15);
  ellipse(178, 159, 15, 15);
  ellipse(0,132,13,14);
  ellipse(6, 153, 15, 15);

  //Red dots
  fill(132, 23, 17);
  beginShape();
  curveVertex(115, 120);
  curveVertex(115, 120);
  curveVertex(132, 133);
  curveVertex(126, 139);
  curveVertex(115, 125);
  curveVertex(115, 125);
  endShape(CLOSE);
  ellipse(161, 121, 8, 7);
  ellipse(179, 157, 7, 7);
  
  //red line
  fill(144, 46, 18);
  beginShape();
  vertex(0,170);
  vertex(183,183);
  vertex(183,190);
  vertex(0,176);
  endShape(CLOSE);
  beginShape();
  vertex(0,212);
  vertex(54,195);
  vertex(183,208);
  vertex(183,212);
  vertex(54,203);
  vertex(0,218);
  endShape(CLOSE);
  
  //pale blue line bottom
  fill(170,183,169);
  beginShape();
  vertex(0,239);
  vertex(183,232);
  vertex(183,250);
  vertex(0,249);
  endShape(CLOSE);
  
  //green strokes bottom
  fill(86,102,70);
  for (int i=12; i<800; i+=14) {
    beginShape();
    vertex(i,231);
    vertex(i+3,227);
    vertex(i+8,250);
    vertex(i+3,250);
    endShape(CLOSE);
  }
   beginShape();
  vertex(0, 239);
  vertex(5, 239);
  vertex(11, 249);
  vertex(0, 249);
  endShape(CLOSE);
  //yellow lines down 
  fill(231,185,16);
  for (int i=27; i<800; i+=14){
    beginShape();
    vertex(i,258);
    vertex(i+7,259);
    vertex(i,275);
    vertex(i-9,275);
    endShape(CLOSE);
  }
  beginShape();
  vertex(5,261);
  vertex(23,261);
  vertex(14,275);
  vertex(0,275);
  endShape(CLOSE);
  
}  

 



