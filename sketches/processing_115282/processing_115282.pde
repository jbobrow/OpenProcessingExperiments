
void setup()
{
  size (700, 500);
  background(255);
  smooth();
frameRate(12);
}
 
void draw()

{ 
 background(255);
  noStroke();
  fill(0);
  for (int x = 25; x < width-76; x+= width/8+5)
  {
  for (int y = 35; y < height-40; y++)
  {
    rect (x, y, width/8, random(1, 86));
    y += random (1,50);
  }
 loop();
}
 fill(255);
 rect(0,464,width,height);
//}
//saveFrame("images/export-"+"-#####.jpeg");
//if ( frameCount >= 900 ) {
//      exit();}
}
