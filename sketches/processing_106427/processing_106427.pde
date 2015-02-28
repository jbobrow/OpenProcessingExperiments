
int x=20;
int y=20;
int dy=2;
int dx=1;


void setup()
{
size(300,400);
}

void draw()
{
 ellipse(x,y,20,20);
 
 fill(30,80,190);
 if(y>400)
 {dy=-dy
 }
x=x+dx;
y=y+dy; 
 
 
 
 if(mousePressed)
 {
 x=mouseX;
 y=mouseY;
 }

}
