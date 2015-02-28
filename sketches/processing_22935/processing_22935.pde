
////////////////////////////////////////////////
//            Awsome_ellipses                 //
//            By Lars Hopman                  //
//                                            //
//    Generates a immage with multiple        //
//  ellipses that have different diameters    //
////////////////////////////////////////////////

float space=10; //sets first ellipse's diameter.

void setup()
// sets the background size, shade and line size.
{
  background(255);
  size (600,600);
  strokeWeight(1);
}

void draw()
{
  fill(255,0);// to make ellipses transparent
  ellipse (300,300, space + random(-100,100),space + random(-100,100));// creates ellipse in the center and gets random diameters.
  
  space= space+random(0,10);// makes each consecutive ellipse generally larger than the last.
}

