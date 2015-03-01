
//int x,y,xc,yc;
int x,y;
void setup(){
  size(100,100);
  noStroke();
}
void draw(){
  x=mouseX;
  y=mouseY;
  //xc=255-x;
  //yc=255-y;
  //fill(x,y,0);
  fill(x,y);
  rect(0,0,255,255);
  //rect(0,0,255,255);
  //fill(xc,yc,255);
  //rect(50,50,155,155);  
}
