
void setup () {
  size (500,500);
}

void draw () {
  background (255);
  
 
  fill (random(0,255), random(0,255), random(0,230), random(0,200));
  
  for (int i=0; i<50; i++) {
    ellipse (random (0, width), random(0, height), 10*i, 10*i);

}

}

