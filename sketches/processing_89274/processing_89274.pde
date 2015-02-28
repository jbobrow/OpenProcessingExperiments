
/*
 *  Title: P08_02_Images
 *  By:    Barton Poulson (artbybart.org)
 *  Date:  13 February 2013
 *
 *  Assignment: 
 *    Create a sketch that uses an image such as a jpeg or png file.
 */


PImage martha; 

int wide = 800;
int high = 600;

float x = wide - 200;
float y = high - 200;
boolean toggle = false;
float angle = 0;

void setup() {
//  size(wide, high);  // I can use variables in the desktop by not Javascript
  size(800, 600);
  martha = loadImage("Martha.png");
}

void draw() {
  background(0);
  
  fill(180);
  text("Martha Graham in \"Letter to the World (Kick),\" 1940", 10, 20);
  text("Press any key to start/stop", 10, 40);

  imageMode(CENTER);
  translate(x, y);
  rotate(angle);
  image(martha, 0, 0);
  if (toggle) {
    x--;                           // Moves across screen
    if (x < -180) x = wide + 180;  // Comes back through stage left
    angle -= .015;                 // Rolls
  }
}

void keyPressed() {
  toggle = !toggle;
}


