
//Ayako Matsuda
//DESMA 28 Interactivity Workshop 5

class Fish
{
  float x;
  float y;
  float speed;
  float directionX; // current velocity of the fish
  float directionY; // current velocity of the fish
  float angle; // current angle of direction of the fish
  float omega; // current angular velocity
  float heading; // fish heading correction
  int counter;
  PShape img;

  // Constructor
  Fish(float px, float py, float pangle, float pomega, float pheading, String imgfile)
  {
    x = px;
    y = py;
    speed = random (0.5, 2);
    directionX = 0;
    directionY = 0;
    angle = pangle;
    omega = pomega;
    heading = pheading;
    counter = 0;
    img = loadShape(imgfile);
  }

  void process()
  {
    // Turn
    angle += omega;

    // Calculate new x
    directionX = speed*cos(angle);
    if ((x + directionX > width+50) || (x + directionX < -50))
    {
      directionX= -directionX; //Change direction
      angle = atan2 (directionY, directionX);
    }
    x += directionX; 

    // Calculate new y
    directionY = speed*sin(angle);
    if ((y + directionY > height+50) || (y + directionY < -50))
    {
      directionY= -directionY; //Change direction
      angle = atan2 (directionY, directionX);
    }
    y += directionY;

    // Change rate of turning if necessary
    counter += 1;
    if (counter >= 60)
    {
      counter = 0;
      speed = random (0.5, 1.5);
      omega = random (radians(-1.5), radians (1.5));
    }

    // Turn and draw the image
    pushMatrix();
    translate(x, y);
    rotate(heading); // correct the heading of the fish
    rotate(angle); // rotate so fish is facing forward
    shape(img, 0, 0, 100, 100);
    popMatrix();
  }
}

// Declare Fish objects
Fish goldfish1;
Fish goldfish2;
Fish goldfish3;
Fish demekin1;
Fish demekin2;
Fish demekin3;
Fish kingyo1;
Fish kingyo2;
Fish kingyo3;
Fish masaki1;
Fish masaki2;
Fish masaki3;
Fish masaki4;
Fish masaki5;
Fish masaki6;
Fish masaki7;
Fish masaki8;
Fish masaki9;


float colorchange = 0;

void setup ()
{
  background (255);
  size (600, 400);
  smooth();
  noStroke ();
  shapeMode(CENTER);
  
  goldfish1 = new Fish (random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  7*PI/10, 
  "goldfish.svg");
  
  goldfish2 = new Fish (random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  7*PI/10, 
  "goldfish.svg");
  
  goldfish3 = new Fish (random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  7*PI/10, 
  "goldfish.svg");

  demekin1 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "demekin.svg");
  
  demekin2 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "demekin.svg");
  
  demekin3 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "demekin.svg");
  
  kingyo1 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  14*PI/20, 
  "2colorkingyo.svg");
  
  kingyo2 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  14*PI/20, 
  "2colorkingyo.svg");
  
  kingyo3 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  14*PI/20, 
  "2colorkingyo.svg");
  
  masaki1 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "1masaki.svg");
  
  masaki2 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "1masaki.svg");
  
  masaki3 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "1masaki.svg");
  
  masaki4 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "1masaki.svg");
  
  masaki5 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "1masaki.svg");
  
  masaki6 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "1masaki.svg");
  
  masaki7 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "1masaki.svg");
  
   masaki8 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "1masaki.svg");
  
   masaki9 = new Fish(random (10, 590), 
  random (10, 390), 
  random (radians(-180), radians (180)), 
  random (radians(-1.5), radians (1.5)), 
  3*PI/4, 
  "1masaki.svg");
}




