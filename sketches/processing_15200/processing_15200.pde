






int xpos;
int ypos;

void setup()
{
  size (600, 600);
  strokeWeight(3);
  smooth();
}

void draw()
{
 background (255);
  
//    xpos = width/2;
// ypos = height/2;
  
//  xpos = mouseX-50;
//  ypos = mouseY+75;
  
 
  drawRake(100+(mouseX/40), 100+(mouseY/80), 100, 0, 0, 2);
  drawRake(300+(mouseX/60), 100+(mouseY/100), 35, 10, 10, 5);
  drawRake (500+(mouseX/20), 100+(mouseY/60), 200, 27, 27, 1);
  drawRake (100+(mouseX/75), 300+(mouseY/115), 10, 5, 15, 7);
  drawRake (300+(mouseX/52), 300+(mouseY/82), 120, 17, 3, 2);
  drawRake (500+(mouseX/15), 300+(mouseY/55),180, 0, 25, 10);
  drawRake (100+(mouseX/50), 500+(mouseY/90), 30, 10, 39, 3);
  drawRake (300+(mouseX/80), 500+(mouseY/120), 200, 50, 56, 1);
  drawRake (500+(mouseX/25), 500+(mouseY/65), 50, 9, 15, 4);


}



void drawRake(int x, int y, int s, int xoff, int yoff, int v)
{
  
 stroke(s);
 strokeWeight(v);
 
line ((x-100), (y-150)-yoff, x+xoff, y-yoff);
line (x+xoff, y-yoff, x, (y+70)+yoff);
line (x+xoff, y-yoff, (x+20), (y+50)+yoff);
line (x+xoff, y-yoff, x+00, (y+34)+yoff);
line (x+xoff, y-yoff, x+25, (y+20)+yoff);
line (x, y+60, x+40, y+10);


}










