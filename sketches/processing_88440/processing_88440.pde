

int deg;
void setup() {
  size(600, 600);
  smooth();
    deg=0;


}
void draw() {
  background(220, 211, 201);
  rectMode(CORNER);
  stroke(0, 0, 0);
  fill(135, 35, 45);
  rect(width/2, height/2, 40, 40);
  fill(123, 110, 173);
  ellipse(56, 165, 85, 85);
  fill(207, 163, 69);
  beginShape();
  vertex(140, 190);
  vertex(220, 100);
  vertex(250, 220);
  endShape(CLOSE);
  fill(133, 135, 132, 175);
  ellipse(236, 255, 155, 165);
  strokeWeight(4);
  line(215, 230, 40, 40);
  strokeWeight(3);
  line(0, 100, 220, 100);
  strokeWeight(2);
  line(320, 325, 345, 325);
  line(95, 400, 50, 10);
  line(20, 285, 180, 280);
  line(0, 170, 180, 170);
  float circleDiameter = 100;
  if (dist(mouseX,mouseY,width/2,height/2) <= circleDiameter/2) {
    background(random(0,255),random(0,255),random(0,255),random(0,255));
  } else {
    background(220, 211, 201);
 }
 noStroke();
  ellipse(width/2,height/2,circleDiameter,circleDiameter);
  rectMode(CORNER);
  stroke(0, 0, 0);
  fill(135, 35, 45);
  rect(width/2, height/2, 40, 40);
  fill(123, 110, 173);
  ellipse(56, 165, 85, 85);
  fill(207, 163, 69);
  beginShape();
  vertex(140, 190);
  vertex(220, 100);
  vertex(250, 220);
  endShape(CLOSE);
  fill(133, 135, 132, 175);
  ellipse(236, 255, 155, 155);
  strokeWeight(4);
  line(215, 230, 40, 40);
  strokeWeight(3);
  line(0, 100, 220, 100);
  strokeWeight(2);
  line(320, 325, 345, 325);
  line(95, 400, 50, 10);
  line(20, 285, 180, 280);
  line(0, 170, 180, 170);
  pushMatrix();
  fill(207, 163, 69,175);
  translate(width/2,height/2);
  rotate(radians(deg));
  rect(mouseX/12,0,100,100);
  popMatrix();
deg=deg+1;
 
}



