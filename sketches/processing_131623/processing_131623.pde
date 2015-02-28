
     void setup() {
       size(400, 400);
       background(255);
     } 

     void draw() {
       if (mousePressed) {
         stroke(0, 225, 225);
         fill (125, 225, 255);
       } else {
         stroke(0);
         fill (255);
       }
       line(mouseY, mouseX, mouseX, mouseY);
     }

void keyPressed() {
if (key == 'c') background(255);
}




