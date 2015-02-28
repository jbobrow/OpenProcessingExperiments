

void setup ()
{
size(190,157);
background(255,0,0);
smooth();

}

void draw()
{
  for (int y=0; y<10;y++)
  {
    for(int x = 0;x < 10; x++)
    {
      stroke(0);
      ellipse( x *20, y*20,20,20);
    
      stroke(0);
      fill(255,247,0);
      ellipse( x *20, y*20,20,10);
      
      fill(0);
      ellipse( x *20, y*20,5,10);
      
      noStroke();
      fill(255);
      ellipse ( x *20, y*20,2,2);
    }
  }
}
//when you press any key it will save image of your sketch-you can just easily upload it us thumbnail in the processing classroom!!WHEEE :-)

void keyPressed()
{
  save("screengrab.PNG");
}

