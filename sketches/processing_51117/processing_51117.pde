
size(600, 600);

stroke(1);
stroke(120, 120, 80, 30);


  for (int y=0; y<=height-20; y+=10) {
    for (int x=10; x<=width-20; x+=11) {
      line(x*20, y/3*8, x/2, 8/2);
    }
  }



stroke(1);
stroke(204, 102, 0);


  for (int y=0; y<=height-20; y+=10) {
    for (int x=0; x<=width-20; x+=20) {
      line(x*20, y, x/2, 8/3);
    }
  }


stroke(1);
stroke(20, 10, 0,20);


  for (int y=0; y<=height-20; y+=10) {
    for (int x=0; x<=width-20; x+=11) {
      line(x*20, y/8, x/2, 8/3);
    }
  }

    
