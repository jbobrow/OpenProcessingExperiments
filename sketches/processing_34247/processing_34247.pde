
 /*
 Norman Diaz
 Drawing Tool
 */
 
 
 
int a = 0;
int b = 0;
boolean whichside = true;
 
void setup() {
  size(500, 500);
  background(0);
}
 
void draw() {
  a = mouseX;
  b = mouseY;
  if (whichside == true) {
    bezierc1(a,b);
  } else {
    bezierc2(a,b);
  }
}
 
void bezierc1(int x, int y){
  stroke(0,200);
  fill(255,5);
  bezier(0,0,x*1,y*7,x+45,y+100,300,100);
}
 
void bezierc2(int x, int y){
  stroke(0,200);
  fill(255,5);
  bezier(500,0,x*1,y*7,x-45,y-300,50,300);
}
 
void mousePressed() {
  whichside = !whichside;
}

