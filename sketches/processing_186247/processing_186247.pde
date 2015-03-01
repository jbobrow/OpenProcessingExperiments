
int x,y;
float xBox,yBox;
float rd,yl,bl;
int xEye,yEye;

void setup() {
  size(640,480);
}
 
void draw(){
 background(255);
 
 x = mouseX;
 y = mouseY;
 xEye = 200;
 yEye = 200;
 
 xBox = map(x,0,639,xEye-50+18,xEye+50-18); //value, start1, stop1, start2, stop2
 yBox = map(y,0,479,yEye-50+18,yEye+50-18);
 fill(255,0,0);
 ellipse(xBox+111,yBox,20,20);
 ellipse(xBox,yBox,20,20);
 noFill();
 ellipse(xEye+111,yEye,100,100);
 ellipse(xEye,yEye,100,100);
 }
