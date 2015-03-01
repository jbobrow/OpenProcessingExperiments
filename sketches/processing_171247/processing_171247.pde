
int x=0; 
int y=0;

int c=#28D6DB;
int d=#28D6DB;
int e=#21CB33;
int f=#2E21CB;



float w;
void setup ()
{
size (200,200);
background(#EFF038);
}
void draw()
{
frameRate(24);
stroke (#1C1C0B);
strokeWeight (5);
fill(c);
c=c+50;


rect(x,y,width/10, height/10);
x=x;
x=x+width/10;


if(x>height){
x=0;
y=y+height/10; 
}
}
