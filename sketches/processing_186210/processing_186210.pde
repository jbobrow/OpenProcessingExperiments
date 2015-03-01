
float len = 15;

void setup() {
  size(640, 640);
  noStroke();
}

void draw() {
  background(255);
  for (int i = 0; i <= width; i+=16) {
    addTenticle(i, 0, len/2+sin(radians(i*56+frameCount))*len/2, i);
  }
}

void addTenticle(float x, float y, float size, float index) {
  /* This is what our for loop is going to do. We start of with our first circle at (0, 0). Then we store our y pos in "prevY".
   The next iteration we have to add i/2, which is the radius size of our circle and then add our previous y coord so our 
   current circle can move down. */
  /*
   ellipse(0, 0, 5, 5); //prevY+0
   ellipse(0, 7.5, 10, 10);//prevY+7.5
   ellipse(0, 20, 15, 15);//prevY+12.5
   ellipse(0, 37.5, 20, 20);//prevY+17.55 
   */
  float prevY = 0;
  for (float q = size; q > 0; q--) {
    float addY = ((q))+prevY;
    /* Top Half */
    fill(0);
    ellipse(x, height/2-y-(addY+prevY), q*2, q*2);
    fill(125+sin(radians(index))*125, 125+cos(radians(index))*125, 125+sin(radians(180+index))*125);
    ellipse(x, height/2-y-(addY+prevY), q, q);
    /* Bottom Half */
    fill(0);
    ellipse(x, height/2+y+(addY+prevY), q*2, q*2);
    fill(125+sin(radians(index))*125, 125+cos(radians(index))*125, 125+sin(radians(180+index))*125);
    ellipse(x, height/2+y+(addY+prevY), q, q);
    
    prevY = addY;
  }
}



