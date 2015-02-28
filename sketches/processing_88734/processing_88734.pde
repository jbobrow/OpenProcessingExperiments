
float rightEyeX = 223;
float rightEyeY = 109;

float leftEyeX = 101;
float leftEyeY = 139;

void setup() {   
  size(485, 330); 
  smooth();
  background(255);
}   

void draw() {   
  //Draw Kumamon Mask
  //start with black head base, ears base
  //mouth white
  //nose 
  //mouth black
  //ears white
  //eye sockets
  //eyebrows
  //blushmarks

  //eyes

  //background(255);
  rectMode(CENTER);
  ellipseMode(CENTER);

  //left ear
  fill(0);
  ellipse(87, 113, 54, 54);

  //left inner ear
  fill(240);
  ellipse(82, 113, 21, 23);

  //head
  //ellipse 1  
  pushMatrix();
  fill(0);
  translate(209, 136);
  rotate(radians(-20));
  ellipse(0, 0, 281, 195);
  popMatrix();
  //ellipse 2
  fill(0);
  ellipse(288, 157, 181, 206);

  //ellipse 3
  pushMatrix();
  fill(0);
  translate(137, 202);
  rotate(radians(-13.7));
  ellipse(0, 0, 123, 206);
  popMatrix();

  //ellipse 4
  fill(0);
  ellipse(140, 274, 83, 83);

  //roundedBox
  pushMatrix();
  fill(0);
  translate(131, 262);
  rotate(radians(-18.7));
  rect(0, 0, 72, 72, 10);
  popMatrix();

  //ellipse 5
  pushMatrix();
  fill(0);
  translate(244, 242);
  rotate(radians(-21));
  ellipse(0, 0, 276, 146);
  popMatrix();

  //roundedBox
  pushMatrix();
  fill(0);
  translate(354, 186);
  rotate(radians(-8.2));
  rect(0, 0, 62, 101, 10);
  popMatrix();

  //ellipse 6
  pushMatrix();
  fill(0);
  translate(319, 236);
  rotate(radians(-16.1));
  ellipse(0, 0, 143, 71);
  popMatrix();

  //ears
  fill(0);
  ellipse(334, 47, 62, 62);

  //right inner ear
  fill(240);
  ellipse(330, 45, 26, 27);

  //right eye
  fill(255);
  ellipse(221, 113, 72, 65);

  //left eye
  pushMatrix();
  fill(255);
  translate(105, 141);
  rotate(radians(17.2));
  ellipse(0, 0, 38, 67);
  popMatrix();

  //mouth white
  pushMatrix();
  fill(240);
  translate(180, 224);
  rotate(radians(-8.8));
  ellipse(0, 0, 162, 140);
  popMatrix();

  //mouth
  //I can't believe I just found this function
  //all that time... (T.T)
  fill(0);
  beginShape();
  curveVertex(103, 240);
  curveVertex(103, 240);
  curveVertex(115, 255);
  curveVertex(144, 263);
  curveVertex(167, 260);
  curveVertex(196, 246);
  curveVertex(219, 222);
  curveVertex(223, 205);
  curveVertex(223, 205);
  endShape();

  //nose
  fill(0);
  beginShape();
  curveVertex(172, 173 );
  curveVertex(172, 173 );
  curveVertex(169, 169);
  curveVertex(147, 170);
  curveVertex(134, 173);
  curveVertex(126, 177);
  curveVertex(123, 184);
  curveVertex(122, 189);
  curveVertex(126, 195);
  curveVertex(131, 200);
  curveVertex(138, 205);
  curveVertex(147, 206);
  curveVertex(156, 204);
  curveVertex(163, 196);
  curveVertex(168, 189);
  curveVertex(171, 185);
  curveVertex(173, 180);
  curveVertex(174, 177);
  curveVertex(173, 174);
  curveVertex(173, 174);
  endShape();

  //blush marks
  pushMatrix();
  fill(150, 0, 0);
  translate(304, 169);
  rotate(radians(-4.6));
  ellipse(0, 0, 68, 84);
  popMatrix();

  pushMatrix();
  fill(150, 0, 0);
  translate(87, 224);
  rotate(radians(-15.7));
  ellipse(0, 0, 9, 76);
  popMatrix();

  //right eye
  fill(0);
  if (mouseX != 0 && mouseY != 0) {
      rightEyeX = map(mouseX, 0, width, 189, 246);  
      rightEyeY = map(mouseY, 0, height, 91, 136);
  }
  ellipse(rightEyeX, rightEyeY, 5, 20);


  //left eye
  fill(0);
  if (mouseX != 0 && mouseY != 0 && mouseX < width && mouseY < height) {
    leftEyeX = map(mouseX, 0, width, 87, 121);  
    leftEyeY = map(mouseY, 0, height, 126, 162);
  }
  ellipse(leftEyeX, leftEyeY, 5, 20);
} 



