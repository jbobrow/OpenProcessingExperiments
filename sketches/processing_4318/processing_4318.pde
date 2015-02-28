
/*
 * Invader 2d drawing with sin movement
 * The sin movement is taken from processing examples ;)
 */



int[][] matrix = { { 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
                   { 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 },
                   { 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0 },
                   { 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0 },
                   { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
                   { 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0 },
                   { 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0 },
                   { 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0 },
                   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
                   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
                   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
                   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
                   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
                   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
                   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
};
int mWidth = 11;
int mHeight = 9;
int multFactor = 1;
int startPointX = 0;
int startPointY = 0;

int blockSize = 30;


int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
boolean colorForward = true;

void setup()
{
size(500,500);  
background(0);

startPointX = (width - (mWidth * blockSize)) / 2; 
startPointY = (height - (mHeight * blockSize)) / 2; 

println(startPointX);
println(startPointY);

w = width+16;
dx = (TWO_PI / period) * xspacing;
yvalues = new float[w/xspacing];
  
for(int j=0; j<mWidth; j++) { 
  for(int i=0; i<mHeight; i++) {
    if (matrix[i][j]!=0) matrix[i][j]=100 ;
    }
  }


 
}



void draw()
{
background(0);

//startPointX = (width - (mWidth * blockSize)) / 2; 
//startPointY = (height - (mHeight * blockSize)) / 2; 
  
calcWave();

for(int j=0; j<mWidth; j++) { 
  for(int i=0; i<mHeight; i++) {
    int dott = 133; //color
//    if (matrix[i][j]!=0) {
    fill (matrix[i][j] + multFactor + 100 , matrix[i][j] + multFactor, matrix[i][j] + multFactor);
     rect(j*blockSize + startPointX , i * blockSize + (width/2+yvalues[j]), blockSize, blockSize);  
//    }
  }
}

//shiftColors();

}


void shiftColors()
{
for(int j=0; j<mWidth; j++) { 
  for(int i=0; i<mHeight; i++) {
    matrix[i][j]++;
    }
  }
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.09;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}



void keyPressed(){
  if (key == '1') {
    multFactor += 1;
  } else 
    if (key == '2') {
    multFactor -= 1;
  }
  else 
    if (key == '3') {
    blockSize += 1;
  }
  else 
    if (key == '4') {
    blockSize -= 1;
  }
}



