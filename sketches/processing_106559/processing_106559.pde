
int x = 20;
int y = 20;

int dx = 5;
int dy = 5;


void setup() {
    size(400,300)
}

void draw() {

background(0,255,255);
fill(255,0,0);
    ellipse(x,y,20,20);    
    
if(mousePressed){

fill(0,255,0);
ellipse(x,y,20,20);
fill(255,200,0);
ellipse(x,y,20,20);
x=mouseX
y=mouseY
}

if(y<0){
dx = -dx;
dy = -dy;
}

if (y>250){
dx = -dx;
dy = -dy;
}

x = x + dx
y = y + dy



}
