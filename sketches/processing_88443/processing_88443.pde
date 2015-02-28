
void setup(){
  size (300, 300);
  background(#398342);
  strokeWeight(250);
}
  
  void draw() {
  for (int COOL = 10; COOL < width; COOL++) {
    float r = random(120);
    stroke(r); // random generates a random number
    background(#A7FF12);
    line(100, 0, COOL, width); // i call this the epilepsy game
  }
  }
    


