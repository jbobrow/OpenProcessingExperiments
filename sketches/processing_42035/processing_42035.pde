

//Constructor, this sets up our instance variables that are used throught the program.
float x=0;
float y=0;
float a=0;
float b=0;
float m=random(1, 2);
float n=random(1, 2);

//These are for our colours, made it easier for us to define what colour of fill we wanted vs position of our sprite.
int R=255;
int G=255;
int B=255;

//Set up method.
//Declares the size of our canvas
//Sets the background colour
//Also sets y to random, so our sprite starts in a different location everytime the program is executed.
void setup() {
  background(0);
  size (600, 600);
  y=random(height);
  colorMode(RGB);
  frameRate(70);
}


//This method Draws the red, green, blue and yellow lines around the screen
//Also calls other methods in turn.
void draw() {

  animate();
  constraints();
  
  strokeWeight(5);
  stroke(255, 0, 0);
  line(0, 0, width-1, 0);

  stroke(0, 255, 0);
  line(0, 0, 0, height-1);

  stroke(0, 0, 255);
  line(width-1, 0, width-1, height);

  stroke(255, 255, 0);
  line(0, height-1, width-1, height-1);
}

//This method was implemented to stop our sprite getting "Stuck".
//Gives the illusion of it passing from on side of the screen to the other.
//Does this by either resetting x or y.
void constraints() {
  if (x>=602) {
    x=0;
  }
  if (x<=-5) {
    x=600;
  }
  if (y>=600) {
    y=0;
  }
  if (y<=0) {
    y=600;
  }
}



//This method is the main part of our program.
//It overlays a very opaque sqaure over the whole image every draw cycle, giving the animation effect.
//Then it draws our variable square, which changes size depending on screen postion and fires off random circles inside it.
//The movement and direction is then descirbed by our two trigonometric functions
//Finally draws a small circle at the centre
void animate () {
  strokeWeight(.1);
  fill(0, 9);
  rect(width/2, height/2, width, height);


  stroke(R, G, B);
  rectMode(CENTER);
  rect(x, y, x, y);
  float r = random(5000);
  for (int d= 10; d<300; d+=r) {
    ellipse(x, y, d, d);
  }


  //These if statements change the sprites direction if it reaches the boundaries.
  //Also makes the sprite change colour at the screen edge.
  if (x>=width-10) {

    m=m*(-1);
    stroke(0, 0, 255);
    R=0;
    G=0;
    B=255;
  }

  if (x<=10) {

    m=m*(-1);
    stroke(0, 255, 0);
    R=0;
    B=0;
    G=255;
  }
  ;

  if (y>=height-10) {

    n=n*(-1);
    stroke(255, 255, 0);
    R=255;
    G=255;
    B=0;
    a+=3;
  }

  if (y<=10) {

    n=n*(-1);
    stroke(255, 0, 0);
    R=255;
    B=0;
    G=0;
    a+=3;
  }

  x+=m;
  y+=n;

  //This gives the sprite nice smooth angle changes, altering its heading.
  x+=cos(radians(a))*1.8;
  y+=sin(radians(a))*1.;

  a++;
  //Draws the circle in the middle, giving the illusion of the square and random circles following it.
  fill(255);
  ellipse(x, y, 10, 10);
}


