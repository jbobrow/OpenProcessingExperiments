
size (800, 800);
smooth ();
background (0);

//variable
int i=50;



  for (int y=10; y<400; y+=5) { 
    for (int x=10; x<800; x+=5) {
      fill(255-(x/2.5));
      stroke(255-(y/2.5),30);
      ellipse(x, y, x, x);
      ellipse(x, y, y, y);
    }
  }


