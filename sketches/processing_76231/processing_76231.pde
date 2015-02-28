
void setup() {
  size(450, 600);
}

void draw() {
  smooth();
  float ang2 =  .02 * (1-sin(millis()/100.0));
  float ang3 =  0.2 * (sin(millis()/1111.0));
  float ang4 =  0.2 * (7.5-sin(millis()/200.0));
  float noise1 = noise(millis()/900.0 ); 
  float y1 = map(noise1, 0,1,  -20,40); 
  background(30);
  fill(120);
  ellipse(370, 450, 120, 200);
  fill(30, 50, 40);
  rect(0, 450, 450, 150);

  //Head
  pushMatrix();
  translate(260, 50+y1);
  strokeWeight(3);
   fill(100, 255, 100);
  quad(-5, 130, 10, 110, 20, 110, 5, 135); 
  ellipse(50, 50, 150, 150);
  fill(255, 150, 150);
  triangle(40, 30, 20, 50, 45, 65);
  fill(0);
  ellipse(10, 10, 20, 20);
  ellipse(80, 40, 20, 20);
  line(5, -5, 30, 10);
  line(70, 27, 100, 35);
  popMatrix();

  //Right arm
  pushMatrix();
  translate(60, -10+y1);
  rotate(ang2);
   fill(100, 255, 100);
  beginShape();
  vertex(310, 250);
  vertex(290, 270);
  vertex(340, 310);
  vertex(365, 160);
  vertex(330, 270);
  endShape(CLOSE);
  popMatrix();

  //Left arm
  pushMatrix();
  translate(50, y1);
   fill(100, 255, 100);
  rotate(ang2);
  beginShape();
  vertex(100, 185);
  vertex(110, 210);
  vertex(50, 250);
  vertex(30, 120);
  vertex(70, 210);
  endShape(CLOSE);
  popMatrix();
  
  //Tail thing
  pushMatrix();
  strokeWeight(1.5);
  translate(250, 295+y1);
  rotate(ang4);
  scale(2);
  fill(100, 255, 100);
  lowerT();
  popMatrix();
  
  //Body
  strokeWeight(3);
  pushMatrix();
  translate(50, y1);
  fill(150, 50, 50);
  beginShape();
  vertex(150, 160);
  vertex(280, 200);
  vertex(330, 240);
  vertex(290, 280);
  vertex(280, 250);
  vertex(260, 360);
  vertex(100, 320);
  vertex(130, 200);
  vertex(100, 230);
  vertex(90, 200);
  vertex(80, 180);
  endShape(CLOSE);
  popMatrix();
}

void lowerT(){
  beginShape();
  curveVertex(10, -10);
  curveVertex(10, -10);
  curveVertex(50, -20);
  curveVertex(90, 0);
  curveVertex(100, 90);
  curveVertex(40, 120);
  curveVertex(50, 100);
  curveVertex(60, 60);
  curveVertex(20, 40);
  curveVertex(-10, 10);
  curveVertex(10,-10);
  curveVertex(10, -10);
  endShape();
}
