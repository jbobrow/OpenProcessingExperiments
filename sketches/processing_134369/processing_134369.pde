
float r;
float theta = 0;
int yMax = 600;
int yTickDist = 20;
int index = 0;
float[] data;
float c = 20000; //  This constant changes the opacity of the lines
float d = 150; // This constant determines the opacity of the red and green bars  (previously at 180 for printing)
float f = 0.7;  // This constant determines the opacity of yellow relative to red and green (d/f) (initially used 1.2)
int numBins = 36; // 9 bins per 60 degrees (36 is good)
float scaleFactor;
String filename = "sampleData.txt";
String plotSwitch = "Count";  // Choose Length, Count, or Mean
int scaleInt = 300;
int colorSwitch = 0;  // 0 makes all green, 1 uses color scheme, 2 uses flow color scheme
float angleThreshold=16.66;

// A few color combinations I particularly liked:
// a soft blue: (0.1*255,0.58*255,1*255)
// light mauve:(0.48*255,0.55*255,1*255)
// lighter mauve:(0.69*255,0.76*255,1*255)
// yellowish white:(1*255,1*255,0.86*255)

void setup() {
  size(800, 800);
  fill(1*255,1*255,1*255); // circle background
  rect(0, 0, width, height);
  smooth();
  noLoop();

}


void draw() {
  

background(1*255,1*255,1*255);
    // Load values from file and save to an array
       String[] tempArray;

    String[] fileContents = loadStrings(filename); 
    float[] anglesData = new float[fileContents.length]; // May be easier to work with integer angles
    float[] lengthData = new float[fileContents.length];
    
     // Loop to assign values values to the 2D array.
     for (int rowIndex=0; rowIndex < fileContents.length; rowIndex++) {
        // Split tokens and use float() to capture each row and column in a 2D array.
        tempArray=splitTokens(fileContents[rowIndex]);
        
          anglesData[rowIndex] =float(tempArray[0]);  
          lengthData[rowIndex]=float(tempArray[1]); 
    }
    
    
//    for(int i = 0;i < angles.length; ++i) {    
//     anglesData[i] = float(angles[i]) * -1; 
//     }
//    
//    for(int k = 0;k < angles.length; ++k) {    
//     lengthData[k] = float(lengths[k]); 
//     } 
        
     smooth();
    if (plotSwitch == "Length"){
      int yTickDist = 20;
    } else if (plotSwitch == "Count"){
        int yTickDist = 50;
    } else if (plotSwitch == "Mean"){
        int yTickDist = 20;
    }
    
    
    
   
       // Calculate number of bins and angle increment
     float binSize = 360/float(numBins);
        
     // Make a float[] holding the summed length of each angle range, where sumLengths.length is the number of bins
    int[] counts = new int[numBins];
    
    float[] sumLengths = new float[numBins];
      
    // MAKE THE COUNTS
    
    float upGradCumulativeLength=0;
    int upGradCount=0;
    float downGradCumulativeLength=0;
    int downGradCount=0;
    float upStreamCumulativeLength=0;
    int upStreamCount=0;
    float downStreamCumulativeLength=0;
    int downStreamCount=0;
   
   
  // Cycle through all angles and decide if they are in the vertical threshold
  // Multiply anglesData[i] *-1 to account for flipping of data done earlier to have proper graph orientation
  for (int i = 0; i < anglesData.length; ++i){
      // Count specifically the number and length of axons facing either particular direction
      if (anglesData[i]*-1 > (90-angleThreshold) && anglesData[i]*-1 < (90+angleThreshold)){
          upGradCumulativeLength=upGradCumulativeLength+lengthData[i];
          upGradCount++;
      }
      if(anglesData[i]*-1 > -(90+angleThreshold) && anglesData[i]*-1<-(90-angleThreshold)){
       downGradCumulativeLength=downGradCumulativeLength+lengthData[i];
       downGradCount++;
      } 
      if (abs(anglesData[i])<(0+angleThreshold)){
          upStreamCumulativeLength=upStreamCumulativeLength+lengthData[i];
          upStreamCount++;
      }
      if(abs(anglesData[i]) > 180-angleThreshold ){
       downStreamCumulativeLength=downStreamCumulativeLength+lengthData[i];
       downStreamCount++;
    }
    
  }
    //Start by offsetting the first bin centered at zero.
    theta = radians(0 - (binSize/2));  
    for (int j = 0; j < (sumLengths.length/2); ++j) {    
      for (int k = 0; k < anglesData.length; ++k) {    
        if(((radians(anglesData[k]) > theta) && (radians(anglesData[k]) < (theta + radians(binSize)))) ){ 
          counts[j]++;
          sumLengths[j] = sumLengths[j] + lengthData[k];
    
          } 
      }
  

     theta = theta + radians(binSize); 
    }  

   // Do the same as above but for the negative values of theta 
    theta = radians(0 - binSize/2);
    for (int m = (sumLengths.length/2); m < sumLengths.length; ++m) {    
      for (int n = 0; n < anglesData.length; ++n) {    
        if(((radians(anglesData[n]) < theta) && (radians(anglesData[n]) > (theta - radians(binSize)))) || ((180 - abs(degrees(theta)) < binSize) && (180 - abs(anglesData[n]) < binSize/2))) { // Needed to add special clause in the case of being near 180. 
          counts[m] ++;
          sumLengths[m] = sumLengths[m] + lengthData[n];
  
        } 
  
      }

     theta = theta - radians(binSize); 
    }
    
    
    
    
    // DRAW THE GRAPH
    
    if (plotSwitch == "Length"){
    scaleFactor = 300 / max(sumLengths);
    } else if (plotSwitch == "Count"){
        scaleFactor = 300 / float(max(counts));

    } else if (plotSwitch == "Mean"){
    // scaleFactor = 400 / max(lengthData); // Cannot compare ave lengths between graphs because of scale factor changing by the max. (When theta is at the value near 180, it counts angles falling in this bin)
    scaleFactor = 4;
    }
    
    

    // Make ticks to represent histogram counts
    r = yTickDist * scaleFactor;
    while (r <= yMax) {
       while (theta < 360) {
          
          // Polar to Cartesian conversion
         float x = r * cos(theta);
         float y = r * sin(theta); 
         
         noStroke();
//         fill(0,10);
  
          // increment angle
        theta += radians(15);
       }
      //r += yTickDist * scaleFactor;
      r += 100;
      theta = 0;
    }  
    
     
    
    // Plot the data
    theta = radians(0);
    for (int i = 0;i < sumLengths.length; ++i) {    
      
      //r is the size of the histogram; the number of counts in each bin. Multiply by a scale factor to fill the screen
     if (plotSwitch == "Count"){
        r = counts[i] * scaleFactor;
      } else if (plotSwitch == "Length"){
      r = sumLengths[i] * scaleFactor;
      } else if(plotSwitch == "Mean"){
        r = sumLengths[i]/counts[i] * scaleFactor;
      }
      
      // Polar to Cartesian conversion
       float x = r * cos(theta);
       float y = r * sin(theta); 
    
    strokeWeight(1.5);   
    stroke(1*255, 1*255, 1*255,200); 
    fill(0.1*255, 0.8*255, 0.1*255,d); // Green 
  
    if(colorSwitch==1){
           if(i == 0){
          stroke(1*255, 1*255, 1*255,200);
          fill(1*255,1*255,0.65*255, d/f); // Yellow (was:(1*255,1*255,0.65*255, d/f))
        } else if(i > counts.length/2 - 1) {
          stroke(1*255, 1*255, 1*255,200); 
          fill(0.1*255, 0.8*255, 0.1*255,d); // Green
        } else if(i < counts.length/2 - 1){
            stroke(1*255, 1*255, 1*255,200);
            fill(0.9*255, 0.1*255, 0.1*255,d); // Red
        } 
        // Yellow color trumps red and green
        if((i < counts.length/2 && i > counts.length/2 - 7)||(i > counts.length/2 +10 && i > counts.length/2 - 6)||(i<7)||(i < counts.length/2 +6&& i>counts.length/2-1)){
            stroke(1*255, 1*255, 1*255,200);
            fill(1*255,1*255,0.5*255, d/f);
         }
    } else if(colorSwitch==2){  // Change color's to represent upstream and downstream.
      if((i<2)||((i < counts.length/2+2) && (i>counts.length/2-1))) {
          stroke(1*255, 1*255, 1*255,200); 
          fill(0.1*255, 0.8*255, 0.1*255,d); // Green
        } else if(i > counts.length-4 || i > counts.length/2-3){
            stroke(1*255, 1*255, 1*255,200);
            fill(0.9*255, 0.1*255, 0.1*255,d); // Red
        } 
        // Yellow color trumps red and green
        if((i>2 && i< (counts.length/2-2))||((i>counts.length/2+1)&&(i<counts.length-3))){
            stroke(1*255, 1*255, 1*255,200);
            fill(1*255,1*255,0.5*255, d/f);
         }
  }

    
    // draw triangle
    
    
    triangle(width/2, height/2, width/2 + (r * cos(theta - radians(binSize/2))), height/2 + (r * sin(theta - radians(binSize/2))), width/2 + (r * cos(theta + radians(binSize/2))), height/2 + (r * sin(theta + radians(binSize/2))));

    if(i < sumLengths.length/2 - 1) {
    theta += radians(binSize); 
    } else if(i == sumLengths.length/2 - 1){
      theta = radians(0-binSize); 
    } else if(i > sumLengths.length/2 - 1){
      theta -= radians(binSize);
    }
   
   }
  // Calculate average 
  float meanGreen=0;
  float meanRed=0;
 

 textSize(24);
text(numBins, 75, 75);
text(plotSwitch, width-150, 75);    
    
    
  
}

void keyPressed(){
  
   if((key=='m')&&(numBins<180)){
      numBins=numBins+2;
      redraw();

    }
    if((key=='n')&&(numBins>9)){
      numBins=numBins-2;
      redraw();
    }

    if(key=='l'){
     plotSwitch="Length"; 
     redraw();
    }
    if(key=='c'){
      plotSwitch="Count";
      redraw();
    }
    if(key=='s'){
       save(filename +"_bins_"+numBins+".tif");
       println("Image Saved.");
    } 
  
}



