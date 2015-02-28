
float rad = 0.0;
float s = 1.0;
float myscale = 1.0;
PImage myimage;
color Brush;

void setup()
{
 size(600,600);
 background(455);
  myimage = requestImage("rgbwheel.png");
   
}

void draw()
{
  image(myimage, 0, 0, 100, 100);
  noStroke();
  fill(255, 0, 0);
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      //fill(random(255), random(255), random(255));
      fill(Brush);
      pushMatrix();
      translate(mouseX, mouseY);
      rotate(rad);
      scale(s);
      triangle(30, 75, 58, 20, 86, 75);
      popMatrix();
    }
    if (mouseButton == RIGHT)
    {
      Brush = get(mouseX, mouseY);
    }
    if (keyPressed)
    {
      if (key == '1')
      {
        rad += 0.1;
      }
       
      if (key == '2')
      {
        s += 0.1;
         
      }
      if (key == '3')
      {
        s -= 0.1;
      }
    }
   
       
     
    
  }
}




