

                
                size (600, 600);
background (255);
stroke(0);
strokeWeight(2);


for (int x=60; x<540; x+=60) {
    line (60, 60, 540, 60);
    line (60, 60, 60, 540);
    line (x,60, 60, 600-x);;
  }
