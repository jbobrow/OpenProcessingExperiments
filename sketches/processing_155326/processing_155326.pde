
void setup ()
{
  size (600, 200);
  smooth();
}


void draw ()
{
  background (#57385c);
  
  float angle = atan2 (mouseY-height/2, mouseX-width/2);
  float dis = dist (mouseX, mouseY, width/2, height/2 );
  stroke (255);
  arrow (width/2, height/2, dis, 10, angle);
}


void arrow (float x, float y, float r, float ar, float angle)
{
  float endX = x + cos (angle)*r;
  float endY = y + sin (angle)*r;
  line (x, y, endX, endY );
  line (endX, endY, endX + cos (angle-PI * 0.88) * ar, endY + sin (angle-PI*0.88) * ar);
  line (endX, endY, endX + cos (angle-PI * 1.12) * ar, endY + sin (angle-PI*1.12) * ar);
}

