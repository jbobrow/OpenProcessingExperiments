
float x; float y;
float money;
void setup()
{size(600,600);
x=0;
y=0;
money=0;
}
void draw()
{background(255,0,0);
frameRate(10);
translate(width/2,height);
rect(0,0,-50,-300);
translate(-25,-300);
rotate(money);
rect(0,0,-25,-150);
translate(-25/2,-150);
rotate(money);
rect(0,0,-25/2,-75);
money +=(PI/1.5);
}
