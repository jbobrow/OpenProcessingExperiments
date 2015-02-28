
void setup ()
{
  size (400, 400);
  background (255);
  fill(0);
  noStroke();



}
void draw ()
{
  smooth();
  ellipseMode (CORNER);

  for ( int ii = 0; ii < 20; ii++ )
  {
    pushMatrix();                  // hier musst auch gemacht werden 
    translate( 0, ii*20  );        // hier wird das muster der drin ist vertikal kopiert.
    
    int a= 10;  
    pushMatrix();                  // push und pop damit die koordinaten dazu adiert und versetzt werden
    for ( int i = 0 ; i <20; i++ )
    {
      ellipse (0+i,0,a-i,a);
      ellipse (a+i,a,a-i,a);

      translate ( a*2,0);
    }
    popMatrix();
  popMatrix();
  }
}



