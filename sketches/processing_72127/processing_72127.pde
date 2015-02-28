
PImage earth;
int x = 200;
int y = 200;
void setup()
{  
  size(600,600);
  background(0);
  earth = loadImage("http://upload.wikimedia.org/wikipedia/commons/6/60/Earth_from_Space.jpg");
}
void draw()
{  background(0);
  image(earth,x,y,200,200);
  //if(mouseX >x && mouseX < x+ 200 && mouseY > y && mouseY >y+200)
  //{
  //x = x + int(random(-5,5));
  //y = y + int(random(-5,5));
  //}
}
void mouseDragged()
{
  x = x + int(random(-5,5));
  y = y + int(random(-5,5));
  //x=int(random(-20,420));
  //y=int(random(-20,420));
}
