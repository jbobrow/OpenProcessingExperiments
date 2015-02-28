
size (600, 600); 
background(0);
smooth();

for (int x=-10; x<600; x=x+1) {
  for (int y=-10; y<600; y=y+1) {  
    
    noStroke ();
    fill (x, y*5, (x*x*10)/(y+11));
    rect (x*20-20, y*20, 20, 20);

    fill (0);
    arc (x*20, y*20, 20, 20, PI/2, PI*2);
    
    fill (0);
    arc (x*20-20, y*20, 10, 10, 0, PI/4);
  }
}
