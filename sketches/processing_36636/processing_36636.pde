
void setup() {
  size (300, 300);
  stroke(255);
  background(20);
  colorMode(RGB, 255);
  smooth();
  frameRate(6);
}

float count = 30;
float rectangles;
float rndColor;

void draw() {

  if (count > 0) {  //yellow colored squares
    rndColor = random(100);
    if (rndColor >20){
      fill (255, 255, 0, random(100));
  }
  else {  //red colored squares
    fill (255, 0, 0, random(100));
  }
  strokeWeight (random(10));  //random squares
  rect (random(width), random(height), random(100), random(100));
  }
  count--;
}


