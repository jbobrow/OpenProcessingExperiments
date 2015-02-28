
// KIM PHAM
// WEICH - HART
void setup(){
  size(800, 600);
  smooth();
  background(255);
  frameRate(20);
}
void draw() {
if(mousePressed==true){
fill(0,30);
strokeWeight(random(.1));
rect (mouseX,mouseY,300,200);

} else {
noStroke();
fill(0,02);
ellipse(mouseX,mouseY,600,600);
} 
}

