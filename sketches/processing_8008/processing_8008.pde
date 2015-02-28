
//Thanks to Alasdair Turner for recursion reference

float b;

void setup() { 

  size(700, 700); 
  smooth(); 
  strokeCap(SQUARE);

} 

void draw() {

  background(0);  
  strokeWeight(18); 
  map(mouseX, 0, width, 0, PI/20);
  translate(width/2, height/2); 
  element(0); 
  println(mouseX);

} 

void element(int recursion) {
  
  if (recursion < 12) { 
    stroke(255, random(50, 200));
    b++;
    float a = sin(b);
    rotate(a/2000 * PI);
    line(0 + mouseX, 0, 0 + mouseX, height/3); 
    pushMatrix(); 
    translate(0, height/5); 
    rotate(noise(-PI/4, PI/4) + mouseX); 
    scale(0.7); 
    element(recursion + 1); 
    popMatrix(); 
    pushMatrix(); 
    translate(0, -height/3); 
    rotate(noise(-PI/4, PI/4) + mouseX); 
    scale(0.7); 
    element(recursion + 1); 
    popMatrix(); 
  }
  
}




