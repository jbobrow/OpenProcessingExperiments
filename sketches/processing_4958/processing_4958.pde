
/*
Flowers
adalau85@gmail.com
October 4, 2009
*/

void setup() {
  size(500,500,P3D);
  background(255);
  smooth();
  strokeWeight(0.5);
};

void draw() {
  
   //when mouse is pressed, flowers will be drawn
   if(mousePressed) {
       fill(138,43,226,80);
       ellipse(mouseX, mouseY,40,20);
       fill(238,130,238,80);
       ellipse(mouseX-25,mouseY-25,20,40);
       fill(138,43,226,80);
       ellipse(mouseX-50, mouseY, 40,20);
       fill(238,130,238,80);
       ellipse(mouseX-25,mouseY+25,20,40);
       fill(255,105,180,80);
       ellipse(mouseX-25,mouseY,20,20);
   }
};

