
float angle=0;
int o;
int j;
int p;
boolean colors;
 
void setup() {
  size(400,400);
  background(255);
  stroke(0);
  o=100;
  j=50;
  p=150;
  colors=false;
}
 
void draw(){
  fill(o,j,p);
   noStroke();
  if(mousePressed==true){
  translate(mouseX,mouseY);
  rotate(angle);
  rect(0,0,mouseX/4,mouseY/4);
  angle+=0.07;
   
    if(!colors){
      o++;
      j--;
      p--;
    }else if (colors) {
    o--;
    j++;
    p++;
    }
    if(j<=0 || j>=255) {
      colors= !colors;
    }
  }
}
   void mouseMoved() {
      background(0);
   }
