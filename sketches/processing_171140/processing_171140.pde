

void setup (){
size (400,400);
background (255,255,53);
frameRate (10);
}
int x;
int y;
int lato=40;

void draw (){
x=0;
y=0;

for( int r=0; r<10; r++ ){
  fill( random(253), random(255), random (56));
rect(x,y,lato,lato);
x=x+lato;
for (int s=0; s<10; s++);
fill( random(253), random(255), random (56));
rect(x,y+50,lato,lato);
x=x+lato;


}
}
