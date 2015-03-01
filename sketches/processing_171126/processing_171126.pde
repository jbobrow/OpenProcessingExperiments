
void setup (){
size (400,400);
background (255);
frameRate (10);
}
int x;
int y;
int lato=40;

void draw (){

x= 0;
y=0;   
//if( keyPressed ==true && key== 'space'){


for( int r=0; r<10; r++){
fill( random(253), random(255), random (56));
rect(x,y,lato,lato);
x=x+lato;
fill(random(240),random(10), random(63));
rect(x-40,y+40,lato,lato);
fill(random (255),random(255),random(50));
rect(x-40,y+80,lato,lato);
}
}

