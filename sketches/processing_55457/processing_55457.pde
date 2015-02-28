
float rad = 25;      // this variable determine how far the line will move
PImage a;
float x, y;          // to store the current location of x position and y position
float prevX, prevY;  // to store the previous location of x and y

//float[] lPath = new float[6];

/*import processing.video.*;

MovieMaker mm;  // Declare MovieMaker object*/

void setup() {
  size(400, 390);
  smooth();
  a = loadImage("land_letter_D400390.jpg");
  frameRate(40);

  // initialize the x and y position
  x = width/2;
  y = height/2;
  prevX = x;
  prevY = y;

  // to draw the first point
  stroke(255);
  strokeWeight(2);
  point(x, y);
  
 /* mm = new MovieMaker(this, width, height, "D_word.mov",
                       30, MovieMaker.ANIMATION, MovieMaker.LOSSLESS);*/
}

void draw() {
  // fading background effect
  fill(0, 2);
  



  for (int i=0; i<6; i++) {
    float angle = random(TWO_PI); //(TWO_PI/12)*i;
    x += cos(angle)*rad;
    y += sin(angle)*rad;


    if (blue(a.get(int(x), int(y))) < 25)  //black enough of a pixel

      // a function to caculate the moment and contain it inside the canvas

    {
      bounce();

      stroke(0);
      strokeWeight(0.1);
      line(x, y, prevX, prevY);

      strokeWeight(3);
      point(x, y);

      // update prevX and prevY with the new values
      prevX = x;
      prevY = y;
    }
  }
}

void bounce() {
  if (x<0 || x>width) {
    x = prevX;
    y = prevY;
  }
  if (y<0 || y>height) {
    x = prevX;
    y = prevY;
  }
 /* mm.addFrame();  // Add window's pixels to movie
 }

void keyPressed() {
  if (key == ' ') {
    mm.finish();  // Finish the movie if space bar is pressed!
  }
}
*/
}


