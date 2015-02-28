
void setup() {
     size(500, 500);
     background(255);
     smooth();
     frameRate(15);
}
   void draw() {
    
     if (mousePressed) {
        noFill();
        stroke(1,9);
     } else {
       noStroke();
fill(255,0,0,20);
}
if (dist(mouseX, mouseY, 70, 80) < 250) {
  ellipse(mouseX, mouseY,mouseX*2/3, mouseY*2/3);
}
if (dist(mouseX, mouseY, 70, 80) > 250){
   ellipse(mouseX, mouseY,mouseX/5, mouseY/5);
   fill(0,0,255, 20);
}


ellipse(mouseX, mouseY, 70, 80);
   }
