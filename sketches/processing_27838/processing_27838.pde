
void setup() {
  size(500, 500);
  background(255);
   noStroke();
  smooth();
}
 
void draw() {
  fill(0);
  //rect(100, 380, 40, 40);
  //mouseX, mouseY
   
  // wenn die Maus gedrückt ist…
if (mousePressed)  {
    // zeichne eine ellipse an der Mausposition
     ellipse (80, mouseY, 10, 10);
     ellipse (mouseX, 45, 10, 10);

     ellipse (160, mouseY, 30, 30);
     ellipse (mouseX, 135, 30, 30);
     
     ellipse (240, mouseY, 50, 50);
     ellipse (mouseX, 225, 50, 50);
     
      ellipse (320, mouseY, 70, 70);
     ellipse (mouseX, 315, 70, 70);
     
      ellipse (400, mouseY, 90, 90);
     ellipse (mouseX, 405, 90, 90);
     }
    
   }


