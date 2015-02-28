
int X = 100;
int Y = 100;
int X1 = 200;
int Y2 = 100;


void setup()
{
size(700,700);
}
void draw()
{  

Y = Y+1;
Y2 = Y2+1;
line(X,Y,X1,Y2);

float elli1 = random(1,700);
float elli2 = random(1,700);
float elli3 = random(1,200);
float elli4 = random(1,200);
float fill = random(1,255);
float fill1 = random(1,255);
float fill2 = random(1,255);
background(255,255,255);
fill(fill,fill1,fill2);
ellipse(elli1,elli2,elli3,elli4);

}
