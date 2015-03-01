
float x;
float y;
float stock;
void setup()
{
 size(800,800);
x=0;
y=0;
stock=0;
frameRate(40);
}
void draw()
{ translate(width/2,height/2);
rotate(stock);
stroke(random(200,255),mouseX,mouseY);
strokeWeight(30);
rect(x,y,50,50);
x = x +1;
y = y +1;
stock +=PI/48;
}
void mousePressed()
{
  background(random(100,255),random(200,234),random(12,100));
  x=0;
  y=0;
}

