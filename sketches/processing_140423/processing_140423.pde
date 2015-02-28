
// base example for color experiments
// AW, March 2014

color c1;          //filling
color c2;          //background
color c3;          //stroke

void setup() {
  colorMode(HSB, 360, 100, 100);
  background(color((int) random(25, 35), 42, 100));
  size(400,400);
  strokeWeight(4);  
}

void draw() {
  defineColors();
  fill(c1);
  stroke(c3);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
}
  
void defineColors() {
   /*//Cup Cake, RGB
   c1 = color(255, 226, 161);
   c2 = color(232, 192, 135);
   c3 = color(255, 195, 148);
   */
   
   //Cup Cake, HSB
   c1 = color((int) random(30,50), 37, 100);
   c2 = color((int) random(20, 60), 42, 91);
   c3 = color((int) random(25, 35), 42, 100);
   
}
