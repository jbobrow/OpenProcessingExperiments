
float y = 1; 

void setup( )
{
  smooth(); 
  size( 750, 750 );
  background(255);

  noFill(); 
  stroke( 0, 16);
  strokeWeight( 1 );
  frameRate(10);
}



void draw( )
{

  int s = second();  // Values from 0 - 59

  float x = s % 12; 
  println(x); 
  point ( width/12 * x, height/12*y );

  for (int i = width/12; i < width - width/12; i = i+width/12*int(x)) {
    for (int j = height/12; j < height - height/12; j = j+height/12) {
//      ellipse(i, j, 55, 55);
      line(i +random(-25, 25), j + random(-25,25),i +random(-25, 25), j + random(-25,-25));
    }
  }

}



