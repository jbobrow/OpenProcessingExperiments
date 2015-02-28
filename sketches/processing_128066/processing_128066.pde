
/**
 This is an example of two dimensional noise.  
 
 This produces a grid of rectangles that are colored based on the underlying noise
 produced by the noise function. The number of tiles draw is controled by the current
 position of the mouse (mouseX specifically). Since there is a noLoop() in there,
 start this off by putting the mouse towards the right of the canvas and typing 'r'.
 There are further controls ('-' and '+') that will allow you to change the noise scale.
 Hit '-' a bunch of times and you will start to see the underlying pattern we are sampling
 from.
 
 An important point in this one is that we are using the (x,y) coordinate of the 
 rectangles as the 2D input to the noise() function. So, in essense, this is a 
 visualization of the noise space -- we are looking at what the noise space "looks" like.
 
 C. Andrews
 2014-01-13
 
 **/


float scale = 1.0;
void setup() {
  size(600, 600);
  noLoop();  
  noStroke();
}


void draw() {
  background(255);

  // This is just the same code we've used a few times now to draw grids  
  // we are just drawing rects with a random gray fill
  float numDivisions = mouseX/2 +1;
  float  w = width / numDivisions;
  float h = height / numDivisions;


  for (int j = 0; j < numDivisions; j++) {
    float y = h*j;

    for (int i = 0; i < numDivisions; i++) {
      float x = w*i;
      // noise() gives a value between 0 and 1, so we scale by 255  
      fill(noise(x*scale, y*scale)*255);
      rect(x, y, w+.5, h+.5);
    }
  }
}



/*
  I added some basic keyboard input.
 
 'r' redraws the screen
 '-' shrinks the scale we are sampling with by 10%
 '+' increases the scale we are sampling with by 10%
 */
void keyReleased() {
  println(key);
  switch(key) {
  case 'r':
    redraw();
    break;
  case '+':
    scale *= 1.1;
    redraw();
    break;
  case '-':
    scale *= .9;
    redraw();
    break;
  }

}



