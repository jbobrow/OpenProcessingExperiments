
size(600, 600);
smooth();
background(0);

//white
   // for (int z = 3; z<=18; z=z+1) {
      for (int x = 4; x<=width; x=x+5) {
        for (int y = 4; y<=width; y=y+180) {
          stroke(255,10);
          noFill();
          quad (x, y, x+20, y+20, x*1.75, y*1.75, 470, 300);
        }
      }
      //rotate(z);
  //  }
  
  //purple
   // for (int z = 3; z<=18; z=z+1) {
      for (int x = 3; x<=width; x=x+5) {
        for (int y = 3; y<=width; y=y+180) {
          stroke(119,28,211,5);
          noFill();
          quad (x, y, x+20, y+20, x*1.75, y*1.75, 470, 300);
        }
      }
      //rotate(z);
  //  }
  
    //green
  /* // for (int z = 3; z<=18; z=z+1) {
      for (int x = 5; x<=width; x=x+5) {
        for (int y = 5; y<=width; y=y+180) {
          stroke(35,144,90,5);
          noFill();
          quad (x, y, x+20, y+20, x*1.75, y*1.75, 470, 300);
        }
      }
      //rotate(z);
  //  }
  */

