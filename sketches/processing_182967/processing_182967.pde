
float x;
float y;
float stock;
void setup()
{
  background(255);
 size(800,800);
//stock=scale (2);
}
void draw()
{
translate(width/2,height/2);
rotate(TWO_PI/random(0.1,0.3));
ellipse(0,0,500,10);
//stock = scale(2);//blablabla
x = x +3;
y = y +3;
}

