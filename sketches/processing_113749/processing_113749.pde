
//////////////////////////////////////////////////
// IDEA 9101 LAB 1 
// Assignment 1   : Animation of Process
// Lecturer       : Dr. Lian Loke & Ingrid Pohl
// Date           : 20/MAR/2013
// Submitted by Yoko Tomishima (ytom4097)
/////////////////////////////////////////////////

// Referenced
// James Hiscock, Tutorial 15: The Process Compendium (Part 1), from http://peepproject.com/tutorials/tutorial/25/view
// Image was taken from http://felt.co.nz/listing/116396/Sydney-Silhouette
////////////////////////////////////////////////
// Monsters came to Sydney



//declair image
PImage img;

// The maximum number of monsters to be drawn at one time
int max_monster = 50;
// The current number of monsters being drawn at this time (may be less than max_circles)
int num_monster = 0;

// An array to hold the x-coordinates of the monster
float[] circle_x;
// An array to hold the y-coordinates of the monster
float[] circle_y;
// An array to hold the radii of the monster
float[] circle_radius;
// An array to hold the heading of the monster
float[] circle_heading;
// An array to hold the speed of the monster
float[] circle_speed;

// A array to hold the colors for monster
color[] myColors = new color[4];
// A array for storing chosen color for monster
int[] circle_color = new int[max_monster];


//--------------------------------------------
// A "flag" to switch between debug display (circles) and presentation display (monster)
// If DEBUG = true then the display will be the debug display (circles)
// If DEBUG = false then the display will be the presentation display (lines)
boolean DEBUG = false;
//--------------------------------------------

// Set up the sketch window and declare all of the arrays
void setup() {
  // Create a display window of 800x600 pixels
  size(800, 600);
  // Clear the background to white (in case we're in presentation mode)
  background(255);
  //make new instance by loading sydney city sihoulette
  img = loadImage("sydney_black.png");
  // Draw everything nice and smooth (anti-aliased)
  smooth();
  //set color mode to RGB
  colorMode(RGB);
  // Allocate memory to store the data about the circles
  circle_x = new float[max_monster];
  circle_y = new float[max_monster];
  circle_radius = new float[max_monster];
  circle_heading = new float[max_monster];
  circle_speed = new float[max_monster];
  //Allocate memory to store color data for circles
  myColors[0] = color(87,209,252);//light blue
  myColors[1] = color(219,252,87);// light green
  myColors[2] = color(255,250,144);// yellow
  myColors[3] = color(217,224,224); // gray
}

// Respawn the circle with the given index in the arrays of circle data
void respawn(int i) {
  // Set the x-coordinate to the random position of the screen
  circle_x[i] = random(width);
  // Set the y-coordinate to the range of upper middle of the screen
  circle_y[i] = random(100,500);
  // Set the radius of the circle to a random value (in pixels)
  circle_radius[i] = random(1,50 );
  // Set the heading of the circle to a random direction (in degrees)
  circle_heading[i] = random(360);
  // Set the speed of the circle to a random amount (in pixels/frame)
  circle_speed[i] = random(0.2, 1.5);
  //set the color of the line to chosen color from myColors array
  circle_color[i] = floor(random(0,4));
}



// Update the circles, put all of the behaviours in here
void update() {
  // If there are less than the maximum number of monster...
  if (num_monster < max_monster) {
    // ...limiting to 60% of the time...
    if (random(100) < 60) {
      // ...add a new monster
      respawn(num_monster);
      // Update the count of the number of monster on screen
      num_monster++;
    }
  }

  for (int i = 0; i < num_monster; i++) {
    // If the monster has gone out of the bounds of the display...
    if ((circle_x[i] < -circle_radius[i]) ||
        (circle_y[i] < -circle_radius[i]) ||
        (circle_x[i] > width + circle_radius[i]) ||
        (circle_y[i] > height + circle_radius[i])) {
      // ...respawn the circle
      respawn(i);
    }

    // Check this circle against every other circle
    for (int j = 0; j < num_monster; j++) {
      // Don't check this circle against itself
      if (i != j) {
        // Calculate the distance between the two circles
        float distance_between_circles = dist(circle_x[i], circle_y[i], circle_x[j], circle_y[j]);
        // Calculate the sum of the radii of the two circles
        float sum_of_radii = circle_radius[i] + circle_radius[j];
        // If the two circles are touching (distance < sum of radii) ...
        if (distance_between_circles <= sum_of_radii) {
          // ...add a small random amount to the heading
          circle_heading[i] += random(-1, 2);
          //make line 
        }
      }
    }
    
    // Update the position of the circle based on its heading and speed
    circle_x[i] += circle_speed[i] * cos(radians(circle_heading[i]));
    circle_y[i] += circle_speed[i] * sin(radians(circle_heading[i]));
  }
}

//Make background animation 
void background_anim(){
  //set value to size of circles
  float s = random(10,100);
  //set value of x & y cordinate
  float x = random(width);
  float y = random(height);
  //set color value to each rgb
  float r = 255;
  float g = random(256);
  float b = random(256);
  //eliminate stroke
  noStroke();
  //assign RGB color value
  fill(r,g,b);
  //draw circles on random position with random range of size between 10-100 
  ellipse(x,y,s,s);
  //30% of chance add white circle for decoration
  if (random(100) < 30) {
     fill(255);
     ellipse(random(width),random(height),10,10);
    }
}



void draw() {
  // Call the update function to update the positions of the monster
  update();
  // Call background_anim function
  background_anim();
  // If we want to show the debug display...
  if (DEBUG) {
    // Clear the background
    background(255);
    // Don't fill the circles
    noFill();
    // Draw using white lines
    stroke(0);
    // Draw ellipse with centre (x, y) and radius
    ellipseMode(RADIUS);
    // For every monster currently being displayed...
    for (int i = 0; i < num_monster; i++) {
      // Draw the monster using the arrays of circle data
      ellipse(circle_x[i], circle_y[i], circle_radius[i], circle_radius[i]);
      // Calculate the x-coordinate of the end of the radius in the direction of the heading
      float radius_x = circle_x[i] + circle_radius[i] * cos(radians(circle_heading[i]));
      // Calculate the y-coordinate of the end of the radius in the direction of the heading
      float radius_y = circle_y[i] + circle_radius[i] * sin(radians(circle_heading[i]));
      // Draw a line in the direction of the heading for the circle using the radius coordinates
      line(circle_x[i], circle_y[i], radius_x, radius_y);
    }
  } else { // Otherwise show the presentation display...

    // For every monster currently being displayed...
    for (int i = 0; i < num_monster; i++) {
      // Check against the other monster...
      for (int j = i+1; j < num_monster; j++) {
        // Calculate the distance between the two monsters
        float distance_between_circles = dist(circle_x[i], circle_y[i], circle_x[j], circle_y[j]);
        // Calculate the sum of the radii of the two circles
        float sum_of_radii = circle_radius[i] + circle_radius[j];
        // If the circles are touching (distance < sum of radii)...
        if (distance_between_circles <= sum_of_radii) {
          // ...use the map function to calculate a greyscale value to draw a ellipse around monster
          float greyscale = map(distance_between_circles, 0, sum_of_radii, 255, 0);
          // eliminate stroke
          noStroke();
          // Set the color of the ellipse with a very low opacity
          fill(greyscale,1);
          // draw ellipse around monster
          ellipse(circle_x[i],circle_y[i],greyscale,greyscale);
          // Draw monsters, color is chosen from array
          fill(myColors[circle_color[i]],100);
          // Draw monster shape by ellipse
          ellipse(circle_x[i], circle_y[i], 50, 50);
          // Draw monster's left eye 
          fill(255);
          ellipse(circle_x[i]-7,circle_y[i],20,20);
          // Draw monster's right eye
          ellipse(circle_x[i]+7,circle_y[i],20,20);
          // Draw monster's left iris
          fill(0);
          ellipse(circle_x[i]-7,circle_y[i],10,10);
          // Draw monster's right iris
          ellipse(circle_x[i]+7,circle_y[i],10,10);
          // Draw monster's left shine? in eye
          fill(255);
          ellipse(circle_x[i]-9,circle_y[i]-3,3,3);
          // Draw monster's right shine? in eye
          ellipse(circle_x[i]+6,circle_y[i]-3,3,3);
        }
      }
    }
  }
  // Display Sydney city sihoulette image
  image(img,0,420);
}


