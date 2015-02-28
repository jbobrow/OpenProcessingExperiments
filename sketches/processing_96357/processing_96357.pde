
size(200, 200);
background (50,100,150);

for (int x=1; x<200; x=x+25) {
  for (int y=1; y<200; y=y+25) {
    noStroke ();
    fill (255,255,255,50);
    rect(x,y,22,22);  
    
  }
}
