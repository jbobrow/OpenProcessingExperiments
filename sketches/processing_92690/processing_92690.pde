
int baseAngle;
color backgroundCol, strokeCol, fillCol;

// Aufgabe: implementiere weitere "Rules" (triad, analogous, etc.) von kuler.adobe.com

void setup() {
  size(300,300);
  colorMode(HSB, 360, 100,100);
  strokeWeight(3);
  smooth(); 
  setComplementary();
}

void draw() {
  ellipse(mouseX, mouseY, 20,20); 
}
 
void mousePressed() {
 setComplementary();
} 

//------------------ Rule: complementary 
void setComplementary() {
  // Farbwinkel Abstand 180, S fest, B random
  baseAngle = int(random(255));  // Grundfarbe setzen
  backgroundCol = color(baseAngle, 80, 50+random(50));
  strokeCol = color(baseAngle+180, 80, 50+random(50));
   
  background(backgroundCol);
  stroke(strokeCol);
  noFill(); 
} 
 


