
int a = 9;
int b = 0;
void setup() {
  size(500, 500);
  background(255);
}
 
void draw() {
  a = mouseX;
  b = width/2;
    linez(a,b);
}
 
void linez(int x, int y){
  stroke(0,20);
  noFill();
  bezier(width/2,0,
        x,y, 
        x,y,
        width/2,height);
}
