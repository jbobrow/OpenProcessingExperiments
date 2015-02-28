
float x, y, angle;

void setup() {
  size (700, 800);
  background(160, 140, 190);
  smooth();
  //noStroke();
  //fill(0);
  x = 0;
  y = 0;
  angle = 0;
  
}

void draw() {
  noFill();
  strokeWeight(.01);
  stroke(x, y, angle*4);

  angle = x*8;
  x = cos(radians (angle))*20;
  y = sin(radians(angle))* height/1.5;
    line (x-30, y-100, angle*200+7, x*360);
    x++;
    y++;
    angle++;
}


