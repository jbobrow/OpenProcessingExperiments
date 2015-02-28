
// Sketch by Patricio Gonzalez Vivo 
// merged with
//----------------------------------------------------
// DT Bootcamp 2013, Parsons the New School for Design. 
// Day 9, Arrays and gravity
// Add gravity to animation
// http://www.processing.org/reference/Array.html
//----------------------------------------------------

PImage cityscape;
int count = 8; //collisions
float gravity = 0.1;
int numFires = 200;  //fireworks

//  Make a bunch of arrays that holds all the information
//
float[] fireX = new float[numFires];  //fireworks
float[] fireY = new float[numFires];
float[] fireXSpeed = new float[numFires];
float[] fireYSpeed = new float[numFires];

color[] fireColors = new color[numFires];

//float gravity;
float[] rad = new float[count];  //collisions
color[] col = new color[count]; 
float[] xPos = new float[count];
float[] yPos = new float[count];
float[] xSpeed = new float[count];
float[] ySpeed = new float[count];

void setup() {
  cityscape = loadImage("cityscape.jpg");
  size(800, 500);  //collision
  smooth();

  noStroke();  //fireworks
  colorMode(HSB);
  gravity = 0.5;

  //  Give random parameter to all the 'balls properties'
  //
  for (int i = 0; i < count;i++) {    //collision
    rad[i] = random(10, 25);
    xPos[i] = random(0+rad[i], width-rad[i]);
    yPos[i] = random(0+rad[i], height-rad[i]);
    xSpeed[i] = random(-3, 3);
    ySpeed[i] = random(-5, 3);
    col[i] = color(random(7,45), random(120,255), random(120,255));

    for (int l = 0; l < fireX.length; l++) {  //fireworks
      fireX[l] = 0;
      fireY[l] = 0;
      fireXSpeed[l] = 0;
      fireYSpeed[l] = 0;
    }
  }
}

void draw() {
  background(234,100,46);
    image(cityscape,0,0,800,500);

  
  noStroke();
  // this for loop recalculates the position of each circle
  for (int l = 5; l < fireX.length; l++) {  //fireworks
    fireX[l] += fireXSpeed[l];
    fireY[l] += fireYSpeed[l];
    fireYSpeed[l] += gravity;
  }

  // this for loop draws all the circles
  for (int l = 0; l < fireX.length; l++) {
    fill(fireColors[l]);
    ellipse(fireX[l], fireY[l], 10, 10);
  }  //fireworks


  for ( int i = 0; i < count; i++) {    //collisions

    //  So, let´s start by check if it´s touching other balls... and if it´s 
    //  do the right collision reaction 
    //
    for ( int j = i; j < count; j++) {
      //  It´s important not to check data with it self
      //
      if (i != j) {
        float distance = dist(xPos[i], yPos[i], xPos[j], yPos[j]);

        if (distance <= (rad[i]+rad[j]) ) {
          yPos[i] -= ySpeed[i]*2.0;  // Make them go to previus position for not getting stock

          ySpeed[i] *= -0.95;
          ySpeed[j] *= -0.95;

          xPos[i] -= xSpeed[i]*2.0;  // Make them go to previus position 

          xSpeed[i] *= -0.95;
          xSpeed[j] *= -0.95;  //collision
        
          for (int m = 0; m < fireX.length; m++) {

            fireX[m] = xPos[i];
            fireY[m] = yPos[i];

            fireXSpeed[m] = random(-4, 6);
            fireYSpeed[m] = random(-17, -11);

            fireColors[m] = color(random(30, 50), 215, 205, 150);  //fireworks
          }
        }
      }
    }

    //  Update the Phisics
    //
    xPos[i] += xSpeed[i];
    yPos[i] += ySpeed[i];
    ySpeed[i] += gravity;
    //  Bounce on walls if it have to
    //
    if ( (xPos[i] >= width-rad[i]) || (xPos[i] <= rad[i]) ) {
      xSpeed[i] *= -1.0;
    }

    if ( (yPos[i] >= height-rad[i]) || (yPos[i] <= rad[i]) ) {
      ySpeed[i] *= -0.95;
    }

    // Render the balls
    //
    fill(col[i]);
    ellipse(xPos[i], yPos[i], rad[i]*2.0, rad[i]*2.0);
  }
}

// create a new set of circles when the mouse is released
//void mouseReleased() {    //fireworks
//
// 
//}

