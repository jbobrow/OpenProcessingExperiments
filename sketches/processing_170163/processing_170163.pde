
float angle = 0.0;
void setup() { 
  size(800, 800); 
  smooth(); 
  noStroke();
}
void draw() {
  fill(0, 5);
  rect(0, 0, width, height); 
  fill(255);
  angle = angle + 0.02; 
  pushMatrix();
  translate(300, 300); 
  rotate(-angle);
  fill(random(30,200),0,50,70);
  rect(0, 0, width, height); 
  fill(255);
  ellipse(0, 0, 1, 1);
  popMatrix();
  pushMatrix();
  translate(300, 300); 
  rotate(angle);
  fill(0,50,random(30,200),70);
  rect(0, 0, width, height); 
  fill(255);
  ellipse(0, 0, 1, 1);
  popMatrix();

}



