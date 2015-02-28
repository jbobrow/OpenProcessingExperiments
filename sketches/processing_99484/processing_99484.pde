
void setup() {
  size(500, 300);
  smooth();
  frameRate(24);
}

void draw(){
  background(#2E2C4B);
  
  // Sidewalk
  noStroke();
  fill(#C4C4C4);
  rect(0, 275, 500, 25);
  
  //building one
  stroke(0);
  fill(#7E6C6D);
  rect(0, 200, 50, 74);
  fill(#FFC124);
  rect(5, 205, 10, 15);
  rect(20, 205, 10, 15);
  rect(35, 205, 10, 15);
  rect(5, 225, 10, 15);
  rect(20, 225, 10, 15);
  rect(35, 225, 10, 15);
  rect(5, 245, 10, 15);
  fill(#B2840E);
  rect(20, 245, 10, 15);
  fill(#FFC124);
  rect(35, 245, 10, 15);
  
  //building two
  stroke(0);
  fill(#7E6C6D);
  rect(50, 150, 75, 124);
  fill(#FFC124);
  rect(57, 158, 15, 18);
  rect(80, 158, 15, 18);
  fill(#B2840E);
  rect(103, 158, 15, 18);
  rect(57, 189, 15, 18);
  fill(#FFC124);
  rect(80, 189, 15, 18);
  rect(103, 189, 15, 18);
  rect(57, 220, 15, 18);
  rect(80, 220, 15, 18);
  rect(103, 220, 15, 18);
    
  //building three
  stroke(0);
  fill(#7E6C6D);
  rect(125, 180, 65, 94);
  fill(#FFC124);
  rect(131, 185, 13, 13);
  rect(150, 185, 13, 13);
  rect(169, 185, 13, 13);
  rect(131, 208, 13, 13);
  rect(150, 208, 13, 13);
  rect(169, 208, 13, 13);
  rect(131, 231, 13, 13);
  rect(150, 231, 13, 13);
  rect(169, 231, 13, 13);
  
  //building four
  stroke(0);
  fill(#7E6C6D);
  rect(200, 90, 65, 184);
  fill(#FFC124);
  rect(205, 95, 10, 13);
  rect(220, 95, 10, 13);
  fill(#B2840E);
  rect(235, 95, 10, 13);
  fill(#FFC124);
  rect(250, 95, 10, 13);
  rect(205, 118, 10, 13);
  rect(220, 118, 10, 13);
  rect(235, 118, 10, 13);
  fill(#B2840E);
  rect(250, 118, 10, 13);
  fill(#FFC124);
  rect(205, 141, 10, 13);
  rect(220, 141, 10, 13);
  rect(235, 141, 10, 13);
  rect(250, 141, 10, 13);
  rect(205, 164, 10, 13);
  rect(220, 164, 10, 13);
  rect(235, 164, 10, 13);
  rect(250, 164, 10, 13);
  fill(#B2840E);
  rect(205, 187, 10, 13);
  fill(#FFC124);
  rect(220, 187, 10, 13);
  rect(235, 187, 10, 13);
  rect(250, 187, 10, 13);
  rect(205, 210, 10, 13);
  rect(220, 210, 10, 13);
  rect(235, 210, 10, 13);
  rect(250, 210, 10, 13);
  rect(205, 233, 10, 13);
  rect(220, 233, 10, 13);
  fill(#B2840E);
  rect(235, 233, 10, 13);
  fill(#FFC124);
  rect(250, 233, 10, 13);
  rect(205, 256, 10, 13);
  rect(220, 256, 10, 13);
  rect(235, 256, 10, 13);
  rect(250, 256, 10, 13);
  
  //building five
  stroke(0);
  fill(#7E6C6D);
  rect(268, 140, 55, 134);
  fill(#FFC124);
  rect(273, 145, 10, 15); 
  rect(290, 145, 10, 15);
  rect(307, 145, 10, 15);
  fill(#B2840E);
  rect(273, 170, 10, 15);
  fill(#FFC124);
  rect(290, 170, 10, 15);
  rect(307, 170, 10, 15);
  rect(273, 195, 10, 15); 
  rect(290, 195, 10, 15);
  rect(307, 195, 10, 15);
  rect(273, 220, 10, 15);
  fill(#B2840E); 
  rect(290, 220, 10, 15);
  fill(#FFC124);
  rect(307, 220, 10, 15);
  
  //building six
  stroke(0);
  fill(#7E6C6D);
  rect(340, 200, 55, 74);
  fill(#FFC124);
  rect(344, 203, 13, 13);
  fill(#B2840E);
  rect(361, 203, 13, 13);
  fill(#FFC124);
  rect(378, 203, 13, 13);
  rect(344, 225, 13, 13);
  rect(361, 225, 13, 13);
  rect(378, 225, 13, 13);
  rect(344, 247, 13, 13);
  rect(361, 247, 13, 13);
  rect(378, 247, 13, 13);
  
  //building seven
  stroke(0);
  fill(#7E6C6D);
  rect(395, 230, 60, 44);
  fill(#FFC124);
  rect(403, 235, 10, 15);
  rect(422, 235, 10, 15);


  //building eight
  stroke(0);
  fill(#7E6C6D);
  rect(439, 210, 59, 64);
  fill(#FFC124);
  rect(445, 215, 12, 12);
  rect(463, 215, 12, 12);
  rect(481, 215, 12, 12);
  rect(445, 233, 12, 12);
  rect(463, 233, 12, 12);
  rect(481, 233, 12, 12);
  rect(445, 251, 12, 12);
  rect(463, 251, 12, 12);
  rect(481, 251, 12, 12);
  

  //stars
  stroke(255, 255, 255, mouseY-5);
  point(10, 47);
  stroke(255, 255, 255);
  point(43, 27);
  stroke(255, 255, 255, mouseY);
  point(80, 64);
  stroke(255, 255, 255, mouseX+22);
  point(10, 147);
  stroke(255, 255, 255);
  point(43, 127);
  point(120, 104);
  stroke(255, 255, 255, mouseY+50);
  point(103, 17);
  stroke(255, 255, 255);
  point(135, 40);
  stroke(255, 255, 255, mouseX-15);
  point(160, 4);
  stroke(255, 255, 255, mouseX);
  point(193, 47);
  stroke(255, 255, 255);
  point(203, 67);
  stroke(255, 255, 255, mouseX+8);
  point(235, 40);
  stroke(255, 255, 255, mouseX+50);
  point(280, 25);
  point(310, 107);
  stroke(255, 255, 255);
  point(343, 64);
  stroke(255, 255, 255, mouseY+20);
  point(380, 27);
  stroke(255, 255, 255);
  point(395, 94);
  stroke(255, 255, 255, mouseY+18);
  point(425, 130);
  point(460, 70);
  stroke(255, 255, 255, mouseX-20);
  point(493, 47);  
}


