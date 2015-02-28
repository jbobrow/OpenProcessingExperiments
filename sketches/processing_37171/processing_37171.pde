
  size (300, 300);
  background (255);
  fill (65, 65, 65);

  int nLines=10;

  for (int x=0; x<=width; x=x+15) {

    for (int y=1; y<=nLines; y=y+1) {
      
      
       float col= map (y, 1, nLines, 0, 255);


    fill (col);
        
       rect (x, y*10, 10, 10);
    }

  }
                
                                                
