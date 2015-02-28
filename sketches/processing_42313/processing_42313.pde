
//by Michael Yu

swag a, b, c, d, e;

void setup()
{
  size(1200, 700);
  smooth();

}

void draw()
{
  fill(0, 15);
  rect(0, 0, 1200, 700);
  a = new swag();
  a.x = mouseX;
  a.y = random(0,700);
  a.o = random(50, 100);
  a.r = 118;
  a.g = 117;
  a.b = 117;
  
  b = new swag();
  b.x = mouseX+75;
  b.y = random(0,700);
  b.o = random(50, 100);
  b.r = 118;
  b.g = 117;
  b.b = 117;
  
  c = new swag();
  c.x = mouseX;
  c.y = random(0,700);
  c.o = random(50, 100);
  c.r = 118;
  c.g = 117;
  c.b = 117;
  
  d = new swag();
  d.x = mouseX;
  d.y = random(0,700);
  d.o = random(50, 100);
  d.r = 118;
  d.g = 117;
  d.b = 117;
  
  a.show();
  b.show();
  c.show();
  d.show();
}

class swag
{
  float x, y, r, g, b, o, text1;
  
  void show()
{
  fill(r, g, b, o);
  if(mousePressed==true)
  {
  text("Live Hard, Die Hard",random(0,1200),random(0,700));
  text("I Run Straight Into Pain",x+200,y);
  text("You Mad, Bro?",x-200,y);
  }
  for(int i=0; i<100; i=i+1)
  {
   text("*",x+random(0,1200),y);
   text("*",x-random(0,1200),y);
   
  }
  
  
}

}


