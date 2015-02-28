
int x,y; 
void setup()
{
  int x = 50;
  int y = 50;
  size(400,400);
  background(154,208,242);

}

  
void draw()
{
  stroke(240,109,277);
  line(random(400),random(400),200,200);
   fill(mouseX,mouseY,0,50);
    ellipse(mouseX,mouseY,30,30);
    fill(249,250,0);
  ellipse(200,200,50,50);
  
}


void mouseDragged()
{
  ellipse(mouseX,mouseY,30,30);
  if (mouseButton==RIGHT);
}
