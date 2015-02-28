
void setup() {
       size(400, 400, P3D);
       stroke(255);
     }

     void draw() {
       background(192, 64, 0);
       strokeWeight(mouseX);
       line(mouseY, mouseX, mouseX, mouseY, mouseX, mouseY);
     }


