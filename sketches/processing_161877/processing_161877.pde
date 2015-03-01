
/* The artistic intent was exploratory. I started with an idea to draw some stars that I was unable to implement
 * for the first assignment and to move those stars and observe the 'star trails'. I also played with transparency
 * and different colour palettes. Early implementations were comintaed by straight trails so I added some
 * randomness to the motion by making stars either attracted or replelled by the other stars with the state 
 * (attracting or repelling) swaping from time to time.
 *
 * The sketch implements code blocks in the 'for' loops. The star attributes are held in arrays and an array holds a
 * a colour palette. There are a number of colour palettes commented out that I used before settling on the 
 * 'uncommented' palette. Variables have been used for a number of values.
 */

// Global veariables
float[] starX;      // x coordinates of the stars
float[] starY;      // y coordinates of the stars    
float[] starSpeedX; // the speed of the star in the x direction
float[] starSpeedY; // the speed of the star in the y direction
float[] starSize;   // the size of the star
float[] starAngle;  // the current rotational angle of the star
boolean[] isAttracted; // whether the star is attracted to or repelled from other stars
int[] starPoints;   // the number of points on the star
color[] starColour; // the colour of the star
color[] palette;    // a colour palette
int numStars;       // the number of stars to draw

void setup () {
  size(1280, 720);
  background(0);

  numStars = 8; // number of stars to display
  int minPoints = 4; // the minimum number of points on the star
  int maxPoints = 10; // the maximum number of points on the star
  palette = new color[] {0x20F2B749, 0x20D97F30, 0x20D93D1A, 0x20730606, 0x20400303};
//  palette = new color[] {0x301D8281, 0x3044BF87, 0x30FBD258, 0x30F29A3F, 0x30DB634F}; // kuler - tufte
//  palette = new color[] {0x304CBD95, 0x30EFBC5B, 0x30EB9326, 0x30D9643D, 0x308A4065}; // kuler - summer beach  
//  palette = new color[] {0x20FF0000, 0x2000FF00, 0x200000FF, 0x20FFFF00, 0x20FF00FF, 0x2000FFFF};

  // create the arrays that hold star attributes
  starX = new float[numStars];
  starY = new float[numStars];
  starSpeedX = new float[numStars];
  starSpeedY = new float[numStars];
  starSize = new float[numStars];
  starAngle = new float[numStars];
  isAttracted = new boolean[numStars];
  starPoints = new int[numStars];
  starColour = new color[numStars];

  // generate random attributes (location, speed, size, type and colour)  
  for (int i = 0; i < numStars; i++) {
    starX[i] = random(0, width);
    starY[i] = random(0, height);
    starSize[i] = random(25, 150);
    starPoints[i] = int(random(minPoints, maxPoints+1));
    starAngle[i] = 0;
    starSpeedX[i] = random(0, 2) - 1;
    starSpeedY[i] = random(0, 2) - 1;
    isAttracted[i] = true;
    starColour[i] = palette[int(random(5))];
  }
}

void draw() {
//  background(0);
  float outerX, outerY;   // the location of an outer points of a star
  float innerX, innerY;   // the location of an inner points of a star
  float vectorX, vectorY; // vectors acting on the star to change its speed and direction
  float magicNumber = 0.0001; // a value that keeps the calculated vectors acting on the star to a reasonable speed 

  // Begin the main loop that steps through each star; moving it a little, rotating it and 
  // checking to see if it has reached a boundary of the canvas
  
  for (int i = 0; i < numStars; i++) {

    // calculate the vectors acting on the star
    // the vector is proportional to the size of the star and inversely proportional to the distance between them
    vectorX = 0;
    vectorY = 0;
    for (int j = 0; j < numStars; j++) {
      if (starX[i] != starX[j]) {
        vectorX += magicNumber * (starSize[i] * starSize[j])/(starX[i] - starX[j]);
      }
      if (starY[i] != starY[j]) {
        vectorY += magicNumber * (starSize[i] * starSize[j])/(starY[i] - starY[j]);
      }
    }
      
    // Move the star
    if (isAttracted[i]) {
      starSpeedX[i] = constrain(starSpeedX[i] + vectorX, -2, 2);
      starSpeedY[i] = constrain(starSpeedY[i] + vectorY, -2, 2);
    } else {
      starSpeedX[i] = constrain(starSpeedX[i] - vectorX, -2, 2);
      starSpeedY[i] = constrain(starSpeedY[i] - vectorY, -2, 2);
    }
    
    starX[i] += starSpeedX[i];
    starY[i] += starSpeedY[i];
   
    // Check if stars have reacked the boundaries of the sketch
    if (starX[i] < -starSize[i]) {
      starSpeedX[i] = abs(starSpeedX[i]);
    }
    if (starX[i] > width + starSize[i]) {
      starSpeedX[i] = -abs(starSpeedX[i]);
    }   
    if (starY[i] < -starSize[i]) {
      starSpeedY[i] = abs(starSpeedY[i]);
    }
    if (starY[i] > height + starSize[i]) {
      starSpeedY[i] = -abs(starSpeedY[i]);
    }   

    // Draw the star
    stroke(starColour[i]);
    noFill();
//    fill(0);
    pushMatrix();
    translate(starX[i], starY[i]);
    starAngle[i] += 0.025;
    rotate(starAngle[i]);
    beginShape();
    for(int j = 0; j < starPoints[i]; j++) {
      outerX = starSize[i] * cos(TWO_PI/starPoints[i] * j);
      outerY = starSize[i] * sin(TWO_PI/starPoints[i] * j);
      innerX = starSize[i]/2 * cos(TWO_PI/starPoints[i] * j + TWO_PI/(starPoints[i]*2));
      innerY = starSize[i]/2 * sin(TWO_PI/starPoints[i] * j + TWO_PI/(starPoints[i]*2));
      vertex(outerX, outerY);
      vertex(innerX, innerY);
    }
    endShape(CLOSE);
    popMatrix(); 
    
    // Swap the forces acting on the star between attract and repulse at an infrequent interval
    if (random(1) < 0.001) {
      isAttracted[i] = !isAttracted[i];
    }
    
//    println(starX[i], starY[i], vectorX, vectorY);

    // save your drawing when you press keyboard 's'
    if (keyPressed == true && key=='s') {
      saveFrame("image-#####.jpg");
    }
  } // end main loop
}


