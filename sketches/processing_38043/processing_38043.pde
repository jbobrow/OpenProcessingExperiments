
size(500,500);
background(0);
smooth();
stroke(79, 252, 237);
int numlines = 10;
int startX = 0;
int startY = -1;
int endX = 500;
int endY = -1;
for (int i = 0; i< numlines; i++)
{
  line(startX, startY, endX, endY);
  startX += 50;
  endY +=50;
}
            
