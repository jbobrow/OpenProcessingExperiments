
int startX = 0;
int endX = 500;
int disY1 = 25;
int numlines = 20;


void setup()
{
size(500, 500);
background(0);
smooth();
}

void draw()
{
  background(0);
for (int i=0; i <= numlines; i++)
{
  stroke(40, 190, 187);
  strokeWeight(1);
  line(disY1*i, startX, mouseX, mouseY);
  line(disY1*i, endX, mouseX, mouseY);
}
}
       
