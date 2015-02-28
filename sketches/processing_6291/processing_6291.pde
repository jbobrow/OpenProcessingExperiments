
Ball []a;
PFont font;
void setup()
{
  size(600,600);
  smooth();
  stroke(100);
  fill(100);
  font = loadFont("BookmanOldStyle-Bold-20.vlw");
  textFont(font);
  
  a = new Ball[300];
  for(int i=0; i<a.length; i++)
  {
    a[i] = new Ball();
    a[i].x = random(-width,width);
    a[i].y = random(-height,height);
    a[i].d = (int)random(5,10);
    a[i].v = (int)random(40,60);
    a[i].c = color(150,150,100,200);
  }
}

void draw()
{
  background(10,10,24);
  fill(150,0,0);
  rect(mouseX,mouseY, 100, 50); 
  rect(mouseX,mouseY, 100, 25);
  stroke(100);
  text("Click to sneeze", width/3, height-550);
  text("If nauseated, please have sanitizer or inhaler at ready", width/24, height-500);  
  
  for(int i=0; i<a.length; i++)
  {
   a[i].move();
   a[i].show();
  }
  
  for(int i=0; i<a.length; i++)
  {
   if(mousePressed)
   {
     a[i].x = mouseX + random(0,80);
     a[i].y = mouseY + random(0,40);
   }
  }
}
class Ball
{
  float x, y;
  int d;
  int v;
  color c;
  
  void show()
  {
    fill(c);
    ellipse(x,y, d,d);
  }
  
  void move()
  {
    x += (random(-10,10)) * 0.1 * v;
    y += (random(-10,10)) * 0.1 * v;
  }  
}



