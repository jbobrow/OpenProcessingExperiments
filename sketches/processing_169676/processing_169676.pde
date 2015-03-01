

/* Length of the tenticle */
float len = 50;
 
void setup() {
  size(640, 640);
  stroke(255);
  noFill();
}
 
void draw() {
  background(0);
  translate(width/2, height/2);
  /* First loop is for the tenticles to be located on a cirlce */
  for (int i = 0; i < 360; i+=30) {
    float x = sin(radians(i)) * 25;
    float y = cos(radians(i)) * 25;
    /* Second loop is for the tenticles */
    for(int q = 0; q < len; q+=2){
      /* The angle is to make the movement */
      float angle = cos(radians(len-q+frameCount)) * q;
      float x2 = sin(radians(i-angle))*(q*3);
      float y2 = cos(radians(i-angle))*(q*3);
      /* fill(255-q*3); */
      ellipse(x+x2, y+y2, len-q, len-q);
    }
  }
}

