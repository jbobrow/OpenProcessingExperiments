
void setup() {
  size (500, 500);
}

void draw()  {
  background(0);

  pushMatrix();

  float my_angle = map(millis()/10, 0, width, 0, 2*PI);
  translate(width/2, height/2);
  rectMode(CENTER);
  rotate(my_angle);
  fill(255);
  rect(0, 0, mouseX, mouseX);
  popMatrix();
  pushMatrix();
  float my_angle2 = map(millis()/10, 0, width, 0, -2*PI);
  translate(width/2, height/2);
  rectMode(CENTER);
  rotate(my_angle2);
  fill(0);
  rect(0, 0, mouseX, mouseX);
  popMatrix();
}

