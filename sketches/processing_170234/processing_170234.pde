
float moon = 0;
 
void setup() {
  size (300,300);
}
 
void draw() {
  background(12,25,46);
   
  for (float i = 0; i<width; i++) {
    line (i,height-noise(i/50)*100,i,height);
  }
  stroke(43,62,37);
  fill(253,255,165);
  ellipse(width/2 + sin(moon)*70,height/2,30,30);
  moon = moon + 0.03;
}

