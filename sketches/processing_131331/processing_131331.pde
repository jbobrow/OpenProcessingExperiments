
void setup() {
       size(500, 500, P3D);
       stroke(250);
     }

     void draw() {
       background(192, 64, 0);
       strokeWeight(mouseX);
       line(mouseX, mouseY, mouseY, mouseX, mouseX, mouseY);
     }


