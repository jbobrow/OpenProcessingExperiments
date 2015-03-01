
int x,y;
float a=random(130-255);
float b=random(1-100);
float c=random(62-250);

void setup(){
size(600,600);
background(a);

}
void draw()
{

fill(a,b,c);
rect(x,y,width/50,width/50);
x=x+width/50;

a=random(255);
 b=random(255);
c=random(255);

if(x>=width){
  x=0;
  y=y+width/50;

}
}

