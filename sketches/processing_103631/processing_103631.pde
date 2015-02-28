
float treeXPosition = 600.0;

void drawTree(float xPosition)
{
  fill (0,0,0);
rect (xPosition, 475, 20, 125);
fill (0, 255, 0);
ellipse (xPosition + 10 , 500, 100, 100);
}
void setup()

{
  size (800, 600);
background(0,0,300);
drawTree(100); 
fill (0, 255, 0);
ellipse (400, 450, 100, 100);
fill (0, 0,0);
rect (390, 500, 20, 200);
fill (255, 255, 255);
ellipse (200, 200, 100, 50);
ellipse (250, 200, 100, 50);
ellipse (225, 175, 75, 35);
fill (0, 255, 0);
fill (0,0,0);
rect (treeXPosition, 475, 20, 125);
fill (0, 255, 0);
ellipse (treeXPosition + 10 , 500, 100, 100);
rect (0, 595, 800, 15);
creeper (30);
creeper (500);
creeper (700);
fill (249, 250, 8);
ellipse (775, 0, 125, 125);
drawCloud (600, 200, 90, 60);
}
void creeper (float cPosition){
  fill(0, 255,0);
  rect (cPosition, 550, 12, 35);
rect (cPosition - 3, 580, 8, 8);
rect (cPosition + 10, 580, 8, 8);
rect (cPosition - 2, 540, 20, 20);
fill (0,0,0);
rect (cPosition + 3, 545, 3, 5);
rect (cPosition + 10, 545, 3, 5);
rect (cPosition + 5, 555, 6, 3);
drawPiggy (250);
drawPiggy (200);
}
void drawCloud(float xPosition, float yPosition, float cloudwidth, float cloudheight) 
{
  fill (255, 255, 255);
  ellipse (xPosition, yPosition, cloudwidth, cloudheight);
  ellipse (xPosition + 25, yPosition, cloudwidth - 5, cloudheight - 5);
}
void drawPiggy (float xPos)
{
  fill (239, 141, 240);
rect (xPos, 575, 30, 15);
rect (xPos + 1, 587, 5, 8);
rect (xPos + 25, 587, 5, 8);
rect (xPos + 28, 575, 10, 10);
fill (0, 0, 0);
rect (xPos + 33, 577, 3, 3);
rect (xPos + 34, 581, 4, 2);
}
