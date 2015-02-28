
//PROJECT TWO: Anne Schneider, Lindsay Shelton, Mikale Kwiatkowski
//Code adapted from Nick Senske's "imgWalker" code, Mikale Kwiatkowski's homework 6.2 code and Lindsay's "growing tree" code


PImage img; //initialize the image
int num = 50; //sets up number of scanners
Scanner [] Scanners = new Scanner[num]; //array the scanner object


//-------------------------------------------------------------------------------------------------------------------------------
void setup() {
  size(500, 500);
  background(255);
  smooth();
  img = loadImage("LOVE.gif"); //load the image
  img.loadPixels(); //loding pixels from image

  for (int i=0; i<num; i++) { //this is a loop that controls the line trajectory
    float x = random(width);
    float y = random(height);
    if (img.get(int(x), int(y)) == color(0)) { //if scanner hits a black pixel, it stops
      i--;
    }
    else {
      Scanners[i] = new Scanner(x, y); //if the scanner doesn't hit black, it goes off the sketch and starts a new scanner in another random location
    }
  }
}


//-------------------------------------------------------------------------------------------------------------------------------
void draw() {
  for (int i=0; i<num; i++) { //returns the size of the array
    Scanners[i].scan(); //calling methods to the object; the scanner scans
    Scanners[i].trail(); //calling methods to the object; the scanner leaves a trail behind itself
  }
}


//-------------------------------------------------------------------------------------------------------------------------------
//to use the variables in the program, the variables have to pass from the constructor to the object
class Scanner { //setting up the class; template for the object
  float x; //this is an object variable
  float y; //this is an object variable
  float xv = random(2); //x velocity; speed of the scanner in the x direction
  float yv = random(2); //y velocity; speed of the scanner in the y direction

  Scanner(float x_, float y_) { //object constructor; x and y are local variables
    x=x_; //pass the local variable to the object
    y=y_; //pass the local variable to the object
  }

  void scan() { //this is a method of the object, the scanner
    x+=xv;
    y+=yv;
    //each one would need a velocity and acceleration and can no longer be random
    x = x + random(-2, 2); //these next two lines makes the scanning line wander instead of being a straight line
    y = y + random(-2, 2);

    if (x>width) x = 0; //keeping the scanner in the sketch
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(255)) { //if scanner is on a white pixel
      if (random(2)>1) { //only happen 1/2 the time; flip a coin, basically, and bounce back in a slightly different trajectory than the original path       
        yv = -yv; //move on y axis in opposite direction
      }
      else {
        xv = -xv; //move on x axis in opposite direction
      }
    }
  }


  void trail() { //this is a method of the object, the scanner
    for (int c1=10; c1<height; c1+=30) {
      if (img.get(int(x), int(y)) != color(0)) { //if scanner is on a white pixel; add a true statement instead of else

        stroke(14, c1, 133, 50);
        strokeWeight(1);
        point(x, y);

        if ((frameCount>2000) &&(frameCount<3000)) { //saying if framecount is between 2000 and 3000 make it a purple color
          stroke(199, 95, 222, 50);
          point(x, y);
        }
        if ((frameCount>3000)&&(frameCount<4000)) { //if framecount is between 3000 and 4000 make the scanner pink
          stroke(255, 0, 250, 50);
          point(x, y);
          //so this seems a little too "hard coded" i feel like there is a simpler way to do this butttttt it's working
        }
      }
    }
  }
}


