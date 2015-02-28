
void setup() {
  size(600, 600);
  background(0);
  smooth();
  noStroke();
  frameRate(10);
}

float count = 30;
float rectangleSize;

void draw() {
  
  //background rectangles 
  if (count > 0) {
    rectangleSize = random(300,400);
    fill(255, 10);
    rect(random(width), random(height), rectangleSize, rectangleSize);
  }

  //horizontal bands
  if (count > 0) {
    //Red
    fill(random(50, 255), 0, 0, random(30, 90));
    triangle(random(width), random(-100, 200), random(width), random(-100, 200), random(width), random(-100, 200));
    //Green
    fill(0, random(50, 255), 0, random(30, 90));
    triangle(random(width), random(201, 400), random(width), random(201, 400), random(width), random(201, 400));
    //Blue
    fill(0, 0, random(50, 255), random(30, 90));
    triangle(random(width), random(401, 700), random(width), random(401, 700), random(width), random(401, 700));
  }
  //vertical bands
  if (count > 0) {
    //Red
    fill(random(50, 255), 0, 0, random(30, 90));
    triangle(random(-100, 200), random(width), random(-100, 200), random(width), random(-100, 200), random(width));
    //Green
    fill(0, random(50, 255), 0, random(30, 90));
    triangle(random(201, 400), random(width), random(201, 400), random(width), random(201, 400), random(width));
    //Blue
    fill(0, 0, random(50, 255), random(30, 90));
    triangle(random(401, 700), random(width), random(401, 700), random(width), random(401, 700), random(width));
  }
  count--;
}


