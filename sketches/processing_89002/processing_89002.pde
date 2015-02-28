
int x = 0, speedX = 1;
float r = 100;
float a;



void setup()
{
  frameRate(60);
  size(200,200);
  smooth();
}

void draw()
{
  background(255);
  
  float g = (frameCount % 255);
  float b = 255;
  
  if (frameCount % 100 == 1)
  {
    r = random(0,255);
  }
  if (frameCount > 120)
  {
    b = b * .567;
    if (b < 255)
    {
      b = 0;
    } 
  }


  
  if (mouseX < width / 2)
  {
    a = 255;
  }
  else 
  {
    a = (((mouseX)*100)/255);         //not the correct maths, i ran out of time
  }
  
  
  fill(r,g,b,a);
 
  
  ellipse(x, height/2 - 20, 10, 10);
  ellipse((width - x), height/2 + 20, 10, 10);
  x = x + speedX;
  if (x >width || x < 0)
    speedX = speedX * -1;
    
  print("r = ");               //code to view values
  print(r);
  print("   g = ");
  print(g);
  print("   b = ");
  print(b);
  print("   a = ");
  println(a);
}
