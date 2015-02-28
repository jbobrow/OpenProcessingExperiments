
//Move the mouse to change directions
Rectangle[] c;

void setup()
{
 size(500,500);
 smooth();
 fill(20, 255, 50);
 frameRate(50);

c = new Rectangle[750];
for(int i=0; i<c.length; i++)
{
 c[i] = new Rectangle(); 
 c[i].x = random(width+500);
 c[i].y = random(height+500);
 c[i].a = (int)random(1, 10);
 c[i].b = (int)random(2,12);
}
}
void draw()
{
  background(0);
  for(int i=0; i<c.length; i++)
  {
   c[i].move();
   c[i].show(); 
  }
} 

class Rectangle
{
 float x, y;
 int a, b;

 void show()
{
 fill(random(255),random(255),random(255),random(255));
 rotate(360);
 rect(x,y,a,a);
}

void move()
{
  x += ( mouseX - width/2  ) * 0.01 ;
  y += ( mouseY - height/2 ) * 0.01 ;
}
}

