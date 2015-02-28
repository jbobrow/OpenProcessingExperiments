
//Prog. dinamica

float x=0;
float y=0;

void setup()
{
//Info declarada una vez
size(600,600);
fill(6);
scale(2.0);
}

void draw()
{
//Info declarada que pinta cada frame
fill(255, 10);
rect(0,0,width,height);
x=x+5;
y=300;
ellipse(x,y,50,50);

}
