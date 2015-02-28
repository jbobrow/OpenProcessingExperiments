
PImage ref; //A PImage to store our reference image

void setup() {
  size(640, 480);
  smooth();
  background(255); //just to get some initial white on the screen

  ref = loadImage("m.jpg");
  //loadImage() works with url's too!
  //ref = loadImage("http://mkontopoulos.com/temp/m.jpg");
}

void draw() {  
  fill(255, 3);
  noStroke();
  rect(0, 0, width, height);  

  /* Oops, we need to "cast" xpos and ypos to 
   integers if we're gonna use them in get() on the next line */
  int xpos = int( random( width )); 
  int ypos = int( random( height)); 

  //Grab the pixel color at (xpos,ypos) on the reference image
  color temp = ref.get(xpos, ypos);

  //Check the blue color channel to determine if it's mostly black or white...
  if ( blue(temp)  < 100 ) //100 is an arbitrary threshold between 0-255
  {
    fill(0, 200);
    float s = random(5, 30);
    ellipse(xpos, ypos, s, s);
  }
}


