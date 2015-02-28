
float xOff = 0;
float incrementer = 0; 
void setup () {
  
  size (350,600);
  smooth();
}

void draw() {
  //background (200);
  fill (255,0,166);
  float yOff = sin (incrementer* 2) * 100;
  //float xOff = cos (incrementer *2)*100;
  ellipse (xOff, 300 + yOff,20,20);
  
  println (sin(incrementer)* 50);
  incrementer += .05;
  xOff +=5;
  if (xOff > width) xOff =0;
}
