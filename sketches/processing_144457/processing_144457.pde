
float angle = 0.0;
float offset = 60;
float scalar = 5;
float speed = 0.05;

void setup() {
  size(400, 400);
  smooth();
  background(0);
}

void draw() {
    fill(0, 15);
  
  rect(0, 0, width, height);  
  pushMatrix();
  translate(width/2, height/2);
  float x1 = (offset + (cos(angle) * scalar))-(offset);
  float x2 = (offset + (cos(angle + 0.5) * scalar))-(offset);
  float x3 = (offset + (cos(angle + 1) * scalar))-(offset);

  float y2 = (offset + sin(angle + 0.4) * scalar)-(offset);
  float y3 = (offset + sin(angle + 0.8) * scalar)-(offset);
  float y1 = (offset + sin(angle) * scalar)-(offset);
  rotate(cos(angle)*(TWO_PI/48));
  noStroke();
  fill(map(cos(x1), -1, 1, 0, 255), map(cos(y1), -1, 1, 0, 255), map(sin(x1), -1, 1, 0, 255));  
  rect(x1, y1, cos(angle)*(scalar*.1), cos(angle)*(scalar*.1));
  fill(map(cos(x2), -1, 1, 0, 255), map(cos(y2), -1, 1, 0, 255), map(sin(x2), -1, 1, 0, 255));  
  rect(x2, y2, cos(angle)*(scalar*.1), cos(angle)*(scalar*.1));
  fill(map(cos(x3), -1, 1, 0, 255), map(cos(y3), -1, 1, 0, 255), map(sin(x3), -1, 1, 0, 255));  

  rect(x3, y3, cos(angle)*(scalar*.1), cos(angle)*(scalar*.1));
  rotate(angle*10);
  popMatrix();
  angle += 3;
  scalar += 1.5;
  println(x2, " ", y2, angle, " ", scalar);

  if (scalar >= 125) {
    scalar = 5;
  }
}



