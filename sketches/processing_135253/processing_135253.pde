
int x= 50;
int y= 50;
int grow= 1;

void setup()
{
 size(200,200); 
}

void draw()
{
 background(150);
 fill(255,0,0);
rect(x,y,50,50);
x=x+grow;
y=y+grow;

if(x>=width-50||x<0)
{
 grow=grow*-1; 
}
}


