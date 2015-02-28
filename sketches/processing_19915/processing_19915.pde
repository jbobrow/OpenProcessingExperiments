
float i;

void setup ()
{
size(192,157);
background(0);
smooth();

}

void draw()
{
  i =random(1,20);
  for (int y=0; y<10;y++)
  {
    
    for(int x = 0;x < 10; x++)
    {
      stroke(0);
      fill(0,236,255);
      ellipse( x *20, y*20,i,20);
    
     
      fill(169,0,255);
      ellipse( x *20, y*20,10,i);
      
      fill(255,0,38);
      ellipse( x *20, y*20,i,5);
      
    
      fill(255,234,0);
      ellipse ( x *20, y*20,2,i);
    }
  }
}

//when you press any key it will save image of your sketch-you can just easily upload it us thumbnail in the processing classroom!!WHEEE :-)

void keyPressed()
{
  save("screengrab.PNG");
}

