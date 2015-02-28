
void setup()
{
  size(220,200);
  smooth();
}

void draw()
{
  background(0,14,255);
  stroke(255,0,0,90);
  strokeWeight(2);
  fill(255,0,0,70);
  quad(30,50,100,50,110,80,20,80);
  triangle(30,50,20,80,65,130);
  triangle(20,80,110,80,65,130);
  triangle(100,50,110,80,65,130);
  stroke(0,255,100);
  strokeWeight(4);
  fill(0,255,0,80);
  quad(120,130,190,130,185,100,125,100);
  triangle(120,130,190,130,155,50);
  triangle(185,100,125,100,155,50);

}


