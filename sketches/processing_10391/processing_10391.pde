
void setup ()
{ 
  size (480,640);
  background (255);
fill (0);

}

void draw()

{ 
  for (int ix=0; ix < 16; ix++)
  {
    for (int iy=0; iy< 16; iy++)
    {
  
      pushMatrix ();
      translate( ix*30, iy*40 );
      
      
      
      
      
    rect (0,0,10,20);

rect (10,10,10,30);

rect (20,20,10,10);
popMatrix ();

  }
  }

}

