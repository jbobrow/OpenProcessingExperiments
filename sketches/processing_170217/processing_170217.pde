
float a = 0;
 
void setup() {
  size (600,600);
}
 
void draw() {
  background(100);
   
  for (float i = 0; i<width; i++) {
    line (i,height-noise(i/100)*100,i,height);
  }
   
  ellipse(width/2 + sin(a)*100,height/2,30,30);
  a = a + 0.05;
}

