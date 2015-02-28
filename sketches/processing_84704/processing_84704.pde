
void setup()
{ 
  size(400, 600);
}

void draw()
{ 
  background (0);
  noLoop();

  for (int ix= 0; ix<400; ix= ix+40)
  { 
    for ( int iy= 0; iy<600; iy= iy+40)

    {
      stroke(0);
      fill(#FF0FD8, 60);
      rect(ix, iy, 40, 40);
      rect(ix, iy, 20, 20);
    }
  }

  for (int ix=15 ; ix<400 ;ix= ix+40)
  {
    for (int iy=15 ; iy<600 ; iy= iy+40)
    {
      fill(#14FF00);
      rect(ix, iy, 10, 10);
    }
  }
}



