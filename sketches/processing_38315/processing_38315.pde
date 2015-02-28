
float c;
  int circleR;
  int spacing;
  float margins;
void setup() {
  frameRate(60);
  size(500, 500);
  c=0;
  circleR=15;
  spacing = width/13;
  margins=width/13;
}
void draw() {
  background(0, 0, 0);
  c=c+.12;
  fill(255);

  for (float x = 0 ; x <11 ; x ++)
  {
    for (float y = 0; y< 11; y ++)
    {
      float change = PI*((x+y)/11);
      arc(x*spacing+circleR+margins, y*spacing+circleR+
          margins, circleR*2, circleR*2, change+c, PI+change+c);
    }
  }
}
                                
