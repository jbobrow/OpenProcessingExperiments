
//Prog. dinamica

float x1,x2;
float y1,y2;

void setup()
{
//Info declarada una vez
size(600,600);
}

void draw()
{
//Info declarada que pinta cada frame
fill(255, 10);
rect(0,0,width,height); //rectangulo de tamaño size
x1=x1+1;
x2=x2-1;
y1=y1+1;
y2=y2-1;
line(x1,y1,x2,y2);
float x3=random(600);
float y3=random(600);
line(x3,y1,x3,y3);
}
