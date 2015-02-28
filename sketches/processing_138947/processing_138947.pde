
ArrayList history = new ArrayList();
float distthresh = 420;
 
void setup()
{
  size(600,500);
  background(28,67,97);
  stroke(255,50);
  cursor(CROSS);
  smooth();
}
 
 
void draw()
{
  
}
 
void mouseDragged()
{
 
  PVector d = new PVector(mouseX,mouseY,0);
  history.add(0,d);
  distthresh = mouseX;
  
  for (int p=0; p<history.size(); p++)
  {
    PVector v = (PVector) history.get(p);
    float joinchance = p/history.size() + d.dist(v)/distthresh;
    if (joinchance < random(0.6))  line(d.x,d.y,v.x,v.y);
  }
}
 
void keyPressed()
{
  if (key == ' ') 
  {
    background(28,67,97);
    history.clear();
  }
}
