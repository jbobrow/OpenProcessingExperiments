
float Sx,Sy;
void setup()
{
background(20,150,210);
  Sx=100;
  Sy=150;
size( 400,400 );
fill(78,189,28);
arc(Sx, Sy, 80, 80, .5*PI, 1.75*PI, OPEN);
arc(Sx, Sy+80, 80, 80, -.5*PI, .75*PI, OPEN);
rect(Sx+50, Sy-40, 80, 160, 0, 180, 180, 0);
triangle(Sx+140, Sy-40, 310, 110, 275, 270);
triangle(Sx+260, Sy-40, 290, 110, 325, 270);

}


