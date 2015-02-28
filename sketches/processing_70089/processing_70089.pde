
size(500, 500);
background(0);
smooth();
ellipseMode(CENTER);
fill (18, 255, 233, 150);
  
  
for (int i=0; i<9; i++)
  {
    for (int j=0; j<9; j++)
      {
        ellipse (50+i*50, 50+j*50, 5+i*4, 5+i*4);
      }
   }
