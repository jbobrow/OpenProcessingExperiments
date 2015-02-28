
int x = 20;
int y = 20;
 
int dx = 5;
int dy = 5;
 
void setup(){
size(400,300)
}
 
void draw(){
background(0,0,0);
fill(0,255,0);
ellipse(x,y,20,20);
rect(mouseX,mouseY,20,20);
if (y>height-10){
dy = -dy
}
if (y<0){
dy = -dy
}
if (x>width-10){
dx = -dx
}
if (x<0){
dx = -dx
}
y = y + dy;
x = x + dx;
if (x == mouseX-10|| x == mouseX+10){
dx = -dx;
}
if (y == mouseY-10|| y == mouseY+10){
dy = -dy;
}
}
