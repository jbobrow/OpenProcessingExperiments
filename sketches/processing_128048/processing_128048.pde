
/**
 This sketch shows some of the basic forms that we can follow when generating 
 random numbers. 
 
 In the background, there is a pale version of a line that uses
 pure random values for the y coordinates, allowing them to range across the 
 entire height of the canvas. 
 
 In the foreground, the top line restricts the range of the random values to a thin
 region around the base line. The next line uses variance instead, where each y
 value is a random offset from the location of the last one. The third line uses
 Perlin noise to generate y values within a restricted range. Since Perlin noise
 has a smooth shape to it, the final line is smoother, but still stays tightly
 bound to the base line.
 
 All of the lines are drawn the same way. We start with an x,y value on the left of
 canvas. We generate a new y value, giving us a new point that uses this new y value
 and x plus our step size. We draw a line between these two points and then update 
 lastY to hang on to the last y value we drew. We repeat this until the line hits the 
 right side of the canvas.
 
 C. Andrews
 2014-01-13
 
 **/

float stepSize = 30; // the size of the steps between different x values

void setup() {
  size(600, 600);
  background(255);   
  noLoop(); // turn off looping
}

void draw() {

  // draw the full random line
  float lastY = height/2;
  float y = height/2;
  stroke(200); // brighten this so it fades into the background
  for (int x = 0; x <= width - stepSize; x += stepSize) {
    y = random(0, height);
    line(x, lastY, x+stepSize, y);
    lastY = y;
  }


  // update the base line for the second line
  int yBase = height/4;
  lastY = yBase;

  // draw the base line for the second line
  stroke(200);
  line(0, yBase, width, yBase);

  // draw the second line - y randomized within a fixed range  
  stroke(0);
  for (int x = 0; x <= width - stepSize; x += stepSize) {
    y = yBase + random(-50, 50);
    line(x, lastY, x+stepSize, y);
    lastY = y;
  }


  // update the base line for the third line
  yBase = height/2;
  lastY = yBase;
  // draw the base line for the third line
  stroke(200);
  line(0, yBase, width, yBase);

  // draw the third line - using randomized variance to find y as an offset of   
  // the previous y
  stroke(0);
  for (int x = 0; x <= width - stepSize; x += stepSize) {
    y = lastY + random(-20, 20);
    line(x, lastY, x+stepSize, y);
    lastY = y;
  }


  // update the base line for the fourth line
  yBase = 3*height/4;
  lastY = yBase + noise(0)* 100 - 50;
  // draw the base line for the fourth line
  stroke(200);
  line(0, yBase, width, yBase);

  // draw the fourth line - use noise to find a random location for y within a fixed range
  // note that this is the same -50 to 50 range used by the second line
  // also, the jaggedness of the line can be changed by adjusting the 0.004  
  stroke(0);
  for (int x = 0; x <= width - stepSize; x += stepSize) {
    y = yBase + noise(x*0.004)* 100 - 50;
    line(x, lastY, x+stepSize, y);
    lastY = y;
  }
}



