
float incrementer = 0; 
void setup () {
  
  size (350,600);
  smooth();
}

void draw() {
  //background (200);
  fill (255,0,166);
  float yOff = sin (incrementer ) * 300;
  float xOff = cos (incrementer *7)*50;
  ellipse (175 + xOff, 300 + yOff,20,20);
  
  println (sin(incrementer)* 50);
  incrementer += .05;
}
