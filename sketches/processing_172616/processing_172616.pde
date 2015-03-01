
int num = 100;
Triangle[] triangle_array = new Triangle[num];

class Triangle
{
 
 float x,y,x1,y1,x2,y2;
 float vx,vy;
 float drag;
 
Triangle()
{
x = random(width);
y = random(height);
x1 = x+40;
y1 = y+40;
x2 = x1+40;
y2 = y1+40;
drag = .099;
vy = random(-5,5);
vx = random(-5,5);

}

void update()
{
x+=vx*drag;
y+=vy*drag;

}

void display()
{
pushMatrix();
fill(247,245,220,250);
triangle(x,y,x1,y1,x2,y2);
translate(x,y);
translate(x1,y1);
translate(x2,y2);
popMatrix();
}

}



void setup()
{
size(500,500);

for(int i=0; i<num; i++)
  {
    triangle_array[i] = new Triangle();  
  }
}


void draw()
{
background(0);

  for(int i=0; i<num; i++)
  {
   triangle_array[i].update();
   triangle_array[i].display();
     
  }
 
 
for(int i = 0; i<num; i++)
{
 for(int j = i+1; j<num; j++)
 {
  
  float x3 = triangle_array[i].x;
  float y3 = triangle_array[i].y;
  float x4 = triangle_array[j].x;
  float y4 = triangle_array[j].y;
  float x5 = triangle_array[i].x1;
  float y5 = triangle_array[i].y1;
  float x6 = triangle_array[j].x1;
  float y6 = triangle_array[j].y1;
  float x7 = triangle_array[i].x2;
  float y7 = triangle_array[i].y2;
  float x8 = triangle_array[j].x2;
  float y8 = triangle_array[j].y2;
  
  if(dist(x3,y3,x4,y4) < 80)
  {
    line (x3,y3,x4,y4);
  }
  if(dist(x5,y5,x6,y6) < 80)
  {
    line (x5,y5,x6,y6);
  }
  if(dist(x7,y7,x8,y8) < 80)
  {
    line (x7,y7,x8,y8);
  }
 }

}

}
