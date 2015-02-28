
class column {


 
  
  void run(float _height) {
    float x_place = 0;
    float y_place = 0;
    
    cylinder(2, _height, 3); //SET WIDTH, _height, NUMBER OF SIDES
  }


  void cylinder(float w, float h, int sides)
  {
    float angle;
    float[] x = new float[sides+1];
    float[] z = new float[sides+1];

    //get the x and z position on a circle for all the sides
    for (int i=0; i < x.length; i++) {
      angle = TWO_PI / (sides) * i;
      x[i] = sin(angle) * w;
      z[i] = cos(angle) * w;
    }

    //draw the top of the cylinder
    beginShape(TRIANGLE_FAN);

    vertex(0, -h/2, 0);

    for (int i=0; i < x.length; i++) {
      vertex(x[i], -h/2, z[i]);
    }

    endShape();

    //draw the center of the cylinder
    beginShape(QUAD_STRIP); 

    for (int i=0; i < x.length; i++) {
      vertex(x[i], -h/2, z[i]);
      vertex(x[i], h/2, z[i]);
    }

    endShape();

    //draw the bottom of the cylinder
    beginShape(TRIANGLE_FAN); 

    vertex(0, h/2, 0);

    for (int i=0; i < x.length; i++) {
      vertex(x[i], h/2, z[i]);
    }

    endShape();
  }
}


/**
 cylinder taken from http://wiki.processing.org/index.php/Cylinder
 @author matt ditton
 EDITED BY DAVID - OCT. 2011
 */

