
/*
  Nature of Code
  Exercise 3.4
*/

float animation = 0;

void setup() {
  size(400, 400);
  noStroke();
  fill(255);
}

void draw() {
  background(0);
  
  for (float r = 0, theta = 0; r < 280; r+= 0.03) {
    float x = r * cos(theta + animation);
    float y = r * sin(theta + animation);

    ellipse(x + width/2, y + height/2, 4, 4);
    theta += 0.01;
  }
  
  animation -= 0.5;
}

