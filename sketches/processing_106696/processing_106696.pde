
int x = 40;
int y = 70;
int dx = 1;
int dy = 1;



void setup (){

size (200, 200);
}

void draw (){
background (255,255,255);

fill (255, 0, 10);
ellipse (x,y,10,10);

x=x+dx
y=y+dy

if (y>200){
dy = -dy;
}

if (y<0){
dy = -dy;
}

if (x<0){
dx = -dx;
}

if (x>200){
dx = -dx;

if (mousePressed);
x= mouseX
y= mouseY
}

}
