
//Montana Cruz, Computer programming 1, 4/5
int x = 0;
float y = 0.5;
int z = 50;

void setup()
{
  size (525, 500);
  noFill();
}

void draw ()
{
  space();
  if (keyPressed == true && key == 'd')
  {
    z = z+1;
  }
  if (keyPressed == true && key == 'a')
  {
    z = z-1;
  }
}

void space()
{
  background (0);
  fill(8, 162, 35, 100);
  stroke (8, 162, 35);
  
  
  //bottom
  rect (50, 350, 50, 40);
  rect (175, 350, 50, 40);
  rect (300, 350, 50, 40);
  rect (425, 350, 50, 40);
  stroke (0, 0, 0);
  fill (0, 0, 0);
  triangle (60, 390, 90, 390, 75, 360);
  triangle (185, 390, 215, 390, 200, 360);
  triangle (310, 390, 340, 390, 325, 360);
  triangle (435, 390, 465, 390, 450, 360);
  stroke (134, 134, 134);
  fill (183, 183, 183, 100);
  frameRate (1000);
  
  //moving part
  rect (z+10, 430, 30, 20);
  rect (z+17, 425, 16, 10);
  
  //monster
  stroke (255, 255, 255);
  fill (255, 255, 255);
  rect(210+x, 50, 100, 20); 
  rect(185+x, 70, 150, 30);
  rect(165+x, 100, 190, 60);
  rect(225+x, 160, 30, 20); 
  rect(195+x, 180, 30, 20); 
  rect(165+x, 200, 30, 20); 
  rect(265+x, 160, 30, 20); 
  rect(295+x, 180, 30, 20); 
  rect(325+x, 200, 30, 20); 
  rect(255+x, 160, 10, 30);
  fill(0,0,0);
  rect(210+x, 100, 40, 30); 
  rect(270+x, 100, 40, 30); 
  
}
void keyPressed()
{
  if(key == 'd')
  {
    x = x + 3;
  }
  if(key == 'a')
  {
    x = x - 3;
  }
}
