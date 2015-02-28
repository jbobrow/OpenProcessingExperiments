
void setup()
{
  size (700, 500);
  background(434);
  smooth();
frameRate(21);
}
 
void draw()

{ 
 background(255);

  for (int x = -4; x < width-2; x+= width/8+-75)
  {
  for (int y = -1; y < height; y++)
  {
      fill(random(247),random(255),random(36),250);
    rect (x, y, width/12, random(51, 159));
    y += random (1,50);
  }
loop();

}
//}
//saveFrame("images/export-"+"-#####.jpeg");
//if ( frameCount >= 900 ) {
//      exit();}
}
