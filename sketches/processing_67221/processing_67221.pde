
//My clock does not tell time but it counts seconds


void setup() {
  background (0);
  smooth();
  size(500, 500);
  noStroke();
  colorMode(HSB);

  frameRate(15);
}

void draw() {
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
  for (int i = 0; i < 4; i++) {
    spiral(i*90+second()*6, color(200, 255, 255, 100), width/2, height/2, false);
    spiral(i*90+second()*6, color(100, 255, 255, 100), width/2, height/2, true);
  }
}

void spiral(float angle, color clockColor, float centerX, float centerY, boolean clockwise) {
  fill(clockColor);
  float degree = angle;
  int direction = -1;
  if (clockwise) {
    direction = 1;
  } 

  
    for (int i = 0; i < 720; i++) {
      float x = i/2 * cos ( radians(angle+i)) * direction;
      float y = i/2 * sin (radians(angle+i));
      ellipse (x+centerX, y+centerY, i/50+.5, i/50+.5);
    }
 
}


