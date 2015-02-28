
// KIM PHAM
// STEHEN - TANZEN
void setup(){
  size(800, 600);
  smooth();
  background(255);
  frameRate(20);
}
void draw() {
 if(mousePressed==true){
    fill(0,100);
    strokeWeight(random(.1));
    stroke(random(0),random(0),random(0),random(255));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
} else {
  strokeWeight(random(.01));
  line (mouseX,mouseY,100,600);
}
}

