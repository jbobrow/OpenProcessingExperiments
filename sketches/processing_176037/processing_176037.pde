

int num = 300;
Line[] line_array = new Line[num];
class Line
{
 float x,y;
 float _rotate;
 float vx,vy;
 
 Line()
{
 x = width/4;
 y = height/2;
 vy= random(-3,3);
 vx= random(-3,3);
 
}

void update()
{
  x+=vx;
  y+=vy;
}

void display()
{
 pushMatrix();
 stroke(0);
 rotate(_rotate);
 line(x,y, 100,100);
 popMatrix(); 
}
}

void setup()
{
 size (500,500);
  for(int i=0; i<num; i++)
  {
   line_array[i] = new Line(); 
  }
}

void draw()
{
 background (255);
 for(int i = 0; i<num; i++)
 {
  line_array[i].update();
  line_array[i].display(); 
 }
  
}
