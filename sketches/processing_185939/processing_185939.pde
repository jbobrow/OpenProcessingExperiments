
float  ringsx = 25, ringx = 25,str = 5;
void setup() {
  size(700, 500);
}
void draw() {
  frameRate(30);
  background(67);
  strokeWeight(str);
  stroke(0, 0, 50); 
  noFill();
  ellipse(250, 150, ringsx, ringsx);
  stroke(0); 
  ellipse(350, 150, ringsx, ringsx);
  stroke(255, 0, 0); 
  ellipse(450, 150, ringx, ringx);
  stroke(255, 242, 0); 
  ellipse(300, 250, ringsx, ringsx);
  stroke(0, 255, 0); 
  ellipse(400, 250, ringsx, ringsx);
  if (ringsx<150) {
    ringsx ++;
    str+=0.05;
  }
    if ((ringsx > 100) &&(ringx<150)){
      ringx++;
      str+=0.05;
   
  }
}
  

