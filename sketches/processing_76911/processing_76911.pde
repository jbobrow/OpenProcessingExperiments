
void setup()
{
  size(800,800);
}
  void draw()
  {
  float x = mouseX;
  float y = mouseY;
  
  background(180);
  if(mouseButton == LEFT)
  {
    noFill();
  } else if(mouseButton == RIGHT) 
  { fill(0);
  } else {
    fill(120);
  }
  stroke(250);
  strokeWeight(2);
  strokeCap(ROUND);
  strokeJoin(ROUND);
   quad(x,y,x+35,y-40,x+35,y+80,x,y+120);              // cube
   rect(x+35,y-40,120,120);                           // cube
   quad(x+120,y,x+155,y-40,x+155,y+80,x+120,y+120);  // cube
   rect(x,y,120,120);                               // cube
   
   quad(x,y-60,x+35,y-100,x+155,y-100,x+120,y-60); //
   line(x+35,y-100,x+80,y-180);                   // Top
   triangle(x,y-60,x+120,y-60,x+80,y-180);       // Pyramid
   triangle(x+155,y-100,x+80,y-180,x+120,y-60); //
   
   quad(x+35,y+140,x+155,y+140,x+120,y+180,x,y+180); //
   line(x+155,y+140,x+80,y+240);                    // Lower
   triangle(x,y+180,x+35,y+140,x+80,y+240);        // Pyramid
   triangle(x,y+180,x+120,y+180,x+80,y+240);      //
   
   quad(x+175,y,x+210,y-35,x+210,y+85,x+175,y+120); //
   line(x+255,y+60,x+210,y+85);                    // Left
   triangle(x+175,y,x+210,y-35,x+255,y+60);       // Pyramid
   triangle(x+175,y,x+175,y+120,x+255,y+60);     //
   
   quad(x-55,y,x-20,y-35,x-20,y+85,x-55,y+120);  //
   triangle(x-20,y-35,x-135,y+50,x-55,y);       // Right
   triangle(x-20,y+85,x-55,y+120,x-135,y+50);  // Pyramid
   triangle(x-55,y,x-55,y+120,x-135,y+50);    //
   
   
  }


