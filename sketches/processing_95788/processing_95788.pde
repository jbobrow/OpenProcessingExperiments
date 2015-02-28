
class Analyzer
{
 
  boolean doneWithAnalysis;
  int time;
  int numberOfPixels;
  int possiblePixelCount;
  int clustersDifferenceCount;
  int[] possiblePixels;
  int dataPointCount;
  DataPoint[] dataPoint = new DataPoint[numberOfDegreesToScan * 500 * numberOfScans];
  
  
  Analyzer(){
    possiblePixelCount = 0;
    dataPointCount = 0;
    doneWithAnalysis = true;
    
   // numberOfPixels = video.width * video.height;
    numberOfPixels = 250000;
    possiblePixels = new int[numberOfPixels];
    for(int i = 0; i < numberOfDegreesToScan * 500 * numberOfScans; i ++){
      dataPoint[i] = new DataPoint();
    }
  }//end of constructor
  
  void findLaser(){
    doneWithAnalysis = false;
    clearData();
    float offset;
    int currentDataPointIndex = 0;
    int currentRow = 0;
    int currR = 0;
    int currG = 0;
    int currB = 0;
    int tempWinningPixel = -1;
    color currColor;
    int xPosition = 0;
    int yPosition = 0;
    int zPosition = 0;
    int tilt = 0;
    int yaw = 0;
    arduino.digitalWrite(4,arduino.LOW);
    
    
    
    if(video.available()){
   
      while(true){
      arduino.digitalWrite(2,arduino.HIGH);
      video.read();
      video.loadPixels();
      
        for(int i = currentRow * 500; i < ((currentRow * 500) + 500); i++){ 
            currColor = video.pixels[i];
            currR = (currColor >> 16) & 0xFF;
            currG = (currColor >> 8) & 0xFF;
            currB = currColor & 0xFF;
            
        if(currR > brightnessThreshold){
         /*
         print("Found it, row:");
         print(currentRow);
         print(" Pixel #:");
         print(i);
         print(" degree: ");
         println(degree);
         */
          dataPointCount++;
          dataPoint[currentDataPointIndex].startX = xPosition;
          dataPoint[currentDataPointIndex].startY = yPosition;
          dataPoint[currentDataPointIndex].startY = zPosition;
          dataPoint[currentDataPointIndex].startYawDegree = yaw;
          dataPoint[currentDataPointIndex].startTiltDegree = tilt;
          dataPoint[currentDataPointIndex].pixel = i;
          dataPoint[currentDataPointIndex].row = currentRow;
          dataPoint[currentDataPointIndex].yawDegree = degree;
          dataPoint[currentDataPointIndex].tiltDegree = (int)map(currentRow, 0, 500, -15, 30);
          dataPoint[currentDataPointIndex].xValue = dataPoint[currentDataPointIndex].pixel - ((dataPoint[currentDataPointIndex].row) * 500);
          offset = sqrt(sq(500) + sq((500*tan(radians(dataPoint[currentDataPointIndex].tiltDegree)))) )-500;
          dataPoint[currentDataPointIndex].distance = (int)(map(dataPoint[currentDataPointIndex].xValue, 0, 500, 500, 0) + offset);
          //dataPoint[currentDataPointIndex].distance = (int)(map(dataPoint[currentDataPointIndex].xValue, 0, 500, 500, 0));
          currentDataPointIndex++;
          i += 500;
          currentRow++;
        }
        //end of row
        if(i == ((currentRow * 500) +499)){
          currentRow++;
        }
        
        if(currentRow == 498){
          
            degree++;
            arduino.analogWrite(9,degree);
            currentRow = 0;
            time = millis();
            while((millis() - time) < 100){
        }
            if(degree == numberOfDegreesToScan){
              degree = 0;
              arduino.analogWrite(9,degree);
             doneWithAnalysis = true;
              fileManager.saveOpenFile();
              return;
           }//if with reached the last degree
        }//if we reached the bottom row
            
        }//for row

      }//end of while true
    }//if video available
    else{
      println("Video unavailable");
    }

    return;
  }//end of findLaser()
  //=========================================================
  void clearData(){
   for(int i = 0; i <  numberOfDegreesToScan * 500; i++){
       dataPoint[i].xValue = 0;
       dataPoint[i].distance = 0;
       dataPoint[i].yawDegree = 0;
       dataPoint[i].tiltDegree = 0;
       dataPoint[i].row = 0;
       dataPoint[i].pixel = 0;
    }
  }
  //==============================================================================================================================
  void recalculateDist(){
    float offset;
    for(int i = 0; i < dataPointCount; i ++){
        dataPoint[i].startX = 0;
        dataPoint[i].startY = 0;
        dataPoint[i].startZ = 0;
        dataPoint[i].startYawDegree = 0;
        dataPoint[i].startTiltDegree = 0;
        dataPoint[i].tiltDegree = (int)map(dataPoint[i].row, 0, 500, -15, 30);
        offset = sqrt(sq(500) + sq((500*tan(radians(dataPoint[i].tiltDegree)))) )-500;
        dataPoint[i].distance = (int)(map(dataPoint[i].xValue, 0, 500, 600, 100) + offset);
        
        dataPoint[i].modeledX = dataPoint[i].distance * .15 * sin(radians(dataPoint[i].yawDegree));
        dataPoint[i].modeledZ = dataPoint[i].distance * .15 * cos(radians(dataPoint[i].yawDegree));
        dataPoint[i].modeledY = dataPoint[i].distance * .15 * sin(radians(dataPoint[i].tiltDegree));
        mapper.modeled = false;
    }
  }
  
  //==========================================================
  
  void manualScan(){
    /*
    brightnessThreshold = 256;
    winningPixel = -1;
    int currR = 0;
    int currG = 0;
     int currB = 0;
     int tempWinningPixel = -1;
    color currColor;
    
    
    arduino.digitalWrite(2,Arduino.HIGH);
    
    
    while(true){
      
        for(int i = 226; i < numberOfPixels/2; i++){ 
          if(i % 240 == 0){
            i += 500;
          }
          
          if((i % 500 > 225) && (i % 500 < 240)){
            currColor = video.pixels[i];
            currR = (currColor >> 16) & 0xFF;
            currG = (currColor >> 8) & 0xFF;
            currB = currColor & 0xFF;
          }else{
            continue;
            
          }
        if((i % 500 > 225) && (i % 500 < 240) && (currR > brightnessThreshold && currG > brightnessThreshold && currB > brightnessThreshold)){
         
          
          winningPixel = i;
            
           // println("");
           // print("Winning Test Number :");
            //println(testNumber);
            //arduino.digitalWrite(2,Arduino.HIGH);
            
            doneWithAnalysis = true;
            return;
         
        }
          
     
        }//for all pixels
        
        brightnessThreshold--;
        //println("");
        //print("Brightness :");
        //println(brightnessThreshold);
      
      
      if(brightnessThreshold < 240){
        doneWithAnalysis = true;
        
       // println("");
       // print("Losing Test Number :");
       // println(testNumber);
   
            
        return;
        }
      }//end of while true
      
      */
  }//end of manualScan()
  
}//end of Analyzer Class

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


