
//My Midterm, with functions

//Story of the Eye
//Irene Su
//Concept: to watch the film in it's entirety, one must play with the egg

//GLOBAL VARIABLES (STAYS THE SAME)

//For the video
import processing.video.*;
Movie myMovie;

//For the pong game
float leftY;
float rightY;

//setting the types of PVectors needed
PVector location;
PVector velocity;

//Images for the pong game
PImage eye;
PImage eye2;
PImage egg;

////////////////////////////////////////////////////////////////////////////

//SETUP (STAYS THE SAME)

void setup() {
  size(640, 480, P2D);
  smooth();
  noCursor();

  //play the video
  myMovie = new Movie(this, "processingeye.mov");
  myMovie.play();

  //PVector things for pong game
  location = new PVector (50, 100);
  velocity = new PVector (1, random (3, 5));

  //load in images fir pong game
  eye = loadImage ("eye.gif");
  eye2 = loadImage ("eye2.gif");
  egg = loadImage ("egg.gif");
}

////////////////////////////////////////////////////////////////////////////

void movieEvent(Movie m) {
  m.read();
}

////////////////////////////////////////////////////////////////////////////

//Here is the new part...

void draw() {
 
  //calling up the movie that is the background (not sure if this should be a function too?)
  image(myMovie, -50, 0);

  //creating and calling up functions with made up names, will define below
  displaypaddles ();
  displayball();
  moveball();
  bounceball();
  movie();
  makesomethingreturn();

} 

///////////////////////////////////////////////////////////////////////////

//new stuff

//a funtion to display paddles
void displaypaddles() {
  image(eye, 0, leftY, 50, 140);
  image(eye2, 590, rightY, 50, 140);
}

//a function to display ball (from here, ball will be refered to as location.x and location.y
void displayball() {
  image(egg, location.x, location.y, 80, 45);
}

//a function to move ball
void moveball() {
  leftY = mouseY;
  rightY = mouseY;

  //from PVector reference
  location.add(velocity);
}

//a function to bounce ball
void bounceball() {
  //back and forth
  if ((location.x > 540 &&
    location.y > rightY&&
    location.y < rightY + 100)

  ||(location.x < 35 &&
    location.y > leftY &&
    location.y < leftY + 100)

  ) {
    velocity.x=velocity.x*-1;
    velocity.y=velocity.y*-1;
  }

  //up and down
  if (location.y>height-5 || location.y<5) {
    velocity.y=velocity.y*-1;
  }
}

void makesomethingreturn() {
  if ((location.x > 640) || (location.x< 0) ) { 
    text("This was the period when Simone developed a mania for breaking eggs with her ass...", 50, 50);
    fill(0);
  }
}

//a function to start and stop the movie
void movie() {
    //if movie stops, background turns red until movie starts again
    if ((location.x>640) || (location.x<0)) {
      background (211, 11, 11);
    }

    //if the ball goes beyond the boundaries (that is, you don't hit it with the paddles) stop video
    if ((location.x > 640) || (location.x< 0) ) { 
      myMovie.stop();
    }
    //if the ball goes beyond the boundaries (that is, you don't hit it with the paddles) stop video
    if ((location.x > 640) || (location.x< 0) ) { 
      myMovie.play();
    }
}
                
                                
