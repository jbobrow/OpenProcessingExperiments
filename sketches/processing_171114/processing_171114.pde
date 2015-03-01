

void setup (){
size (400,400);
background (255,255,53);
frameRate (10);
}
int x;
int y;
int lato=40;

void draw (){

x= 0;
y=0;   


for( int r=0; r<10; r++){
strokeWeight(5);
stroke(255);
x=x+lato;
fill( random(254),random(222), random (256));
y=y+lato;
arc(x+20,y,x,y+40,PI,TWO_PI);
}
{
  
arc(x+20,y,x,y+40,PI,TWO_PI);
}
}

