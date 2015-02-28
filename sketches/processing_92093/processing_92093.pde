
// © Julia Shen
// yuans @ andrew.cmu.edu

float [ ] x = {
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  
};
float [ ] y = {
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
};
float [ ] z = {
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
};


color [ ] col = {
   
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
   
};



void setup()
{
  size(400, 400);
  background(255);
 

  for (int i = 0; i < x.length; i++) {
    
   noStroke(); 
   ellipse(x[i], y[i], z[i], z[i]);
   fill(col[i]);
  
  }
  
  for ( int i = 0; i < width; i += 10 )
  {
        line( i, 0, width-i, height);
        stroke(255);
        strokeWeight(1);
  } 
}






