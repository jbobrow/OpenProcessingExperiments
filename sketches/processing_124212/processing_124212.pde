
//Brendan Van Houten

void setup()
{
  size(400,600);
  background(0,0,102);
  
}
void draw()
{
  noStroke();
  fill(255,255,255);
  ellipse(width/2, 500, 200,200);
ellipse(width/2, 375, 150,150);
ellipse(width/2, 275, 100, 100);

 fill(0,0,0); 
 ellipse(width/2,375, 10,10);
 ellipse(width/2,335, 10,10);
 ellipse(width/2,415, 10,10);
 ellipse(185,250, 10,10);
 ellipse(215,250, 10,10);

 fill(255,128,0);
 ellipse(width/2,275, 15,15);
}

void mousePressed()
{
  fill(255);
  ellipse(mouseX, mouseY, 10,10);
  
}
void keyPressed()
{
if (key == 'm');
fill(0);
ellipse(mouseX, mouseY, 10,10);}
