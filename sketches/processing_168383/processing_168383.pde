
int num = 200;
Text[] text_array = new Text [num];

void setup()
{
 size(800,600); 
  PFont font;
 font = loadFont("CenturyGothic-48.vlw");
 textFont(font, 48);
  for(int i=0; i<num; i++)
  {
    text_array[i] = new Text();
    
  }
}

void draw()
{
  background(0);
  fill(255,170);
  
  
  for(int i=0; i<num; i++)
  {
   text_array[i].update();
   text_array[i].display(); 
    
  }
  
}


class Text
{
  
  float x, y, vx, vy, grav;
  float bounciness;

  Text()
  {
   x = random (width);
   y = random (height);
   bounciness = random(-.95,-.5);
   vx = random(-3, 3);
   vy = random(-3, 3);
   grav = -.05;    

  }
  void update()
  {
    vy+=grav;
    
    x+= vx;
    y+= vy;
   

  if (y>height)
  {
    y = height;
    vy*= -1;
  }

  if (x<0)
  {
    x= 0;
    vx*= -1;
  }

  if (x>width)
  {
    x = width;
    vx*= -1;
  }
  
  if (y<0)
  {
    y = 0;
    vy*= bounciness; 
  }
  }
  
  void display()
  {
   
    pushMatrix();
    translate(x, y);
    text("words",x,y);
    popMatrix();
    
  }

}
