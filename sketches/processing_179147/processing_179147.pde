
void setup () {
  size (600, 600);
  smooth();
}
 
void draw () {
 
  background(#57385c);
 
  if (mousePressed == true) {
    translate (-mouseX*4, -mouseY*4);
    scale (4);
  }
 
  noFill();
  stroke(#ffedbc);
  
  cantor (50, height*0.4, width-100);
}
 
void cantor(float x, float y, float laenge) {
   
  strokeWeight(laenge / 100);
  line(x, y, x+laenge, y);
 
  if (laenge > 4) {
     
    cantor (x, y + 20, laenge*0.333);
    cantor (x+laenge*0.667, y + 20, laenge*0.333);

  }
}
