
/* The length of the lights */
float len = 40;

float t = PI;
float t2 = 3*PI/2;
float pathR = 125, pathG, pathB;

void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  background(0);
  /* We make a grid that spreads across the width and height of the window */
  for (int x = -width/2; x <= width/2; x+=80) {
    for (int y = -height/2; y <= height/2; y+=80) {
      /* The white circle that creates the light effect. */
      fill(255, 150);
      ellipse(width/2+x, height/2+y, 20, 20);
      for (int i = 0; i < len; i++) {
        /* Variable "s" is the size */
        float s = map(i, 0, len, 20, 1);
        /* 
         Variable "d" is the length of the light depending on the mouse position. We minus d from the origonal position
         to create a sense of distance.
         */
        float d = map(dist(mouseX, mouseY, width/2+x, height/2+y), -320, 320, i*2, -i*2);

        /* Fading outwards */
        fill(pathR, pathG, pathB, s*2);
        pushMatrix();
        translate(width/2+x, height/2+y);
        /* Rotatedepending on the mouse position */
        rotate(-atan2(width/2-mouseX+x, height/2-mouseY+y)+radians(45));
        ellipse(i/2-d, i/2-d, s, s);
        popMatrix();
      }
    }
  }
  pathG = 125+125*sin(t);
  t += 0.03;
  pathB = 125+125*sin(t2);
  t2 += 0.03;
}



