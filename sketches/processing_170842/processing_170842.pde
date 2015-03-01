

void setup() {
size (400,400);
background(255);
frameRate (5);
}

int x;
int y;


void draw() {

if ( keyPressed == true && key== 't'){
background (255);
x= int (random(100,300));
y=int (random(110,300));
fill(255,255,53);
rect(x,y,80,10);
rect(x+35,y,10,80);
 
}
}
