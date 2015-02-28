
int x = 15;
int y = 15;
int dx = 5;
int dy = 3;
void setup()    //
{    size(600,300);
}
void draw()    //
{    background(255,255,255)
     fill(255,0,0);
     ellipse(x,y,30,30);
     if (y>=285) {
         dy = -dy}
     if (y<15){
         dy = -dy}
     if (x>=585) {
         dx = -dx}
     if (x<15) {
         dx = -dx}
     x=x+dx;
     y=y+dy;
     if (mousePressed) {
     x = mouseX-dy;
     y = mouseY-dx;
     }
}
