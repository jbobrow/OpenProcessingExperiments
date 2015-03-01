
float x;
float y;
float stock;
void setup()
{
  background(255);
 size(800,800);
//stock=scale (2);
x=0;
y=0;
stock=0;
frameRate(40);
}
void draw()
{ //rotate(TWO_PI/x/y);
translate(width/2,height/2);
rotate(stock);
stroke(random(200,255),mouseX,mouseY);
strokeWeight(30);
point(x,y);
//ellipse(0,0,500,10);
//stock = scale(2);//blablabla
x = x +1;
y = y +1;
stock +=PI/48;
}

