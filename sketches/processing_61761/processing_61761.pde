
void setup() {
  size(800,255);
  smooth();
  background (20);
}
 
void draw(){
  float r=random (800);
  float o=random (20);

  
  if(mousePressed==true){
    stroke (r);
    strokeWeight(o);
    ellipse(pmouseX,pmouseY,5,5);
  }
  
  if (mousePressed == true){
    stroke (mouseX-mouseY/10,0,0);
    strokeWeight(1);
    noFill();
    ellipse(r,r,r,r);
  }
  
  else if (mousePressed == false) {
    frameRate(13);
    background (0);
    noStroke();
    fill (r);
    rect (r,r,r,r);
  }
}




