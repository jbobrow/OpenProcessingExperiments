
/* Code was derived from ImgWalker (by Nick Senske) and Project_2 Butterfly (by Alexander Suryandono, 
Dian Luo and Yashika Gulati.
/*The concept behind this composition was to represent the "drop" so often used in electronic and
dubstep music. In order to do this we decided to represent the build up of the bass that comes before
the drop by literally building up the BASS with a successive layering of a spread of points. As more
and more points are drawn, the BASS becomes more and more dominant and defined.
Following this, in order to convey the idea of the DROP, we introduced a visual "timer" that acts
as the countdown to the drop. Once the "timer" crosses the composition, the BASS is DROPped, which
we represented through the exposing of the DROP, our second image.

Since this project is so heavily based on music, specifically Electronica and Dubstep, 
it can best be understood when familiar with this kind of music.  
For reference, this sketch could potentially be synced with songs by artists such as
Bassnectar, Skrillex, Nero, and DeadMau5 just to name a few. */



PImage img; 
PImage img2; 
float j = 0; // variable used for "timer"
int num = 50; // number of points comprising the array
Pt [] Pts = new Pt [num]; // setting up the array


void setup() {
  size(500, 400);
  img = loadImage("BASS noDROP.jpg"); // loading first image 
  img2 = loadImage("BASS yesDROP.jpg"); // loading second image
  background(255);
  img.loadPixels(); // fetching pixel data for first image
  img2. loadPixels(); // fetching pixel data for second image

  for (int i=0;i<num;i++) { 
    float x = random(width); // spreads the set of 50 points randomly across canvas width
    float y = random(5, 2); // contained randomness in order to obtain effect of vertical 
                            // progression from the bottom of canvas


    Pts[i] = new Pt(x, y); // seeding the array
  }
}


void draw() {
  for (int i=0; i<num; i++) {
    Pts[i].walk(); // placing the method inside void draw so it is "drawn"
  } 
  for (float j = 0; j < width; j += 30); // setting up variable for the "timer" element
  fill(255, 0, 0);
  noStroke();
  ellipse(j, 200, 10, 10); // horizontal progression of red ellipses across composition 
  j += 0.2  ; // progression of ellipses is decreased so to allow enough time for the image to be
              // sufficiently defined in order to be readable - this is the setting for the "timer"

  if ( j > 490) { // j = 490 is the zero point for the timer...
    background(img2); // ...and the BASS is DROPped 
  }
}

class Pt { // nomanclature for the class - contains everything related to the class
  float x; // following 4 lines are the varibales
  float y;

  float xv = 2.5; // defines the progreession of the points following one another
  float yv = 2.5;

  Pt(float x_, float y_) { // setting the constructor contianing the variables that will be used
    x=x_; // passing the local variables to the object so that they can be accessed 
    y=y_;
  }

  void walk() { // method that establishes the rules to the progression of the points of the class
    x+=xv;
    y-=yv; // sets the progression along the y-axis of the points to negative in order to mimick
           // the formal aspect of sound bar equalizers 
     
    if (y < 0) y = height; // enables the points to "reset" at the bottom of the composition after
                           // they push off the top of the composition

    if (img.get(int(x), int(y)) != color(255)) { // scanning image for "not white"
      // following set of commands are applicable only where there aren't any white 
      // pixels on the first image 
      //y = y; // sets progression of points on a 45 degree diagonal line. This enables the set of 
      // 50 points  
      strokeWeight(3); // thicker lineweight makes image visualisation more prominent
      stroke(255); // draws the points white - opposite/inverse of most prominent color
      point(x, y); 
    }

    else {
      xv = -xv; 
      strokeWeight(1.5);
      stroke(0);
      point(random(width), y);
    }
  }
}


