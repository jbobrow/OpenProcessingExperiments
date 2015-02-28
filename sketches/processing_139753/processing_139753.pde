
//Mady Dean 03/19/14 Creative Computing: Section B//

float x;
float y;
float px;
float py;
float easing = 0.10;

void setup() {
  size(600,600);
  background(0);
  smooth();
  stroke(255,0,0);
}

void draw(){
  float targetX = mouseX;
  x=x+(targetX-x)*easing;
  float targetY = mouseY;
  y=y+(targetY-y)*easing;
  float weight=dist(x,y,px,py);
  strokeWeight(weight);
  line(x,y,px,py);
 
 if (mousePressed == true) {
   stroke(0, 255, 255);
 }else{
   stroke(255, 0, 255);
 }
 

 if(keyPressed){
   stroke(255, 255, 0);
 }

  px=x;
  py=y;
}


