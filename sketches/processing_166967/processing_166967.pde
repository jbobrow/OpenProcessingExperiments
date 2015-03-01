
/* The strength of the force. */
float bendAmount = 60;

void setup() {
  size(640, 640);
  fill(0, 150, 255, 100);
  noStroke();
}

void draw() {
  background(255);
  for (int i = 0; i < 360; i++) {
    float x = width/2+sin(radians(i)) * 150;
    float y = height/2+cos(radians(i)) * 150;
    
    /* Gives the circle a liquid appearence. */
    float d = map(dist(mouseX, mouseY, x, y), -150, 150, -bendAmount/2+3, bendAmount/2);
    
    pushMatrix();
    translate(x, y);
    /* Rotate to face the mouse coords. */
    float angle = atan2(mouseX-x, mouseY-y);
    rotate(radians(90)-angle);
    /* By pushing the ellipse by "-bendAmount", the program rotates it on that coord, giving the split effect. */
    ellipse(-bendAmount, 0, d, d);
    popMatrix();
  }
}



