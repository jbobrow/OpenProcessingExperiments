
//Grace O C.P. 1 Mods 14-15

void setup()
{
  size(500, 500);
  fill(0);
  ellipse(500/4, 500/4, 10, 10);
  fill(255,0,0);
  ellipse(500/2, 500/4, 10, 10);
  fill(250,150,50);
  ellipse(1500/4, 500/4, 10, 10);
  fill(255,255,0);
  ellipse(500/4, 500/2, 10, 10);
  fill(150,250,0);
  ellipse(500/2, 500/2, 10, 10);
  fill(0,250,200);
  ellipse(1500/4, 500/2, 10, 10);
  fill(0,160,250);
  ellipse(500/4, 1500/4, 10, 10);
  fill(150,100,250);
  ellipse(500/2, 1500/4, 10, 10);
  fill(250,100,250);
  ellipse(1500/4, 1500/4, 10, 10);
}
void draw()
{
}
void mousePressed()
{
  
  noFill();
  ellipse(mouseX,mouseY,40,40);
}
void mouseDragged()
{
  

  strokeWeight(1);
  line(pmouseX,pmouseY,mouseX,mouseY);
}
void keyPressed()
{
  noFill();
  int x = 40;
  if (keyPressed == true && key == 'n')
  {
    while (x<100)
    {
     
      {
      ellipse(mouseX,mouseY,x,x);
      x = x + 10;
      }
      
    }
  }
  else
  {
  background(200);
  fill(0);
  ellipse(500/4, 500/4, 10, 10);
  fill(255,0,0);
  ellipse(500/2, 500/4, 10, 10);
  fill(250,150,50);
  ellipse(1500/4, 500/4, 10, 10);
  fill(255,255,0);
  ellipse(500/4, 500/2, 10, 10);
  fill(150,250,0);
  ellipse(500/2, 500/2, 10, 10);
  fill(0,250,200);
  ellipse(1500/4, 500/2, 10, 10);
  fill(0,160,250);
  ellipse(500/4, 1500/4, 10, 10);
  fill(150,100,250);
  ellipse(500/2, 1500/4, 10, 10);
  fill(250,100,250);
  ellipse(1500/4, 1500/4, 10, 10);
  }
  
  }
