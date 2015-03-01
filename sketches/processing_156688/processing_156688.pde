
/* Length of wings */
float len = 90;

void setup() {
  size(640, 640);
  stroke(200);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  /* Similar code to the tenticle star */
  for (int q = 0; q < len; q+=2) {
    /* The angle is to make the movement */
    float angle = cos(radians(len-q+frameCount*3)) * q;
    /* Left wing */
    float x = sin(radians(-90-angle))*(q*3);
    float y = cos(radians(-90-angle))*(q*3);
    
    /* Right wing */
    float x2 = cos(radians(-angle))*(q*3);
    float y2 = sin(radians(-angle))*(q*3);
    
    /* The fill in the middle of the wings. More realistic view */
    fill(50+q*2);
    
    /* Right Wing */
    bezier(-20, 0, x/2, y/2, x/2, y/2, x, y);
    /* Left Wing */
    bezier(20, 0, x2/2, y2/2, x2/2, y2/2, x2, y2);
  }
}



