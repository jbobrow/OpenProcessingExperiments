
void setup () {

  size (1000, 400, P2D);
  background (0);
}

void draw () {
  smooth();
  

  
  strokeWeight (3);
  
  for (int i=1; i<=100; i=i+1) 
  {
    
  float r = map (i, 1,19, 100,255); //red increases
  float g = map (i, 1,19, 255,163); //green decreases
  float b = map (i, 1,19, 250,0); //blue goes away completely
  
  stroke (r,g,b);
  noFill ();
  ellipse (frameCount/i,10*i, 20,20);
}
}
