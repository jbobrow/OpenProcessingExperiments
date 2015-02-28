
PShape s;

float prevMillis;
float thresh = 1000;
float x = 0;
float y = 0;

void setup()
{
  size(800,800);
background(255);
  
  s = loadShape ("final_logo.svg");
  
}

void draw()
{
  translate(0, 0);
if(millis() - prevMillis >= thresh)
  {
    shape(s, x, y, 100, 100);
    x+=50;
    y+=50;
    
    prevMillis = millis();
  }
}

