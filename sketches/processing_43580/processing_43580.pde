
//-------------------------------------------------------
//Halloween Sketching
//Joey Burnett and Nick Williams
//Calling out information from an image and representing 
//within a system.
//-------------------------------------------------------

PImage img;
int counter = 0;
int num = 200;      //Change this variable to change the 
                    //draw speed. More walkers = faster 
                    //drawing.
                    
Walker [] walkers = new Walker[num];

void setup() {
  size(374, 500);
  colorMode(HSB);
  img = loadImage("clown.jpg"); 
  background(0); 
  img.loadPixels(); 
  
  //Initial test to see where to place the walkers. If
  //the pixel is black, a walker cannot start there. 
  //This creates voids within the composition.

  for (int i=0; i<num; i++) { 
    float x = random(width); 
    float y = random(height); 
    if (img.get(int(x), int(y)) == color(0, 0, 0)) { 
      i--; 
    }
    else { 
      walkers[i] = new Walker(x, y);
    }
  }
}

//------------------------------------------------------
//Each frame calls on the class functions. The if 
//statement limits the number of frames that will be 
//drawn. The variable limits the detail of the drawing
//from each sketch.
//-------------------------------------------------------

void draw() {
  int limits = floor(random(25000,125000));
  if (counter < limits) {
    for (int i=0; i<num; i++) { 
      walkers[i].RedWalk(); 
      walkers[i].GreyWalk();
      walkers[i].GreyMassing();
      walkers[i].RedMassing(); 

       println(counter);
    }
  }
}

//  -------------------------------------------------------
//  This is where the magic happens
//  -------------------------------------------------------

class Walker {
  float x; 
  float y; 
  
  float xGrey;
  float yGrey;


  Walker(float xPosition, float yPosition) {
    x=xPosition; 
    y=yPosition; 
    xGrey=xPosition+1;
    yGrey=yPosition+1;
  }
  
//  ----------------------------------------------------
//  These walking functions change the coordinates of 
//  what pixel is being tested. The RedWalk has a more 
//  organized method of testing which distiguishes it
//  from the grey massing. 
//  ----------------------------------------------------

  void RedWalk() { 

    float xv = random(2); 
    float yv = random(2); 

    x+=xv; 
    y+=yv; 

    if (x>width) x = 0; 
    if (x<0) x = width; 
    if (y>height) y = 0;
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(255, 255, 255)) { 
      if (random(2)>1) {     
        yv = -yv; 
      }
      else {
        xv = -xv; 
      }
    }
  }

  void GreyWalk() { 

    float xv = random(-2,2); 
    float yv = random(-2,2);

    xGrey+=xv; 
    yGrey+=yv; 

    if (xGrey>width) xGrey = 0;
    if (xGrey<0) xGrey = width; 
    if (yGrey>height) yGrey = 0;
    if (yGrey<0) yGrey = height;

    if (img.get(int(xGrey), int(yGrey)) != color(255, 255, 255)) {
      if (random(2)>1) { 
        yv = -yv; 
      }
      else {
        xv = -xv; 
      }
    }
  }
  
//  -------------------------------------------------------------------
//  The RedMassing function looks at the hues of the image. Since the 
//  image used in the code is fairly minimal, the threshold had to be 
//  fairly narrow. This massing really starts to define the general
//  form without calling out too much definition within it.
//  -------------------------------------------------------------------

  void RedMassing() {
    color sample = img.get(int(x), int(y));

    if (hue(sample) > 45 && (hue(sample) < 75)) {    
      stroke(10, 100, 100);

      point(x, y); 
      counter++;
    }
  }
  
//  ----------------------------------------------------------------------
//  The GreyMassing function is going to bring out the brighter parts of 
//  the image. This will bring the highlights of the image out, and the 
//  threshold is low enough to allow whole parts of the image to be drawn,
//  creating depth.
//  ----------------------------------------------------------------------

  void GreyMassing() {

    color sample = img.get(int(xGrey), int(yGrey));

    if ((brightness(sample) > 60) && (brightness(sample) < 100)) { 
      stroke(50);

      point(xGrey, yGrey); 
    }
  }
}


