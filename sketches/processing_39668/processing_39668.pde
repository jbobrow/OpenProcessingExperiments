
void setup() {
  size(900, 500);
  colorMode(HSB, 600);
  background(0,0,100);
  smooth();
}

void draw() {
  colorCallig();
}

 void colorCallig(){
  strokeWeight((mouseY + random(0,450)) * 0.1);
  stroke(mouseX * random(0.5,1), (mouseY * 0.75) * random(0.5,0.75), mouseY * 0.8, random(0,100));
  line(mouseX + (mouseX * 0.013), mouseY-(mouseX * 0.026), mouseX-(mouseX * 0.013), mouseY+(mouseX * 0.026));
 }
 
 void mousePressed(){
   background(0,0,100);
 }

