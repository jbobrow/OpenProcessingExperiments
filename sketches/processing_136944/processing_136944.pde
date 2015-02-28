
// FIREWORKS ABOVE PARIS
//
// This sketch shows a cityscape of Paris. You are the one who ignites the fireworks
// above Paris!
//
// The sketch starts with a picture of Paris. The lights of city are reflected in
// the black sky.
// A mouseclick fires the fireworks.
// MouseX position: the position where firework is triggered.
// MouseY position: determines the length of the beam.
// The direction of the beam is varied randomly.
// The colors of the firework are randomly chosen from a palette.
// One firework beam gradually changes color from 'white' to the chosen color.
//

// Keys:
// '[' and ']': increase/decrease the 'fullness' of the fireworks.
// 's': saves the image. Every image gets a unique id.
// BACKSPACE: clears the background.

// The 'fireworks' are based on the 'Fractal Plants': http://answers.oreilly.com/topic/1261-create-fractal-plants-with-processing/
// The 'glow' is done by drawing a Radial Gradient background. The code is taken from Dan Gries, http://rectangleworld.com/blog/archives/996
// The cityscape image is taken from: http://all-free-download.com/free-vector/vector-landscape/city_skyline_landscape_silhouette_vector_set_267588.html 


// general declarations

PImage cityscape;
PGraphics backgroundImage; 

int BRANCHES = 4; //Number of branches per line
int DEPTH = 5; // Recursive depth
float MIN_ANGLE = 10.0; //Minimum angle for new branch
float MAX_ANGLE = 15.0; //Maximum angle for new branch
float MIN_LENGTH = 0.30; //Minimum length of new branch, as a pct of current length
float MAX_LENGTH = 0.8; //Maximum length of new branch, as a pct of current length

color[] palette = {#11A7FC, #95D127, #F2E415, #FF8638, #EE3551}; // the base colors for the fireworks
color[] fireworksColors; // contains the gradual colors for one firework beam

void setup() {
  size (800, 600);
  cityscape = loadImage("cityscape1.png");
  backgroundImage = createBackground();
  image(backgroundImage,0,0);

}

void draw() {
  // draw the cityscape again and again, so that it stays on top of the fireworks.
  image(cityscape, 0, height - cityscape.height); 
}


void keyPressed() { 
  switch(key) {
    case ']':
      // increase DEPTH
      constrain(DEPTH++, 3, 7);
      break;
    case '[':
      // decrease DEPTH
      constrain(DEPTH--, 3, 7);
      break;
    case BACKSPACE:
      // clear
      image(backgroundImage,0,0);
      break;
    case 's':
      // save image
      saveFrame("fireworks-####.png");
      break;  
  }

};

void mousePressed() {
  color color2 = color(255); // from white ...
  color color1 = palette[int(random(0, palette.length-1))]; // ... to a random color from the palette ...
  fireworksColors = getFireworksColors (color1, color2, DEPTH); // ... create the gradual colors.
  Vector seed = new Vector(mouseX, height, height - mouseY, 270 + random(-20, 20)); 
  firework (seed, DEPTH); // create the firework
};

color[] getFireworksColors (color c1, color c2, int steps) {
  
  int s = steps;
  if (s < 2) {
    s = 2;
  }
  
  color[] c = new color[s];
  
  float inc = 1.0/s;
  
  for (int i = 0; i < s; i++) {
     c[i] = lerpColor(c1, c2, i*inc);
  } 
  return c;
}

// Implements a Vector
class Vector {
 int x,y;
 float r, theta;

 
 Vector (int _x, int _y, float _r, float _theta) {
 x = _x; //Origin x
 y = _y; //Origin y
 r = _r; //Length
 theta = _theta; // Angle
 }
 
 int getEndPointX() { 
 return int(x + r*cos(theta/57.3));
 }
 
 int getEndPointY() {
 return int(y + r*sin(theta/57.3));
 }
 
}

//Recursive function that creates a fractal "plant" 
void firework (Vector v, int N) {
 if (N > 0) {
 int dir = 1; //control alternating direction of the branch
 stroke(fireworksColors[N-1]);
 line(v.x,v.y,v.getEndPointX(),v.getEndPointY()); //Draw the current vector
 for (int i = 0; i < BRANCHES; i++) { 
 //Create a random vector based on the current one
 Vector r = new Vector (v.x, v.y,v.r, v.theta); //New random vector that will branch off the current line
 r.r = random(v.r*MIN_LENGTH, v.r*MAX_LENGTH); //Select a random length
 r.x = r.getEndPointX(); //shift the x-origin
 r.y = r.getEndPointY(); //shift the y-origin
 r.theta += dir*random(MIN_ANGLE,MAX_ANGLE); // shift the angle a bit
 dir = dir * -1; //Alternate branch direction
 firework (r,N-1); //Recurse
 }
 }
}
 

PGraphics createBackground() {
  
  // this function creates a background for the sketch, with a radial gradient fill

  PGraphics bg = createGraphics(width,height); // create a new image for the background
  color color0 = color(255); // the first color for the radial gradient
  color color1 = color(0); // the second color for the radial gradient
  
  float gradCenterX = width/2; // x-position of the radial gradient
  float gradCenterY = height - cityscape.height/4; // y-position of the radial gradient
  float outerRad = 500; // the radius of the gradient
  
  // for producing the radial gradient a class 'RadialGradient' is used. 
  // the code is produced by Dan Gries, http://rectangleworld.com/blog/archives/996.
  
  RadialGradient grad1 = new RadialGradient(gradCenterX, gradCenterY, 0, gradCenterX, gradCenterY, outerRad);
  grad1.addColorStop(0, color0);  // add the first stop of the gradient
  grad1.addColorStop(1, color1);  // add the second stop of the gradient
  grad1.fillRect(bg, 0, 0, width, height,false); 
  return bg;
}

class RadialGradient {
  float x0;
  float x1;
  float y0;
  float y1;
  float rad0;
  float rad1;
  ArrayList<ColorStop> colorStops;

  RadialGradient(float _x0, float _y0, float _rad0, float _x1, float _y1, float _rad1) {
    x0 = _x0;
    y0 = _y0;
    x1 = _x1;
    y1 = _y1;
    rad0 = _rad0;
    rad1 = _rad1;
    colorStops = new ArrayList<ColorStop>();
  }

  void addColorStop(float ratio, int col) {
    if ((ratio < 0) || (ratio > 1)) {
      return;
    }
    ColorStop newStop = new ColorStop(ratio, col);

    if ((ratio >= 0) && (ratio <= 1)) {
      if (colorStops.size() == 0) {
        colorStops.add(newStop);
      }
      else {
        int i = 0;
        boolean found = false;
        int len = colorStops.size();
        //search for proper place to put stop in order.
        while ( (!found) && (i<len)) {
          found = (ratio <= colorStops.get(i).ratio);
          if (!found) {
            i++;
          }
        }
        //add stop - remove next one if duplicate ratio
        if (!found) {
          //place at end
          colorStops.add(newStop);
        }
        else {
          if (ratio == colorStops.get(i).ratio) {
            //replace
            colorStops.set(i, newStop);
          }
          else {
            //insert
            colorStops.add(i, newStop);
          }
        }
      }
    }
  }

  //createGradRect returns PGraphics object. In second version, you pass a PGraphics object which gets filled.

  //overloaded - version without PGraphics fills main display.
  void fillRect(float rectX0, float rectY0, int rectW, int rectH, boolean dither) {
    PGraphics gradRect = createGradRect(rectX0, rectY0, rectW, rectH, dither);
    image(gradRect, rectX0, rectY0);
  }

  void fillRect(PGraphics pg, float rectX0, float rectY0, int rectW, int rectH, boolean dither) {
    PGraphics gradRect = createGradRect(rectX0, rectY0, rectW, rectH, dither);
    pg.beginDraw();
    pg.image(gradRect, rectX0, rectY0);
    pg.endDraw();
  }

  PGraphics createGradRect(float rectX0, float rectY0, int rectW, int rectH, boolean dither) {
    PGraphics gradRect = createGraphics(rectW, rectH);

    if (colorStops.size() == 0) {
      return gradRect;
    }

    gradRect.loadPixels();

    int i;
    int len = rectW*rectH;

    float nearestValue;
    float quantError;
    float x;
    float y;
    float ratio;
    float red, green, blue;
    float r0, g0, b0, r1, g1, b1;
    int col0, col1;
    float ratio0, ratio1;
    float f;
    int stopNumber;
    boolean found;
    float q;

    ArrayList<Float> rBuffer = new ArrayList<Float>();
    ArrayList<Float> gBuffer = new ArrayList<Float>();
    ArrayList<Float> bBuffer = new ArrayList<Float>();

    float a, a2, b, c, discrim;
    float dx, dy;

    float xDiff = x1 - x0;
    float yDiff = y1 - y0;
    float rDiff = rad1 - rad0;
    a = rDiff*rDiff - xDiff*xDiff - yDiff*yDiff;
    a2 = 2*a;
    float rConst1 = 2*rad0*(rad1-rad0);
    float r0Square = rad0*rad0;

    float weightR = 7.0/16.0;
    float weightLD = 3.0/16.0;
    float weightD = 5.0/16.0;
    float weightRD = 1.0/16.0;

    int destX;
    int destY;

    //first complete color stops with 0 and 1 ratios if not already present
    if (colorStops.get(0).ratio != 0) {
      ColorStop newStop = new ColorStop(0, colorStops.get(0).col); 

      colorStops.add(0, newStop);
    }
    if (colorStops.get(colorStops.size()-1).ratio != 1) {
      ColorStop newStop = new ColorStop(1, colorStops.get(colorStops.size()-1).col);
      colorStops.add(newStop);
    }

    //create float valued gradient
    for (i = 0; i < len; i++) {

      x = rectX0 + (i % rectW);
      y = rectY0 + floor(((float) i)/((float) rectW));

      dx = x - x0;
      dy = y - y0;
      b = rConst1 + 2*(dx*xDiff + dy*yDiff);
      c = r0Square - dx*dx - dy*dy;
      discrim = b*b-4*a*c;

      if (discrim >= 0) {
        ratio = (-b + sqrt(discrim))/a2;

        if (ratio < 0) {
          ratio = 0;
        }
        else if (ratio > 1) {
          ratio = 1;
        }

        //find out what two stops this is between
        if (ratio == 1) {
          stopNumber = colorStops.size()-1;
        }
        else {
          stopNumber = 0;
          found = false;
          while (!found) {
            found = (ratio < colorStops.get(stopNumber).ratio);
            if (!found) {
              stopNumber++;
            }
          }
        }

        //calculate color.
        col0 = colorStops.get(stopNumber-1).col;
        r0 = (col0 >> 16) & 0xFF;
        g0 = (col0 >> 8) & 0xFF;
        b0 = (col0) & 0xFF;
        col1 = colorStops.get(stopNumber).col;
        r1 = (col1 >> 16) & 0xFF;
        g1 = (col1 >> 8) & 0xFF;
        b1 = (col1) & 0xFF;
        ratio0 = colorStops.get(stopNumber-1).ratio;
        ratio1 = colorStops.get(stopNumber).ratio;

        f = (ratio-ratio0)/(ratio1-ratio0);
        red = r0 + (r1 - r0)*f;
        green = g0 + (g1 - g0)*f;
        blue = b0 + (b1 - b0)*f;
      }
      else {
        col0 = colorStops.get(0).col;
        r0 = (col0 >> 16) & 0xFF;
        g0 = (col0 >> 8) & 0xFF;
        b0 = (col0) & 0xFF;
        red = r0;
        green = g0;
        blue = b0;
      }

      //set color as float values in buffer arrays
      rBuffer.add(red);
      gBuffer.add(green);
      bBuffer.add(blue);
    }

    //While converting floats to integer valued color values, apply Floyd-Steinberg dither.
    for (i = 0; i<len; i++) {
      if ((dither) && (i<len-rectW)&&(i % rectW != 0)&&(i % rectW != rectW-1)) {
        nearestValue = floor(rBuffer.get(i));
        quantError =rBuffer.get(i) - nearestValue;
        rBuffer.set(i+1, rBuffer.get(i+1) + weightR*quantError);
        rBuffer.set(i-1+rectW, rBuffer.get(i-1+rectW) + weightLD*quantError);
        rBuffer.set(i + rectW, rBuffer.get(i + rectW) + weightD*quantError);
        rBuffer.set(i+1 + rectW, rBuffer.get(i+1 + rectW) + weightRD*quantError);

        nearestValue = floor(gBuffer.get(i));
        quantError =gBuffer.get(i) - nearestValue;
        gBuffer.set(i+1, gBuffer.get(i+1) + weightR*quantError);
        gBuffer.set(i-1+rectW, gBuffer.get(i-1+rectW) + weightLD*quantError);
        gBuffer.set(i + rectW, gBuffer.get(i + rectW) + weightD*quantError);
        gBuffer.set(i+1 + rectW, gBuffer.get(i+1 + rectW) + weightRD*quantError);

        nearestValue = floor(bBuffer.get(i));
        quantError =bBuffer.get(i) - nearestValue;
        bBuffer.set(i+1, bBuffer.get(i+1) + weightR*quantError);
        bBuffer.set(i-1+rectW, bBuffer.get(i-1+rectW) + weightLD*quantError);
        bBuffer.set(i + rectW, bBuffer.get(i + rectW) + weightD*quantError);
        bBuffer.set(i+1 + rectW, bBuffer.get(i+1 + rectW) + weightRD*quantError);
      }
      gradRect.pixels[i] = 0xFF000000 | floor(rBuffer.get(i)) << 16 | floor(gBuffer.get(i)) << 8 | floor(bBuffer.get(i));
    }

    gradRect.updatePixels();

    return gradRect;
  }
}


class ColorStop {
  float ratio;
  int col;
  ColorStop(float _ratio, int _col) {
    ratio = _ratio;
    col = _col;
  }
}


