
float x;
float y;
float stock;
void setup()
{
 size(1000,1000);
x=0;
y=0;
stock=0;
frameRate(40);
}
void draw()
{background(random(100,255),random(12,100),random(100,200)); 
translate(width/2,height/2);
rotate(stock);
stroke(random(200,255),mouseX,mouseY);
strokeWeight(30);
fill(random(3),random(400),random(200),random(200));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
   ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
   ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
   ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
   ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(200), random(300));
  ellipse(x, y, random(5), random(200));
  ellipse(x, y, random(700), random(800));
   ellipse(x, y, random(500), random(600));
  ellipse(x, y, random(10), random(300));
  ellipse(x, y, random(100), random(100));
  ellipse(x, y, random(600), random(400));
  x = x + 3;
  y = y + 3;

stock +=PI/48;
}
void mousePressed()
{
  background(random(100,255),random(200,234),random(12,100));
 x =0;
 y =0;
}
