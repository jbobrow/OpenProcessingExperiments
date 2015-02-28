
int[] xwaarden = new int[20];
int[] ywaarden = new int[20];

//int 
void setup ()
{ size (600,600);
  smooth();
  
  for (int i=0;i<20;i++)
  { xwaarden[i] = 50*int (random (0,10));
    ywaarden[i] = 50*int (random (0,10));
  
  }
}

void draw ()
{ background (0);
  stroke  (0,0,255);
  fill (10,255,0);

  for (int i=0;i<20;i++)
  { 
    //int xpositie = 50*int (random (0,10));
    int xpositie = 50*int (random (0,50));
    int ypositie = 50*int (random (0,50));
  
    tekenEllipse (xwaarden[i], ypositie);
  }
  


}

void tekenEllipse(int x, int y)
{ ellipse ( x+ 10, y+10, 100, 100);
  ellipse ( x+ 10, y+10, 100, 100);
  
}


