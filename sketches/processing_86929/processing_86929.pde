

void setup(){
  size(640,480);
  background(209,206,175);
  smooth();
}

void draw(){
  noStroke();
  fill(186,189,170, 200);
  quad(0,0, 640,0, 640,377, 0,361); 
  
  fill(178,185,169);
  beginShape();
  curveVertex(0,  0);
  curveVertex(0,  0);
  curveVertex(0,  176);
  curveVertex(0,  176);
  curveVertex(289,  289);
  curveVertex(432,  306);
  curveVertex(527,  288);
  curveVertex(562, 237);
  curveVertex(561, 191);
  curveVertex(561, 191);
  curveVertex(640, 198);
  curveVertex(640, 198);
  curveVertex(width, 0);
  curveVertex(width, 0);
  endShape();
  
  fill(146,141,119, 200);
  quad(0,480, 640,231, 640,252, 86,480); 
  
  fill(146,141,119, 200);
  quad(0,240, 640,70, 640,90, 0,267);
 
  fill(146,141,119, 200);
  quad(0,90, 522,0, 584,0, 0,117); 
  
  stroke(170,174,153);
  strokeWeight(2);
  line(50,21, 640,184);
  line(0,34, 460,190);
  line(0,72, 374,192);
  line(0,255, 459,386);
  line(487,221, 640,258);
  line(358,7, 545,64);
  line(372,0, 372,13);
  line(441,0, 441,5);
  line(516,0, 516,22);
  line(599,0, 595,38);
  
  noStroke();
  fill(9,79,128);
  beginShape();
  vertex(0, 90);
  vertex(305, 102);
  vertex(400, 55);
  vertex(640, 70);
  vertex(640, 85);
  vertex(568, 104);
  vertex(640, 110);
  vertex(640, 132);
  vertex(436, 134);
  vertex(331, 166);
  vertex(141, 169);
  vertex(236, 127);
  vertex(0, 130);
  endShape(CLOSE);
  
  stroke(165, 40, 55);
  strokeWeight(4);
  noFill();
  bezier(525, 155,  338, 147,  254, 44,  289, 0);  
  
  noStroke();
  fill(0);
  quad(624,45, 640,49, 640,110, 632,107);
  quad(490,16, 542,29, 524,75, 499,67);
  quad(383,0, 419,0, 409,38, 387,30);
  triangle(300,0, 316,0, 314,7);
  
  fill(244, 179, 49);
  quad(551,30, 612,44, 591,97, 553,85);
  quad(428,0, 471,8, 461,57, 435,48);
  quad(340,0, 362,0, 355,21, 340,16);
  
  
  
  noFill();
  stroke(0);
  strokeWeight(4);
  line(106,427, 306,480);
  line(455,480, 640,417);
  line(93,317, 396,371);
  line(396,371, 640,302);
  line(640,302, 457,230);
  
  line(352,146, 640,231);
  bezier(352,146, 221,95, 247,36, 471,8);
  
  line(212,132, 640,277);
  line(471,8, 640,6);
  bezier(212,132, 84,89, 115,16, 471,8);
  

  stroke(165, 40, 55);
  strokeWeight(20);
  bezier(337,56, 359,50, 395,55, 420,48);
  

}


