
void setup(){
  size(300,200);
  smooth();
 background(255);
}
void draw() {
   
if (mousePressed) {
stroke(100,0,0);
strokeWeight(2);
line(mouseX, mouseY, mouseX-30, mouseY-30);
} else {
stroke(0);
strokeWeight(1);
line(mouseX, mouseY, mouseX+20, mouseY+20);}
}

