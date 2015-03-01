
void setup()
{
  size(600, 600);
  background(0);
  smooth();
  strokeWeight(5);

}


void draw()

{
  int x = 80;
  int y = 540;
  int a = x + 40;
  int b = y - 40;

 
 stroke(#9CC6A9);
 line(x, x, y, y);
 
 stroke(#DB6C6C); 
 line(a, a, b, b);
 
 stroke(#EAEA6D);
 line(a + 40, a + 40, b - 40, b - 40);
}






