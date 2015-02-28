
// Marcos
 
size (200,200);
background (255);
int x=130;
int y=10;
 
for (; x<200; x+=10)
{
  line (x, y, 195, 10);
  line (10, 10, -x+200, y);
  y+=20;
}
