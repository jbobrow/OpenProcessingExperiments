
void setup() {
 size(550, 500);
 smooth();
}
void draw() {
 background(0);
 
 fill(255);
 ellipse(75, 75, 75, 75);
 ellipse(180,185,4,4);
 ellipse(246, 178, 4, 4);
 ellipse(270, 148, 4, 4);
 ellipse(234, 342, 4, 4);
 ellipse(327, 157, 4, 4);
 ellipse(176, 212, 4, 4);
 
 

 
translate(mouseX, mouseY);
 stroke(222, 209, 186);
 strokeWeight(70);
 
 fill(137, 101, 34);
 line(0, -35, 0, -65); // Body
 noStroke();
 fill(242, 222, 183);
 
 ellipse(-17.5, -65, 35, 35); // Left eye dome
 ellipse(17.5, -65, 35, 35); // Right eye dome
 arc(0, -65, 70, 70, 0, PI); // Chin
 fill(0);
 ellipse(-14, -65, 8, 8); // Left eye
 ellipse(14, -65, 8, 8); // Right eye
 fill(255, 181, 41);
 quad(0, -58, 4, -51, 0, -44, -4, -51); // Beak

 if (mousePressed) {
   fill(167, 155, 132);
  triangle(-35, -50, -35, -35, -90, -70);//Wings
  triangle(35, -50, 35, -35, 90, -70);// Wings
 } else {
 fill(167, 155, 132);
  triangle(35, -50, 35, -35, 90, -15);// Wings
  triangle(-35, -50, -35, -35, -90, -15);//Wings
 }
}
