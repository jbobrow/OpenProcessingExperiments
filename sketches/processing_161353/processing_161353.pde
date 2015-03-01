
for (int x= 0; x<51; x+=20) {
  for (int y= 1; y>x; y+=5){
    fill (x*5);
    noStroke ();
    rect (x, y, x*1.5, y*1.5);
  }
}
    


