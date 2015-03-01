
int x1=50;
int x2=100;
int x3=150;
int y1=0;
int y2=300;
int y3=350;


void setup() {
  size(600,600);
  background(255);
}


void draw() {
  //background(255);
  stroke(128,0,64);
  if (mouseY>300) {
    background(255, 60, 50);
  line(mouseX,mouseY,x2,y2);
  
  }
  else{
    background(0);
  line(mouseX,mouseY,x3,y3);
  
  
  
  }
 
}
