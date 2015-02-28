
 
void setup() {
  size(500,500);
  smooth();
  strokeWeight(99);
}
 
void draw() {
  background(224,255,255);
  stroke(102);
  fill(14,12,255);
  ellipse(200, 200, 80,80);
  if (mousePressed){
    if (mouseButton == LEFT) {
      stroke(235,75,92);
    } else {
      stroke(0,12,14);
    }
    fill(255,0,0);
    rect(100,100,90,90);
  }
  
}




