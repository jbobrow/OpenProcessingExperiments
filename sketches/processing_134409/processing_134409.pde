

String filename = "_STA.txt"; 
int minTau = 2;
int maxTau=100;
int currTau=2;
int inputWidth=100;
int boxWidth;
int boxHeight;
float lowerIntensityLimit=0.4;
float upperIntensityLimit=0.6;
float[][] squarePositionsX = new float[inputWidth][inputWidth]; 
float[][] squarePositionsY = new float[inputWidth][inputWidth]; 

void setup() {
  size(500, 500);
  fill(1*255,1*255,1*255); // Set background color (0.85*255,0.85*255,1*255)
  stroke(0,0,0);
  strokeWeight(5);
  boxWidth=width/inputWidth;
  boxHeight=height/inputWidth;
  smooth();

 // Loop to make the same size 2D array with the position of the center of each rectangle
  for (int rowIndex2=0; rowIndex2 < inputWidth; rowIndex2++) {
      for (int columnIndex2=0; columnIndex2 < inputWidth; columnIndex2++){
          squarePositionsX[rowIndex2][columnIndex2]=((float(columnIndex2)/float(inputWidth))*float(width));
          squarePositionsY[rowIndex2][columnIndex2]=((float(rowIndex2)/float(inputWidth))*float(height));
      }
  }
  
  noLoop();
 }
 
 void draw() {

// To keep the image from saturating with black pixels, make a white rectangle at each iteration 
 fill(1*255,1*255,1*255);
 background(1*255,1*255,1*255);
    
 String[] tempArray;
    String [] fileContents = loadStrings(currTau+filename);
    float[][] intensities = new float[inputWidth][inputWidth];

     
     // Loop to assign intensity values to the array.
     for (int rowIndex=0; rowIndex < inputWidth; rowIndex++) {
        // Split tokens and use float() to capture each row and column in a 2D array.
        tempArray=splitTokens(fileContents[rowIndex]);
        for (int columnIndex=0; columnIndex < inputWidth; columnIndex++){
            intensities[rowIndex][columnIndex]=float(tempArray[columnIndex]);  // This is working properly
        }
    }
 
    // Draw squars of appropriate intensity
      rectMode(CORNER);
      strokeWeight(0);    
      stroke(0*255, 0*255, 0*255, 0 * 255);
     
     for (int rowIndex2=0; rowIndex2 < inputWidth; rowIndex2++) {
        for (int columnIndex2=0; columnIndex2 < inputWidth; columnIndex2++){
            float localIntensity=intensities[rowIndex2][columnIndex2];
            float mappedIntensity=map(localIntensity, lowerIntensityLimit, upperIntensityLimit, 0, 1);
            fill(0*255, 0*255, 0*255, mappedIntensity * 255);          
            rect(squarePositionsX[rowIndex2][columnIndex2], squarePositionsY[rowIndex2][columnIndex2], boxWidth, boxHeight);
        }
     }
 }
 void keyPressed(){
 if((key=='n')&&(currTau > minTau)){
     currTau=currTau-1;
     //println(currTau);
     redraw();
     
   }
    if((key=='m')&&(currTau < maxTau)){
     currTau=currTau+1;
     //println(currTau);
     redraw();
   }
   if(key=='s'){
     save("STA_tau_ " +int(currTau) +"_size_" + int(inputWidth)+".png"); 
   }
 }


