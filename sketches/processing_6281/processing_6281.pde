
laser[] b;

void setup()
{
  size(500,500);
  smooth();
  stroke(240);
  fill(255,230);

  b = new laser[200];
  for(int i=0; i<200; i++)
  {
    b[i] = new laser();
    b[i].x = random(width+2,width*2);
    b[i].y = random(height,height*2);
    b[i].d = (int)random(mouseX/width-12,mouseY/height);
    b[i].v = (int)random(1,10);
    b[i].j = 0;
    b[i].h = 0;
    b[i].g = 255;
    b[i].g1 = 55;
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
  float g1,h1,j1;//stroke color
  float g,h,j; //color
  float x, y; //size
  int d, v;
  
  
  void show()
  {
    stroke(g1,h1,j1);
    fill(g,h,j);
    ellipse(d,d,x,y/height);
    rect(x,2/y,d/width,d/height);
    quad(x/d-4,y/d+23,x,y,d+234,d,x/width-1,y/height);
   // ellipse(x,y, d,d/4);    

}

  void move()
  {
    x += ( mouseX/width  ) * 5.21 * v;
    y += ( mouseY/height-2  ) * 5.21 * v;
  }
}





