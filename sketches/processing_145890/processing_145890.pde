
size (500, 500);
background(#000000);
noStroke();
  
for (int x=1; x<25; x=x+1) {
    for (int y=1; y<25; y=y+1) {
      float rGray = random (0, 500);
        fill (rGray);
       
      //white boxes invisible
      if (rGray <= 255){
      stroke (0);
      rect (x*20, y*20, 15, 15);
      }
    }
}


