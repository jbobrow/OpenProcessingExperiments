
/**
 *  
 *  Streamers
 *  By Prita Priscilla Hasjim
 *  Project for ICAM 101 at UCSD
 *
 **/

float beginX = 0.0;      // Initial x-coordinate
float beginY = 0.0;      // Initial y-coordinate
float startX = 20.0;     // Initial x-coordinate
float startY = 10.0;     // Initial y-coordinate
int mouseVal = 0;        // If mouse is pressed, mouseVal > 0
int count1 = 0;          // Counter to 4
int count2 = 0;          // Counter to 4
float endX;              // Final x-coordinate
float endY;              // Final y-coordinate
float distX;             // X-axis distance to move
float distY;             // Y-axis distance to move
float x = 0.0;           // Current x-coordinate
float y = 0.0;           // Current y-coordinate
float pct1 = 0.0;        // Percentage traveled (0.0 to 1.0)
float pct2 = 0.0;        // Percentage traveled (0.0 to 1.0)
float step = 0.01;       // Size of each step along the path
float exponent = 3;      // Determines the curve
boolean over = false;    // If mouse over
boolean move = false;    // If mouse down and over
float[] values = new float[32];       // Array containing random values between 0 - 400
float[] additives = new float[16];    // Array containing random values between 0 - 12 for the additives
float[] colors = new float[21];       // Array containing values for pastel colors
int[] colorOpts = new int[9];         // Array used to determine the color options

void setup() 
{
  size(600, 600);
  noStroke();
  smooth();
  
  setColors();
  
  randomizeVals();

}

void draw() 
{  
  fill(0, 0, 0, 10); // Background color
  rect(0, 0, width, height);

  if(move == true){
    over = true;
    // De-comment this piece of code for an unintentionally cooler effect!
     randomizeVals();
  }
  
  if(over == true){
    makeStreams(mouseX, mouseY);
  }

}

/*
 * makeStreams() illustrated all the different streams
 *
 * Parameters: startX - saves the mouseX pt
 *             startY - saves the mouseY pt
 */
void makeStreams(float startX, float startY){
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
          float k = values[i] + additives[i + j];
          float m = values[i+4] + additives[i + j];
        
          fill(colors[colorOpts[i]-2], colors[colorOpts[i]-1], colors[colorOpts[i]]);
          overArch(startX, startY, k, height);
          underArch(startX, startY, m, 0);

      }
    }

  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
          float n = values[i+8] + additives[i + j];
          float o = values[i+12] + additives[i + j];

        
          fill(colors[colorOpts[i]], colors[colorOpts[i]-1], colors[colorOpts[i]-2]);
          underArch(startX, startY, n, height);
          overArch(startX, startY, o, 0);

      }
    }

  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
          float p = values[i+16] + additives[i + j];
          float q = values[i+20] + additives[i + j];

        
          fill(colors[colorOpts[i]-1], colors[colorOpts[i]], colors[colorOpts[i]-2]);
          underArch(startX, startY, 0, p);
          overArch(startX, startY, width, q);

      }
    }

  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
          float p = values[i+24] + additives[i + j];
          float q = values[i+28] + additives[i + j];

        
          fill(colors[colorOpts[i]-1], colors[colorOpts[i]-2], colors[colorOpts[i]]);
          underArch(startX, startY, 0, p);
          overArch(startX, startY, width, q);

      }
    }

}

/*
 * setColors() sets the arrays used to make colors
 */
void setColors(){
  colors[0] = 204;
  colors[1] = 153;
  colors[2] = 255;
  
  colors[3] = 153;
  colors[4] = 153;
  colors[5] = 255;
  
  colors[6] = 153;
  colors[7] = 204;
  colors[8] = 255;
  
  colors[9] = 153;
  colors[10] = 255;
  colors[11] = 255;
  
  colors[12] = 255;
  colors[13] = 153;
  colors[14] = 255;
  
  colors[15] = 173;
  colors[16] = 92;
  colors[17] = 255;
  
  colors[18] = 255;
  colors[19] = 153;
  colors[20] = 204;
}

/*
 * randomizeVals() resets and randomizes all of the colors and coordinates
 */
void randomizeVals(){    
  
  for(int i = 0; i <= 8; i++){    
    colorOpts[i] = (int)random(1, 7) * 3 - 1;
  }
  
  for(int i = 0; i < 16; i++){
    additives[i] = random(0, 10);
  }
 
 float temp;
  
  for(int i = 0; i < 32; i = i + 4){
    temp = random(1, 600);
  
    values[i] = temp;
    values[i+1] = values[i] + 5;
    values[i+2] = values[i] + 10;
    values[i+3] = values[i] + 15;
  }

}

/*
 * mouseReleased() is used to determine if the user released his mouse click
 */
void mousePressed(){
  move = true;
  randomizeVals();

}

/*
 * mouseReleased() is used to determine if the user released his mouse click
 */
void mouseReleased(){
  move = false;
}

/*
 * overArch() is the equation for the stream when taking an exponential path
 *
 * Parameters:  float beginX - starting x-coordinate location
 *              float beginY - starting y-coordinate location
 *              float endX - ending X-coordinate location
 *              float endY - ending Y-coordinate location
 *
 */
void overArch(float beginX, float beginY, float endX, float endY){
  distX = endX - beginX;
  distY = endY - beginY;
  
  if (pct1 >= 1.0){
      x = endX;
      y = endY;
      endX = 100 + endX;
      endY = 100 + endY;
  
      distX = endX - beginX;
      distY = endY - beginY;
  
      pct1 = 0.0;
  
  }

  if(count1 <= 28){
    if (pct1 < 1.0){
      x = beginX + (pct1 * distX);
      y = beginY + (pow(pct1, exponent) * distY);
    }
    count1++;
  }
  
  else{ // if count == 24
    count1 = 0;
    pct1 += step;
  }
    ellipse(x, y, 15, 15);
}

/*
 * underArch() is the equation for the stream when taking a root path
 *
 * Parameters:  float beginX - starting x-coordinate location
 *              float beginY - starting y-coordinate location
 *              float endX - ending X-coordinate location
 *              float endY - ending Y-coordinate location
 *
 */
void underArch(float beginX, float beginY, float endX, float endY){
  distX = endX - beginX;
  distY = endY - beginY;
  
  if (pct2 >= 1.0){
      x = endX;
      y = endY;
      endX = 100 + endX;
      endY = 100 + endY;
  
      distX = endX - beginX;
      distY = endY - beginY;
      
      pct2 = 0.0;
  }
  
  if(count2 <= 24){
    if (pct2 < 1.0){
      x = beginX + (pct2 * distX);
      y = beginY + (sqrt(pct2) * distY);
    }
    count2++;
  }
  
  else{ // if count == 24
    count2 = 0;
    pct2 += step;
  }
    ellipse(x, y, 15, 15);
}


