
int alma = 100;
int veletlenszam;


void setup()
{
  size(600,600);
  background(255,255,255);
}  
  
void draw()
{
  kereszt();
  alma = mouseX;
  
  fill(0);
  text(veletlenszam, width/2, height/2);
}

void kereszt()
{
  noStroke();
  strokeWeight(10);
  stroke(100,100,100);
  fill(255,255,0);
  ellipse(width/2,height/2, alma,30);
  ellipse(width/2,height/2, 30, alma);
}

void mousePressed()
{
  veletlenszam = floor(random(6)) + 1;
  
}
