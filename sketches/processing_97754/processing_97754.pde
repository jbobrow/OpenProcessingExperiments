
//Rafael - Exercicio de Reforço 6
void setup () {
  size(200, 200);
  background(250,187,25);
}
void draw () {
  stroke (255);
  fill (31,74,193);
    for (int x=40; x<191; x=x+30) {
    for (int y=40; y<200; y=y+30)
      ellipse (x, y, 9, 9); 
    
   for (int z=30; z<160; z+= 30) {
      for (int j= 50; j<175; j=j+30)
        rect (z+10, j, 1, 10);
      line (x+20, z+10, x+10, z+10);
    }
  }
  noStroke ();
  fill (250,187,25);
  stroke (255);
  fill (39,250,25);
  ellipse (100, 130, 9, 9);
  ellipse (130, 130, 9, 9);
}
