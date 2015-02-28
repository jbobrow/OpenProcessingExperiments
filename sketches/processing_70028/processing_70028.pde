
float inc;
int rad;
float x;
float y;

void setup() {
  size(500, 500);
  background(255);
  smooth();
  rad=100;
}


void draw() {
  translate(width/2, height/2);
  rotate(rad);

  for (int inc=0;inc<360;inc+=20) {//for loop to make something always happen
    float angle=radians(inc);
    float x= cos(angle)*rad;
    float y= sin(angle)*rad;
    strokeWeight(0.005);
    noFill();
    ellipse(x, y, 200, 200);
  }
  for (int inc=0;inc<360;inc+=5) {//for loop to make something always happen
    float angle=radians(inc);
    float x= cos(angle)*rad;
    float y= sin(angle)*rad;
    float x1= cos(angle)*rad;
    float y1= sin(angle)*rad;
    rectMode(CENTER);
    strokeWeight(0.005);
    noFill();
    rect(x, y, x1, y1);
  }
}


