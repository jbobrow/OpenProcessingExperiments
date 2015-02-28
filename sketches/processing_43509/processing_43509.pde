
PImage img; //initialize the image
int num = 10; //sets up number of walkers
Walker [] Walkers = new Walker[num]; //array the walker object

void setup() {
  size(300, 300);
  img = loadImage("maze.gif"); //load the image
  background(img); //set the image as static background
  img.loadPixels(); //loding pixels from image

  for (int i=0;i<num;i++) { //this is a loop that pixel color and control trajectory
    float x = random(width);
    float y = random(height);
    if (img.get(int(x), int(y)) == color(0, 0, 0)) { //if walker hits a black pixel, move in a negtive trajectory
      i--;
    }
    else {
      Walkers[i] = new Walker(x, y); //if the walker doesn't hit black, it goes off the sketch and starts a new walker in another random location
    }
  }
}

void draw() {
  for (int i=0; i<num; i++) { //returns the size of the array
    Walkers[i].walk(); //calling methods to the object; the walker walks
    Walkers[i].trail(); //calling methods to the object; the walker leave
  }
}

//to use the variables in the program, the variables have to pass from the constructor to the object
class Walker { //setting up the class; template for the object
  float x; //this is an object variable
  float y; //this is an object variable
  float xv = random(1); //x velocity; speed of the walker in the x direction
  float yv = random(1); //y velocity; speed of the walker in the y direction

  Walker(float x_, float y_) { //object constructor; x and y are local variables
    x=x_; //pass the local variable to the object
    y=y_; //pass the local variable to the object
  }

  void walk() { //this is a method of the object, the walker
    x+=xv;
    y+=yv;

    if (x>width) x = 0; //keeping the walker in the sketch
    if (x<0) x = width;
    if (y>height) y = 0;
    if (y<0) y = height;

    if (img.get(int(x), int(y)) != color(255, 255, 255)) { //if walker is on a white pixel
      if (random(2)>1) { //only happen 1/2 the time; flip a coin, basically, and bounce back in a slightly different trajectory than the original path
        yv = -yv; //move on y axis in opposite direction
      }
      else {
        xv = -xv; //move on x axis in opposite direction
      }
    }
  }

  void trail() { //this is a method of the object, the walker
    stroke(255, 0, 0);
    point(x, y);
  }
}


