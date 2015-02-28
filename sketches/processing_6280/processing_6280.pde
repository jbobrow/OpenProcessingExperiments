
laser[] b;

void setup()
{
  size(500,500);
  smooth();
  stroke(240);
  fill(255,230);

  b = new laser[400];
  for(int i=0; i<400; i++)
  {
    b[i] = new laser();
    b[i].x = random(width+2,width*2);
    b[i].y = random(height,height*2);
    b[i].d = (int)random(mouseX/width-12,mouseY/height);
    b[i].v = (int)random(1,10);
    b[i].j = 255;
    b[i].h = 25;
    b[i].g = 0;

}



}

void draw()
{
  background(0,0,0);
  for(int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
  }
}

class laser
{
  
  float g,h,j; //color
  float x, y; //size
  int d, v;

  void show()
  {
    fill(g,h,j);
    quad(x/d,y/d,x,y,d,d,x/width,y/height);
   // ellipse(x,y, d,d/4);    

}

  void move()
  {
    x += ( mouseX - width ) * 0.91 * v;
    y += ( mouseY - height ) * 0.91 * v;
  }
}





