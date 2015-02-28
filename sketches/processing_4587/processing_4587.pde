
float x=150,y=2;
void setup()
{
size(400,400);
noCursor();
}

void draw()
{
background(0);  
fill(20,20,200,90);
bezier(x,y,y,PI,y,0,0,mouseY);
y=random(y)*5;
x++;
if(y>400){y=2;}
if(x>300){x=150;}
}

