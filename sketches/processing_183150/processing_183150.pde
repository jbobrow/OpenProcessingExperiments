
int cx = 250;
int cy = 250;
int r = 100;

void setup()
{
  size(500, 500);
  ellipseMode (CENTER);
  
  stroke(255);
}

void draw()
{

  float t = millis()/1000.0f;
  int x = (int)(cx+r*cos(t));
  int y = (int)(cy+r*sin(t));
  int m = millis();
  
  ellipse(x,y,50,50);
  fill(40);
  
  if (x<250){
    fill(80);
  }
  else{
    fill(230);
  }
}
