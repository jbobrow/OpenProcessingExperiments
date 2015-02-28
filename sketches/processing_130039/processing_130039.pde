
/**
 This is a collection of examples of simple recursive 
 functions that draw circles. There are four functions to swap out
 here, each with increasing complexity.
 
 C. Andrews
 2014-01-23
 **/

void setup() {
  size(600, 600);
  noLoop();
}

/**
 To try out the various functions, just swap out the function call in here.
 **/
void draw() {
  background(255);
  drawCircle4(width/2, height/2, width);
}


/**
 This is the simplest recursive example. It just draws nested
 circles. We could easily do this with a loop, but we are
 doing it here by calling the same drawing function over again with
 new arguments.
 
 Note that it is very important that recursive functions have an end
 (in this case, when the radius reaches 2), and that the recursive call
 "makes progress" towards that (i.e., progressive calls to the fucntion
 get closer to the end point)
 **/
void drawCircle(int x, int y, float radius) {
  ellipse(x, y, radius*2, radius*2);
  if (radius > 2) {
    radius *= 0.75;
    drawCircle(x, y, radius);
  }
}

/**
 We replace the nested circles with a pair of circles that are half the size
 of the original.
 **/
void drawCircle2(int x, int y, int radius) {
  noFill();
  ellipse(x, y, radius*2, radius*2);
  if (radius > 2) {
    drawCircle2(x-radius/2, y, radius/2);
    drawCircle2(x+radius/2, y, radius/2);
  }
}

/**
 Now we are getting some interesting patterns. We add two more circles,
 so that for every circle that we draw, we repeat the pattern four more
 times inside of it.
 **/
void drawCircle3(int x, int y, int radius) {
  noFill();
  ellipse(x, y, radius*2, radius*2);
  if (radius > 16) {
    drawCircle3(x-radius/2, y, radius/2);
    drawCircle3(x+radius/2, y, radius/2); 
    drawCircle3(x, y-radius/2, radius/2);
    drawCircle3(x, y+radius/2, radius/2);
  }
}

/**
 This is the same thign with just a splash of color.
 **/
void drawCircle4(int x, int y, int radius) {
  if (radius %4 == 0) {
    fill(0, 255, 0, 40);
  }
  else {
    fill(0, 0, 255, 20);
  }
  ellipse(x, y, radius*2, radius*2);
  if (radius > 16) {
    drawCircle4(x-radius/2, y, radius/2);
    drawCircle4(x+radius/2, y, radius/2); 
    drawCircle4(x, y-radius/2, radius/2);
    drawCircle4(x, y+radius/2, radius/2);
  }
}



