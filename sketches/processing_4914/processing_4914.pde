
float radius = 200;
int offset = 0;
int hueVal = 0;

void setup()
{
  size(800, 600);
  frameRate(31);
  background(0);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw()
{
  fill(0, 0, 0, 25);
  stroke(0,0);
  rect(0,0,800,600);
  int cX = 400;
  int cY = 300;
  
  offset++;
  offset%=10;
  
  hueVal++;
  hueVal%=360;
  
  for (int i = 0; i < 36; i++)
  {
    float dX;
    float dY;
    float rot = i*10 + offset;
    float ang = radians(rot);
    float vary = 25 * sin(radians(rot*8));
    
    float col = (i*10 + hueVal) % 360;
    float newRadius = i%60 + radius + vary;
    
    dX = sin(ang);
    dY = cos(ang);
    
    int mX = mouseX;
    int mY = mouseY;
    
    float relX = float(mouseX) / float(width);
    float relY = float(mouseY) / float(height);

    stroke(col, relX * 100,  relY * 100, 50);
    strokeWeight(2);
    line(cX, cY, (dX*newRadius) + cX, (dY*newRadius) + cY);
    fill(0,0);
    ellipse((dX*newRadius) + cX, (dY*newRadius) + cY, 50, 50);
    fill(col, 100, 100, 75);
    ellipse((dX*newRadius) + cX, (dY*newRadius) + cY, 20, 20);
    
  }
}

