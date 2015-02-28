
void setup () {
  size(300, 300);
  smooth();
  background(0);
}

void draw() {
  pushMatrix();//4 circles
  fill(255);
  translate(width/2, height/2);
  rotate(frameCount * PI/6 * 0.01);//speed of rotation
  translate(55, 0); 
  ellipse(0, 50, 20, 20);//each circle
  ellipse(50, 0, 20, 20);
  ellipse(0, -50, 20, 20);
  ellipse(-50, 0, 20, 20);
  popMatrix();

  pushMatrix();// red square moving other direciton
  fill(255, 0, 0);
  translate(width/2, height/2);
  rotate(frameCount * -PI/6 * 0.009); //reverse direction
  rect(35, -15, 30, 30);
  popMatrix();
}


