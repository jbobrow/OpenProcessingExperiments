
PImage palette;
float rot =0.0;
float s = 1.0;
color Brush;


void setup()
{
  size(400,400);
  palette = requestImage("ColorWheel-Base.png");
  background(255);
}

void draw()
{
 
 
   image(palette,0,0,150,150);
 

 
noStroke();
if(mousePressed== true)
{
  if (mouseButton ==RIGHT)
  {
    Brush = get(mouseX,mouseY);}
  }
  
if(mouseButton== LEFT)
{
fill(Brush);
  pushMatrix();
translate(mouseX,mouseY);

scale(s);
rotate(rot);

triangle(30,75,58,20,86,75);

popMatrix();
}

if(keyPressed)
{
  if(key=='1')
  {
    rot+=.1;
  }
else if(keyPressed)
{
  if(key=='2')
  {
    
    s+=0.01;
  }

}
}
}


