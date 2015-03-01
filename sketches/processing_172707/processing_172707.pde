
int timer = 0;
void setup()
{
  size(500,500);
  background(211,211,211);
  colorMode(HSB);
}

void draw()
{

  float delta = .45;
  strokeWeight(.5);
  stroke(255);
  float x = 0;
  while (x < 100)
  {
    float xpos = map(x,10,90,0,width);
    float ypos = map(x,10,90,0,height);
    stroke(map(xpos,mouseX,width,mouseX,200),map(ypos,mouseY,height,100,200),map(xpos*ypos,0,width*height,100,300));
    line(xpos,0,0,height-ypos);
    line(xpos,height,height,height-ypos);
    line(xpos,0,width,ypos);
    line(0,xpos,ypos,width);
    x += delta;
  }
  if (millis() > timer)
  {
    drawSomeLines(50);  
    timer += 1000;
  }
}



void mousePressed()
{
  setup();
}
void drawSomeLines(int n)
{
  stroke(0,0,255);
  strokeWeight(.5);
  for (int i = 0; i < n; i++)
  {
    line(random(width),500,mouseX,0);
  }
}
void keyPressed()

{
   background(10,10,0);
}

