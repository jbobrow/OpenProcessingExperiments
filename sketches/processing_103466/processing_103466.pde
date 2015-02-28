
curveVertex(x3, y3);
    curveVertex(x4, y4);
    endShape();
  }

  void step() {

    // choose direction
    float stepx = randomGaussian()*10;
    float stepy = randomGaussian()*10;
    /*    
     // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
     float xloc = randomGaussian();
     float yloc = randomGaussian();
     
     float sd = 40;                // Define a standard deviation
     float meanX = width/2;         // Define a mean value (middle of the screen along the x-axis)
     xloc = ( xloc * sd ) + x;  // Scale the gaussian random number by standard deviation and mean
     
     float meanY = height/2;         // Define a mean value (middle of the screen along the y-axis)
     yloc = ( yloc * sd ) + y;  // Scale the gaussian random number by standard deviation and mean
     */

    x4=x3;
    y4=y3;

    x3=x2;
    y3=y2;

    x2=x1;
    y2=y1;


    x1 += stepx;
    y1 += stepy;

    x1 = constrain(x1, 0, width-1);
    y1 = constrain(y1, 0, height-1);
    println(stepx+" "+stepy+" "+x1+" "+y1);
  }
}
