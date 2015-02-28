
void setup() {
  size(510, 400);
  background(180);

  noStroke();
  //first black
  beginShape();
  fill(0);
  vertex(0, 70);
  vertex(0, 205);
  vertex(385, 400);
  vertex(510, 320);
  endShape(CLOSE);

  rect(385, 320, 125, 400);

  //second black
  beginShape();
  vertex(340, 0);
  vertex(470, 0);
  vertex(290, 400);
  vertex(160, 400);
  endShape(CLOSE);

  //first red
  beginShape();
  fill(255, 0, 0, 180);
  vertex(0, 100);
  vertex(0, 0);
  vertex(80, 0);
  vertex(510, 375);
  vertex(510, 400);
  vertex(340, 400);
  endShape();

  //second red
  beginShape();
  vertex(405, 0);
  vertex(510, 0);
  vertex(510, 35);
  vertex(250, 400);
  vertex(90, 400);
  endShape();

  //NE triangle
  fill(209, 42, 36, 200);
  triangle(250, 195, 272, 170, 359, 245);

  //NW triangle
  
  triangle(211, 288, 250, 195, 191, 270); 
  
  //SE triangle
  fill(28, 5, 4, 200);
  triangle(359, 245, 308, 360, 285, 352);

  //SW triangle
  triangle(201, 307, 211, 288, 285, 352);

  

  //center polygon
  beginShape();
  fill(100, 0, 0, 255);
  vertex(250, 195);
  vertex(359, 245);
  vertex(285, 351);
  vertex(210, 290);
  endShape();

  //circle
  fill(255, 100);
  ellipse(180, 157, 250, 250);


  beginShape();
  fill(216, 161, 81, 80);
  vertex(252, 193);
  vertex(266, 162);
  vertex(128, 42);
  vertex(69, 104);
  endShape();

  //bottom arc
  beginShape();
  vertex(191, 270);
  vertex(252, 193);
  vertex(69, 104);
  vertex(56, 150);
  endShape();
}


