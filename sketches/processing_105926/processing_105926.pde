
// define the number of balls for the array
int numPos = 10;

// define how big the arrays are for the x and y position of the ball
int[] xPos = new int[numPos];
int[] yPos = new int[numPos];

// define a velocity array for x and y
int[] velocityX = new int[10];
int[] velocityY = new int[10];

// set variable for circle diameter
int d = 10;

void setup(){
  size(displayWidth, displayHeight);
  //background(255);
  colorMode(HSB, 360, 100, 100, 100);
  
  noStroke();
  
  // define values for the x, y, and velocity array positions
  for (int i = 0; i < numPos; i++){
    xPos[i] = 30 + (i*30);  
    yPos[i] = 10 + (i*20);
    velocityX[i] = 1+ i*2;
    velocityY[i] = 1+ i*4;
  }
}

void draw(){
  
  background(250, 100, 100, 20);

  for (int i = 0; i < numPos; i++){
    //fill(100, 50, 50, 10); //assign fills to the circles with random hues
    xPos[i] += velocityX[i]; // increase the position and velocity of xPos
    yPos[i] += velocityY[i]; // " " yPos
    
    if (xPos[i] > (width -10) || xPos[i] < 10) { // if the balls' x position approaches the size bounds reverse direction
      velocityX[i]*=-1;
    }
    
    if (yPos[i] > (height -10) || yPos[i] < 10) {  // if the balls' y position approaches the size bounds reverse direction
      velocityY[i]*=-1;
    }
    
    float time = millis()/300.0; // add variable for time
    float sine = sin(time); //get sine wave value

    float hue = map(sine, -1, 1, 0, 360); // apply sine value to variables for hue, sat, bri
    float sat = map(sine, -1, 1, 0, 100);
    float bri = map(sine, -1, 1, 0, 100);
    
    fill(hue, sat, bri, 10);
    for (int j = 0; j < i*2; j++){
      ellipse(xPos[i], yPos[i], d + i*3 + d + j*3, d +i*3 + d +j*3);
    }
    
    fill(50, sat, 100, 100);
    ellipse(xPos[i], yPos[i], d + i*3, d + i*3); // draw the balls from xPos and yPos arrays.
  }
}

boolean sketchFullScreen() {
  return true;
}

void mousePressed(){
    for (int i = 0; i < numPos; i++){
      if (velocityX[i] != 0){
        velocityX[i] = 0;   
        velocityY[i] = 0;
      } else {
          velocityX[i] = 1+ i*2;   
          velocityY[i] = 1+ i*4;
      }
   } 
}




