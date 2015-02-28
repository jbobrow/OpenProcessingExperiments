
boolean fswitch = false;
     
void setup() {
  size(800,500);
  noStroke();
  smooth();
  background(#B0E2FF);
  fill (#FFFF00,100);
  ellipse (600,80,150,150);
}
 
 
void draw() {
  frameRate(10);
  if(fswitch==false){
    fill(250,60);
    float r = random (60-300);
   ellipse(mouseX,mouseY,r,60);
   
   
  }
  else {
    fill(0,60);
    float r = random (60-300);
   ellipse(mouseX,mouseY,r,60);
  }
}

 
void mouseMoved() {
  fswitch=false;
}
 
void mouseDragged() {
  fswitch=true;
}

