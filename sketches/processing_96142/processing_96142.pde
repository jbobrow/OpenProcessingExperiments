
//Created by Luke Noonan 2009
//fareastcoastnoise.blogspot.com/
  
 
float zn;
float speed;
float view;
void setup()
{
  zn = 0.0;
  speed = 0.05;
  view =0.005;
  size(960,640);
}
void draw()
{
float xn =0.0;
for(int x=0; x<width; x++)
{
  float yn =0.0;
  for(int y=0; y<width; y++)
  {
    stroke(noise(xn,yn,zn)*255);
    point(x,y);
    yn += view;
  }
  xn += view;
}
zn += speed;
 
  if(keyPressed) {
    if(keyCode == UP) {
    speed += 0.001;
    }
   if(keyCode == DOWN)
   {
     speed -= 0.001;
   }
   if(keyCode == LEFT)
   {
     view += 0.001;
   }
   if(keyCode == RIGHT)
    {
        view -= 0.001;
    }
}
}



