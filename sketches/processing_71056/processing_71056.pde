
//Eric K, CP1 mods 4-5, User Input
//url: http://ericsprogrammingsite.com/User_Input.html

/**
  Left-click and drag for circles.<br>
  Right-click and drag for squares.<p>
  Press the "f" key to fade.<br>
  Press the spacebar to reset.<br>
  Press the "b" and "s" keys to make the shapes bigger or smaller, respectively.
*/

int c = 0;
int s = 30;
void setup()
{
  size(500,500);
  background(0);
  colorMode(HSB,360);
  noFill();
}
void draw()
{
  stroke(c,360,360);
  c = c + 1;
  if(c > 360)
  {
    c = 0;
  }
}
void mouseDragged()
{
  if(mouseButton==LEFT)
  {
    ellipse(mouseX,mouseY,s,s);
    ellipse(mouseX,height-mouseY,s,s);
    ellipse(width-mouseX,mouseY,s,s);
    ellipse(width-mouseX,height-mouseY,s,s);
  }
  if(mouseButton==RIGHT)
  {
    rect(mouseX-(s/2),mouseY-(s/2),s,s);
    rect(mouseX-(s/2),height-mouseY-(s/2),s,s);
    rect(width-mouseX-(s/2),mouseY-(s/2),s,s);
    rect(width-mouseX-(s/2),height-mouseY-(s/2),s,s);
  }
}
void keyPressed()
{
  if(key=='f')
  {
    fade();
  }
  if(key==' ')
  {
    background(0);
    s = 30;
  }
  if(key=='b' && s <= 100)
  {
    s = s + 2;
  }
  if(key=='s' && s >= 0)
  {
    s = s - 2;
  }
}
void fade()
{
  noStroke();
  fill(0,0,0,10);
  rect(0,0,width,height);
}
