
//Story of the Eye
//Irene Su
//1 November 2011

//Concept: to watch the film in it's entirety, one must play with the egg

//For the video
import processing.video.*;
Movie myMovie;
Movie eggMovie;  // if you want to show additional movies, just make new Movie instances

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

void draw() {


  //calling up the movie
  image(myMovie, -50, 0);

  leftY = mouseY;
  rightY = mouseY;

  //from PVector reference
  location.add(velocity);

  //the "paddles"
  image(eye, 0, leftY, 50, 140);
  image(eye2, 590, rightY, 50, 140);

  //the "ball" egg  *****remember that from here, egg will be refered to as location.x and .y!*******
  image(egg, location.x, location.y, 80, 45);

  //boundaries so the "ball" egg goes back and forth between the paddles
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

  //boundaries top and bottom
  if (location.y>height-5 || location.y<5) {
    velocity.y=velocity.y*-1;
  }

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
                
