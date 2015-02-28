
void setup() {
  size(640, 360);
  background(231,224,205);
  ellipseMode(CENTER);
  smooth();
  noStroke();
}
 
void draw() {
  fill(226, 213, 158);
  quad(613, 52, 640, 42, 638, 66, 613, 76);
  fill(158, 138, 131);
  quad(549, 8, 740, -40, 640, 42, 612, 51);
  fill(51, 48, 42);
  quad(525, 14, 549, 8, 612, 52, 614, 74);
  //bleu
  fill(124, 166, 200);
  triangle(419, 0, 580, 0, 432, 36);
  //ellipse noir
  fill(35, 35, 35);
  ellipse(258, 76, 380, 380);
  //rouge
  fill(214, 55, 48);
  quad(151, 0, 181, 0, 34, 360, 6, 360);
  stroke(194,188,160);
  //blanc
  fill(229, 222, 204);
  quad(180, 0, 225, 0, 82, 360, 35, 360);
  noStroke();
  //gris
  fill(165, 167, 160);
  quad(9, 153, 343, 74, 351, 111, 18, 188);
  
  //gris
  fill(219, 186, 86);
  beginShape();
  vertex(54,98);
  vertex(259,48);
  vertex(280,140);
  vertex(234,151);
  vertex(223,103);
  vertex(64,140);
  endShape(CLOSE);
  
}               
