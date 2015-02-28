
float minIndVar = 0.3;
float maxIndVar = 2.2;
int numBins = 4;
int textLabel = 1; // 1 for on
String filename = "sample_Data_XY.txt"; 

void setup() {
  size(800, 600);
 fill(1*255,1*255,1*255); // Set background color (0.85*255,0.85*255,1*255)
  stroke(1,1,1);
  strokeWeight(0);
  rect(0, 0, width, height);
  smooth();
  noLoop();
 }
 
 void draw() {


  rectMode(CORNER);
 fill(1*255,1*255,1*255);
 rect(0, 0, width, height);
   
   String[] tempArray;
   String [] fileContents = loadStrings(filename);
   float[][] values = new float[fileContents.length][2];
   float[][] binBounds = new float[numBins][3]; // 0=bin lower bound, 1= bin upper bound, 2= bin center
   float[][] binMeans = new float[numBins][3]; // [0]= cummulative added values [1] = count [2]=mean (cummulative/count)
     
     // Calculate the bin boundaries
     for (int binIndex=0; binIndex<numBins; binIndex++) {
         binBounds[binIndex][0] = (maxIndVar-minIndVar)/numBins*binIndex + minIndVar;
         binBounds[binIndex][1] = binBounds[binIndex][0] +(maxIndVar-minIndVar)/numBins;
         binBounds[binIndex][2] = (binBounds[binIndex][0] + binBounds[binIndex][1])/2;
     }    
     
     // Loop to assign values values to the 2D array.
     for (int rowIndex=0; rowIndex < fileContents.length; rowIndex++) {
        // Split tokens and use float() to capture each row and column in a 2D array.
        tempArray=splitTokens(fileContents[rowIndex]);
        for (int columnIndex=0; columnIndex < 2; columnIndex++){
            values[rowIndex][columnIndex]=float(tempArray[columnIndex]);  
        }
    }
    
    // Bin the data

    for (int binIndex2=0; binIndex2<numBins; binIndex2++){
      for (int rowIndex2=0; rowIndex2 < fileContents.length; rowIndex2++) {
        if ((values[rowIndex2][0] > binBounds[binIndex2][0]) && (values[rowIndex2][0] < binBounds[binIndex2][1])){
          binMeans[binIndex2][0]= binMeans[binIndex2][0] + values[rowIndex2][1]; // Cummulative
          binMeans[binIndex2][1]=binMeans[binIndex2][1] + 1;  // Number in this bin
          binMeans[binIndex2][2]=binMeans[binIndex2][0]/binMeans[binIndex2][1]; // Mean value in this bin
        }
      }
      //println(binMeans[binIndex2][2]);
    } 
 

  //set up axes
  float yAxisExtent = 50; //  Need to do this so that if I change it, it doesn't screw up the graph scale
  strokeWeight(3);
  stroke(0,0,0,0.2*255);
  line(100,yAxisExtent,100,height-yAxisExtent); // Y axis
  line(75,height/2,width-125,height/2); // X-axis
  

   noFill();

    
  // A few constants to use to determine position of bars
  int xAxis=height/2;
  int xLeftBound=125;
  int xRightBound=width-200;
  int yUpperBound=50;
  int yLowerBound=height-100;
  float rectXpos;
  float rectYpos; 
  float barHeight;
  float barValue;
  
  // Determine the appropriate scale based on the data
  float scale;
  float maxMean=0;
    // Find maximum absolute mean
    for(int binIndex3=0; binIndex3<numBins; binIndex3++){
      if(abs(binMeans[binIndex3][2]) > maxMean){
        maxMean = abs(binMeans[binIndex3][2]);
      }   
    }
  // Determine the appropriate scale such that maxMean max height is the height of the axis
  float maxBarHeight = xAxis-yAxisExtent;
  scale =   maxBarHeight/maxMean;
 
  
  // Draw a few sample rectangles to decide on the positioning and spacing
  stroke(0,0,0);
//  fill(0,0,0);
  rectMode(CENTER); // Third and fourth parameters specify width and height
  float barWidth=(xRightBound-xLeftBound)/ numBins;
  barWidth = barWidth*0.75;
  for(int iBins=0;iBins < numBins; iBins++){

      
     rectXpos= (iBins+1)/float(numBins)*(xRightBound-xLeftBound)  + xLeftBound;
     barValue = binMeans[iBins][2];
     barHeight=abs(barValue)*scale;
     rectYpos= xAxis-(barValue*scale)/2; // Negative because Y increases as you move down the image
     
     // Label the x bin center
    if(textLabel == 1){
       stroke(0,0,0,0.2*255);
        fill(0,0,0,0.5*255);    
       textSize(12);   
       text(binBounds[iBins][2],rectXpos-20,xAxis+20+iBins*10);
       strokeWeight(2);
       line(rectXpos, rectYpos ,rectXpos,xAxis+iBins*10);
      }
     
     // Draw the bar
     stroke(0,0,0); 
     strokeWeight(3);
     fill(1*255,1*255,1*255);
     rect(rectXpos, rectYpos, barWidth, barHeight);
     

  }
  
  //Draw the y axis scale
  float scaleYpos;
  for(int scaleCount = -100;scaleCount < 100;scaleCount=scaleCount+5){
    
    scaleYpos=xAxis - scaleCount*scale;
    if((scaleYpos> 50)&&(scaleYpos< height-50)){
    fill(0,0,0,1*255);
    textSize(20);
    text(scaleCount,50,scaleYpos);
    
    //Draw a tick
    stroke(0,0,0,0.2*255);
    line(100-5,scaleYpos,100+5,scaleYpos);
    
    }
  }
  

  
  
}

void keyPressed(){
    if((key == 'm')&&(numBins<50)){
       numBins=numBins+1;
       redraw();
   }
    if((key == 'n')&&(numBins>2)){
       numBins=numBins-1;
       redraw();
   }
    if(key=='s'){
       save(filename +"_bins_"+numBins+".tif");
       println("Image Saved.");
    } 
  
}


