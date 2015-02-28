
void setup()
{
 
  size (800, 800);
  background (0, 0, 0);
   
}
 
void draw()
{
  background (0, 0, 0);
  
  // sun
  translate (400, 400);
  fill(240, 190, 0);
  noStroke();
  ellipse(0,0,80,80);
  rotate(radians(millis()/20));
   

  // earth
  translate(200, 200);
  fill (0, 0, 170);
  noStroke();
  ellipse(0, 0, 50, 50);
  rotate(radians(millis()/15));
 
   

  // moon
  translate (50, 50);
  fill(255);
  noStroke();
  ellipse(0,0,15,15);
  rotate(radians(millis()/3));
  
  // satalite
   translate(15, 15);
    for(int x = 50; x < 600; x += 100)
    {
      for(int y = 50; y < 400; y += 100)
      {
        if(random(100) < 10)
        {
          int r = (int)random(256);
          int g = (int)random(256);
          int b = (int)random(256);
          fill(r,g,b);
       
      }
    }
   ellipse(0, 0, 5, 5);
  }
}



