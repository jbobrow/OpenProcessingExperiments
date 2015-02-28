
// how long is a piece of string?

// import fullscreen library
//import fullscreen.*;
// instantiate variables
float x,y,a,i, b, u, v, p;
PImage img;
 
void setup() {
  img = loadImage("photo-10.JPG"); // load image to collect colours from
  size(900,600); // set screen size
  //FullScreen fs = new FullScreen(this); // create fullscreen object
  background(0); // set background colour to black
  strokeWeight(0.3); // make strokeweight thin (so it doesn't black out the fill, but still gives the shading effect)
  smooth(); // turn on antialiasing
  a=-PI/2; // set initial angle for drawing spiral
  p=-PI/2; // set initial angle for wandering round the image
  
  // start spiral in the centre of the screen
  x= width / 2; 
  y = height / 2;
  // start wandering round image at random point
  u=random(img.width);  
  v=random(img.height);
  // enter fullscreen mode
  //fs.enter();
}

void draw() {
  i=random(-.001,.001); // increment to change angle
  for(int j=1;j<100;j++) { // stick with the increment for a while, increase the length of the loop to make spirals 
    // turn the flat screen into a torus
    x = (width + x + cos(a)) % width;
    y = (height + y + sin(a)) % height;
    // set the fill colour from the current cursor position over the image
    fill(img.get(int(u), int(v)));
    // draw a circle to the screen
    ellipse(x,y,5,5);
    // increment the angle of used to determine next position, depending on depth of loop
    a+=j*i;
     
    // same as process above, but these coordinates are just wandering around the loaded image. 
    p=random(-.001,.001);
    u = (img.width + u + cos(b)) % img.width;
    v = (img.height + v + sin(b)) % img.height;
    b+=j*p;
  }
}
void mouseClicked() {
  setup();
  //saveFrame();
}


