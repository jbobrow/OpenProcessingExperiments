
void setup()
{
  size(500, 500);
  background(255);
}



void draw()
{
  strokeWeight(8);
  strokeCap(SQUARE);//strokeCap is shape of end of line
  line(0, 50, 500, 50);
  line(0, 350, 500, 350);
  line(0, 400, 500, 400);
  
  line(70, 0, 70, 500);// x1, x2, Y1, Y2
  line(400, 0, 400, 500);
  
  strokeWeight(8);//case sensitive
fill(255, 0, 0);
rect(70, 50, 330, 300);//note
}
