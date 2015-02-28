
void setup()
{
size (500,500);
background (255);
}

void draw ()
{
 for (int x = 20; x < height; x += 5)
 {
   line(x+20, 20, x, height);
   strokeWeight(1.5);
 }
 
 for (int x = 80; x > width; x -= 5)
 {
   line(20, x+20, width, x);
 }
}

