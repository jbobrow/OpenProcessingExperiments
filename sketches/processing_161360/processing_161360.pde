
noStroke ();
for (float x=1; x<51; x+=10){
  for (float y=2; x<y; y+=20){
    if (x>26){
      fill (x*5, x*4);
      rect (x, y, y+10, x+10);
    } else {
      fill (x%2, x*40);
      rect (x+10, y+10, y, x);
    }
  }
}


