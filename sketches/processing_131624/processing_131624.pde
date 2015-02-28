
     void setup() {
       size(400, 400);
       background(255, 25, 25);
     } 

     void draw() {
       if (mousePressed) {
         stroke(255, 0, 255);
         fill (125, 255, 255);
       } else {
         stroke(255, 255, 0);
         fill (25, 55, 0);
       }
       ellipse(mouseX, mouseY, mouseY, mouseX);
     }

void keyPressed() {
if (key == 'c') background(255, 25, 25);
}



