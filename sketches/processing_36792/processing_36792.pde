

  size (500, 500);


  background (0, 0, 0);
  fill (65, 65, 65);
  noStroke();

  int nLines=28;

  for (int x=0; x<=width; x=x+45) {

    for (int y=1; y<=nLines; y=y+3) {






      float col= map (y, 1, nLines, 50, 255);


      fill (col);


      rect (x, y*20, 25, 25);
    }
  }

  int nLines1=28;

  for (int r=0; r<=width; r=r+15) {

    for (int p=1; p<=nLines1; p=p+1) {



      fill (242, 191, 22);

      ellipse (r, p*20, 4, 4);

      
    }
  }


