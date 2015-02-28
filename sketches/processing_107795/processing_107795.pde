
/******************************************************************
   Interaction Designer: Jason Barles
   Modified code described by Casey Reas in his Process Compendium
   
   This code has altered a few things;
   * behaviour - only respawns less 10% of the time, instead of 80%
   * colour - red, green, blue, or greyscale rather than just 
              greyscale
   * draw - drawing points with random weights, rather than a line
   * respawn - respawn at the bottom-middle of the screen, rather
               than in the centre
               
   All altered code has Jason Barles in the comment
******************************************************************/
// The maximum number of circles to be drawn at one time
int max_circles = 300;
// The current number of circles being drawn at this time (may be less than max_circles)
int num_circles = 0;

// An array to hold the x-coordinates of the circles
float[] circle_x;
// An array to hold the y-coordinates of the circles
float[] circle_y;
// An array to hold the radii of the circles
float[] circle_radius;
// An array to hold the heading of the circles
float[] circle_heading;
// An array to hold the speed of the circles
float[] circle_speed;

int red = 0;
int green = 0;
int blue = 0;

// A "flag" to switch between debug display (circles) and presentation display (lines)
// If DEBUG = true then the display will be the debug display (circles)
// If DEBUG = false then the display will be the presentation display (lines)
boolean DEBUG = false;

// Set up the sketch window and declare all of the arrays
void setup() {
  /* Create a display window of 800x600 pixels
   Originally 600x600 altered by Jason Barles */
  size(800, 600);
  // Clear the background to black (in case we're in presentation mode)
  background(0);
  // Draw everything nice and smooth (anti-aliased)
  smooth();
  // Allocate memory to store the data about the circles
  circle_x = new float[max_circles];
  circle_y = new float[max_circles];
  circle_radius = new float[max_circles];
  circle_heading = new float[max_circles];
  circle_speed = new float[max_circles];
}

// Respawn the circle with the given index in the arrays of circle data
void respawn(int i) {
  // Set the x-coordinate to the middle of the screen
  circle_x[i] = width/2;
  // Set the y-coordinate to the middle of the screen
  /* Original code: circle_y[i] = height/2;
     Altered by Jason Barles */
  circle_y[i] = height;
  // Set the radius of the circle to a random value (in pixels)
  circle_radius[i] = random(5, 15);
  // Set the heading of the circle to a random direction (in degrees)
  //circle_heading[i] = random(360);
  circle_heading[i] = random(180,360); // since heading can only be between these degrees. Altered by Jason Barles
  // Set the speed of the circle to a random amount (in pixels/frame)
  circle_speed[i] = random(0.2, 0.8);
}

// Update the circles, put all of the behaviours in here
void update() {
  // If there are less than the maximum number of circles...
  if (num_circles < max_circles) {
    /* ...limiting to 10% of the time...
       originally 80% altered by Jason Barles */
    if (random(100) < 10) {
      // ...add a new circle
      respawn(num_circles);
      // Update the count of the number of circles on screen
      num_circles++;
    }
  }

  for (int i = 0; i < num_circles; i++) {
    // If the circle has gone out of the bounds of the display...
    if ((circle_x[i] < -circle_radius[i]) ||
        (circle_y[i] < -circle_radius[i]) ||
        (circle_x[i] > width + circle_radius[i]) ||
        (circle_y[i] > height + circle_radius[i])) {
      // ...respawn the circle
      respawn(i);
    }

    // Check this circle against every other circle
    for (int j = 0; j < num_circles; j++) {
      // Don't check this circle against itself
      if (i != j) {
        // Calculate the distance between the two circles
        float distance_between_circles = dist(circle_x[i], circle_y[i], circle_x[j], circle_y[j]);
        // Calculate the sum of the radii of the two circles
        float sum_of_radii = circle_radius[i] + circle_radius[j];
        // If the two circles are touching (distance < sum of radii) ...
        if (distance_between_circles <= sum_of_radii) {
          // ...add a small random amount to the heading
          circle_heading[i] += random(-1, 1);
        }
      }
    }
    
    // Update the position of the circle based on its heading and speed
    circle_x[i] += circle_speed[i] * cos(radians(circle_heading[i]));
    circle_y[i] += circle_speed[i] * sin(radians(circle_heading[i]));
  }
}

void draw() {
  // Call the update function to update the positions of the circles
  update();

  // If we want to show the debug display...
  if (DEBUG) {
    // Clear the background
    background(0);
    // Don't fill the circles
    noFill();
    // Draw using white lines
    stroke(255);
    // Draw ellipse with centre (x, y) and radius
    ellipseMode(RADIUS);
    // For every circle currently being displayed...
    for (int i = 0; i < num_circles; i++) {
      // Draw the circle using the arrays of circle data
      ellipse(circle_x[i], circle_y[i], circle_radius[i], circle_radius[i]);
      // Calculate the x-coordinate of the end of the radius in the direction of the heading
      float radius_x = circle_x[i] + circle_radius[i] * cos(radians(circle_heading[i]));
      // Calculate the y-coordinate of the end of the radius in the direction of the heading
      float radius_y = circle_y[i] + circle_radius[i] * sin(radians(circle_heading[i]));
      // Draw a line in the direction of the heading for the circle using the radius coordinates
      line(circle_x[i], circle_y[i], radius_x, radius_y);
    }
  } else { // Otherwise show the presentation display...
    // For every circle currently being displayed...
    for (int i = 0; i < num_circles; i++) {
      // Check against the other circles...
      for (int j = i+1; j < num_circles; j++) {
        // Calculate the distance between the two circles
        float distance_between_circles = dist(circle_x[i], circle_y[i], circle_x[j], circle_y[j]);
        // Calculate the sum of the radii of the two circles
        float sum_of_radii = circle_radius[i] + circle_radius[j];
        // If the circles are touching (distance < sum of radii)...
        if (distance_between_circles <= sum_of_radii) {
          // ...use the map function to calculate a greyscale value to draw a line
          float greyscale = map(distance_between_circles, 0, sum_of_radii, 255, 0);
          
          // Set the color of the line with a low opacity
          /* Original code was: stroke(greyscale, 32);
             Added colour to the strokes by Jason Barles */
         
          // colours are added either a red, green, or blue strength
          if(i%100==0){
            red+=5; 
            blue=0;
            green=0;            
          }
          else if(i%80==0){
            green+=5;
            red=0;
            blue=0;
          }
          else if(i%60==0){
            blue+=5;
            green=0;
            red=0;            
          }
          // reset the colours 
          if(red >= 255)
            red=0;
          else if(green >= 255)
            green=0;
          else if(blue >= 255)
            blue=0;
          
          // Noticed that once the value of num_circles > 200
          // then the strokes were too similar in colour. So instead  
          // add the greyscale stroke until the colour values get reset. Jason Barles
          if(i<200)  
            stroke(25+red,25+green,25+blue,greyscale);
          else
            stroke(greyscale,32);
          
          
          // Original code: line(circle_x[i], circle_y[i], circle_x[j], circle_y[j]);
          // Altered by Jason Barles to draw points instead with random weights
          strokeWeight(random(1,2));  
          point(circle_x[i], circle_y[i]);
          point(circle_x[j], circle_y[j]);
        }
      }
    }
  }
}


