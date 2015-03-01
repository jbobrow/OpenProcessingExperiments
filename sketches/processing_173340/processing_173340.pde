
/* Help from Aleksandra sketch Róża Aleksandry i Andrzeja miłość na wieki przyniesie Ci */

float num;

void setup() {
  size(640, 640);
  strokeWeight(2);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  num = abs(sin(radians(frameCount))/3);
  rotate(radians(frameCount));
  branch(0, 0, 0, -130, 0);
  branch(0, 0, 0, 130, 0);
  branch(0, 0, 130, 0, 0);
  branch(0, 0, -130, 0, 0);
}

void branch(float x, float y, float x2, float y2, int i) {
  //Pattern Orientation - mouse rotation
  float my = atan2(y2-y, x2- x);
  float mx = atan2(y2-y, x2- x) + map((width-width/3), 0, 480, 0, PI); 

  /* Get the length of the line, then make it 0.7 times smaller. */
  float r = sqrt((x2 - x) * (x2 - x) + (y2 - y)*(y2 - y))*0.7;
  
  stroke(0, sin(radians(i*40+90))*150, sin(radians(i*40+90))*255);
  line(x, y, x2, y2);
  
  if (i < 8) {
    /* Left Top Line */
    branch(x2, y2, x2 + r * cos(my - QUARTER_PI - num), y2 + r * sin(my - QUARTER_PI - num), i+1);
    /* Right Top Line */
    branch(x2, y2, x2 + r * cos(mx + QUARTER_PI - num), y2 + r * sin(mx + QUARTER_PI - num), i+1);
  }
}



