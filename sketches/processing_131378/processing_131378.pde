
PImage colorwheel;
PImage head;
float s = 1.0;
float rotation = 0.0;
color mycolor;

void setup()
{
  size(500,500);
  background(255);
  frameRate(30);
  colorwheel= requestImage("colorwheel.jpg");
  head = loadImage("Cathead.png");
}
 
void draw()
{
  noStroke();
  image(colorwheel,0,0,150,150);
  if (mousePressed == true)
  {
   
    if (mouseButton == LEFT)
    {
      mycolor= get(mouseX,mouseY);
    }
     if (mouseButton == RIGHT)
      {
       if (key == '3')
       {
          fill(mycolor);
          pushMatrix();
          translate(mouseX,mouseY);
          rotate(rotation);
          scale(s);
          rect(0,0,50,50);
          popMatrix();
       }
    
      if (key == '1')
       {
         pushMatrix();
         scale(s);
         rotate(rotation);
         translate(mouseX,mouseY);
         image(head, -50, -50, 100,100);
         popMatrix();
       }
      if (key == '2')
       {
         fill(mycolor);
         pushMatrix();
         translate(mouseX,mouseY);
         rotate(rotation);
         scale(s);
         ellipse(0,0,50,50);         
         popMatrix();
       }
      if (key == 'd')
       {
          rotation=rotation + 0.05;
       }
      if (key == 'a')
       {
          rotation=rotation - 0.05;
       }
      if (key == 'w')
       {
        s=s + 0.05;
       }
      if (key == 's')
       {
        s=s -0.02;
       }
      }
    }
}



