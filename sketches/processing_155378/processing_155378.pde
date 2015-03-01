
//Created by Isaac Beck
//Visit www.isaacbeck.com for more information 

/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */


Table dataTable;
int rowCount;
float eleMin = MAX_FLOAT;
float eleMax = MIN_FLOAT;
float padXR =50; 
float padXL =75; 
float padYTop =200; 
float padYBtm = 50; 
int pointSize =2; 
float totalDistKM; 
float totalMClimb =0; 
boolean dispTxt = false;
int day = 8; //Day 8 is the overview
float dayMax = MIN_FLOAT;
float dayMin = MAX_FLOAT;
float dayDistKM =0; 
float startDistKM = 0; 
float finalDistKM =0; 
PFont titleFont; 
PFont bodyFont; 
float dayMClimb = 0; 
float gradeMin = MAX_FLOAT;
float gradeMax = MIN_FLOAT;
float dayGradeMin = MAX_FLOAT;
float dayGradeMax = MIN_FLOAT;
float closestDist;
String closestText;
float closestTextX; 
float closestTextY;
long lastTime = 0;


void setup(){
  
  size(800,600);
  
  
  dataTable = new Table("data3.csv");
  rowCount = dataTable.getRowCount();
  titleFont = createFont("SansSerif",40);
  bodyFont = createFont("SansSerif",20);
  textFont(titleFont);   
  
  for (int row = 0; row < rowCount; row++){
    float value = dataTable.getFloat(row,3);
      if (value > eleMax){
        eleMax = value;
      }
      if (value < eleMin){
        eleMin = value;
      }
      if (row == rowCount-1) {
        totalDistKM = dataTable.getFloat(row,6);
      }
    float value2 = dataTable.getFloat(row,8);
      if (value2 > gradeMax){
        gradeMax = value2;
      }
      if (value2 < gradeMin){
        gradeMin = value2;
      }
      float value3 = dataTable.getFloat(row,3);
      if (row < rowCount-1){
        if (value3 < dataTable.getFloat(row+1,3)){
          totalMClimb = totalMClimb +(dataTable.getFloat(row+1,3)-value3);
        }
      }
  }
  
  //totalDistMI = totalDistKM*.621371;
  //print(gradeMax);
  //print(gradeMin);
  smooth();
  lastTime = millis();
}

void draw(){
  //frameRate(10);
  //background(#FFFFFF);
  background(#474747);
  closestDist = MAX_FLOAT;
  
  
  noFill();
  strokeWeight(1.5);
  drawDay(day);
  drawXLabels();
  drawYLabels();
  drawAxisLines();
  //Display rollover text on each graph
  //closestText,closTextX and closestTextY are set in the drawDataHighlight method
  if(closestDist != MAX_FLOAT){
   fill(#F8FFC6);
   rect(closestTextX-45,closestTextY-20,90,50);
   strokeWeight(1.5);
   fill(0);
   textSize(18);
   textAlign(CENTER);
   text(closestText, closestTextX, closestTextY);
   
  } 
  drawYText();
}
//Melissa is the best bug tester ever

void drawDay(int day){
  
  if (day == 8){
    for (int row =0; row < rowCount; row++){
      fill(#373EFF);
      textFont(titleFont); 
      textAlign(CENTER,TOP);
      text("RAGBRAI 2014 Overview", width/2,10); 
      printDayStats();
      //drawDataHighlight(row);
 
      float elevation = dataTable.getFloat(row,3);
      float totalD = dataTable.getFloat(row,6);
      float x = map(totalD, 0,totalDistKM,padXL,width-padXR);
      float y = map(elevation,eleMin,eleMax,height-padYBtm,0+padYTop); // )(0,0) is top left corner thus y is "inverted"
      
      if (dataTable.getFloat(row,0) == 1){
        fill(#0000FF);
      } else if (dataTable.getFloat(row,0) == 2){
        fill(#0080FF);
      } else if (dataTable.getFloat(row,0) == 3){
        fill(#00FFFF);
      } else if (dataTable.getFloat(row,0) == 4){
        fill(#00FF00);
      } else if (dataTable.getFloat(row,0) == 5){
        fill(#FFFF00);
      } else if (dataTable.getFloat(row,0) == 6){
        fill(#FF8000);
      } else if (dataTable.getFloat(row,0) == 7){
        fill(#FF0000);
      } 
      noStroke(); 
      ellipse(x,y,pointSize,pointSize);
    }  
  } else {
    beginShape();
      for (int row =0; row < rowCount; row++){
        
        //float elapsedDist = dataTable.getFloat(row,6);
        drawDataHighlight(row);
        
        if (dataTable.getFloat(row,0) == day){
          
          
          float elevation = dataTable.getFloat(row,3);
          float currentDist = dataTable.getFloat(row,6);
          float x = map(currentDist, startDistKM,finalDistKM,padXL,width-padXR);
          float y = map(elevation,dayMin,dayMax,height-padYBtm,0+padYTop); // (0,0) is top left corner thus y is "inverted"
          if (dataTable.getFloat(row,0) == 1){
            printDayStats();
            stroke(#0000FF);
            printTitle(row);
          } else if (dataTable.getFloat(row,0) == 2){
            printDayStats();
            stroke(#0080FF);
            printTitle(row);
          } else if (dataTable.getFloat(row,0) == 3){
            printDayStats();
            stroke(#00FFFF);
            printTitle(row);
          } else if (dataTable.getFloat(row,0) == 4){
            printDayStats();
            stroke(#00FF00);
            printTitle(row);
          } else if (dataTable.getFloat(row,0) == 5){
            printDayStats();
            stroke(#FFFF00);
            printTitle(row);
          } else if (dataTable.getFloat(row,0) == 6){
            printDayStats();
            stroke(#FF8000);
            printTitle(row);
          } else if (dataTable.getFloat(row,0) == 7){
            printDayStats();
            stroke(#FF0000);
            printTitle(row);
          }
          //noStroke(); 
          curveVertex(x,y); 
      }
    } 
    endShape();
  }
}

void mouseClicked(){
  if (millis()-lastTime>1000){ //added 5 second delay betewwn mouse clicks 
    day = day+1; //Day 8 is the overview
    resetDailyStats();
    if (day == 9){
      day =1;
    }
    //Recalculate max and min elevation, and start/end dist each time the mouse is clicked. 
    updateDailyStats();
    lastTime = millis();
  }
}

void printDayStats(){
  
 fill(0);
  
  if (day ==8) {
    textFont(bodyFont);
    smooth();
    textAlign(LEFT); 
    text("Total Distance: "+nf(kmToMi(totalDistKM),0,2)+" mi",75,75);
    text("Total Feet of Climb: "+nf(metersToFt(totalMClimb),0,2)+" ft",75,100);
    text("Each Color Represents a Day",425,75);
    text("Click to See Individual Days",425,100);
    
  } else{
    textFont(bodyFont);
    smooth();
    textAlign(LEFT); 
    text("Distance: "+nf(kmToMi(dayDistKM),0,2)+" mi",75,75);
    text("Max height: "+ nf(metersToFt(dayMax),0,2)+" ft", 75,100);
    text("Total feet of climb: " + nf(metersToFt(dayMClimb),0,2)+" ft", 75, 125);
    text("Max sustained grade: " + nf(dayGradeMax,0,2)+"%", 425, 75);
    text("Min sustained grade: " + nf(dayGradeMin,0,2)+"%", 425, 100);
    textSize(14);
    textAlign(CENTER);
    text("(Mouse Over Graph for Additional Information)",width/2,150);
  }
  noFill();
}

float kmToMi(float km){
  return km*0.621371; //i.e 1 mi = 0.621371 km 
}

float metersToFt(float meters){
  return meters*3.28084; //i.e. 1 meter = 3.28084 ft
}

void printTitle(int row){
  
  if (dataTable.getFloat(row,0) == 1){
            fill(#0000FF);
          } else if (dataTable.getFloat(row,0) == 2){
            fill(#0080FF);
          } else if (dataTable.getFloat(row,0) == 3){
            fill(#00FFFF);
          } else if (dataTable.getFloat(row,0) == 4){
            printDayStats();
            fill(#00FF00);
          } else if (dataTable.getFloat(row,0) == 5){
            printDayStats();
            fill(#FFFF00);
          } else if (dataTable.getFloat(row,0) == 6){
            printDayStats();
            fill(#FF8000);
          } else if (dataTable.getFloat(row,0) == 7){
            printDayStats();
            fill(#FF0000);
          }
  textFont(titleFont); 
  textAlign(CENTER,TOP);
  text("Day " + day, width/2,10); 
  noFill();
}

void drawXLabels(){
  fill(0);
  textFont(bodyFont);
  textSize(18);
  textAlign(CENTER, TOP);
  
  //Use thin, gray lines to draw the grid. 
  //stroke(255);
  //strokeWeight(1);

  if (day == 8){
    int interval = round(kmToMi(totalDistKM)/5);//5 x axis labels 
    int xCoord =0; 
    for ( int i =0; i < 6; i++){
      float x = map(xCoord,0,kmToMi(totalDistKM),padXL,width-padXR);
      text(xCoord,x,height-40);
      xCoord = xCoord+interval;
      //line(xCoord,height-padYTop,x,height-padYTop);
      text("Distance in Miles", width/2, height-25);
    }
  } else {  
    int interval = round(kmToMi(dayDistKM)/5);//5 x axis labels 
    int xCoord =0;
    for ( int i =0; i < 6; i++){
      float x = map(xCoord,0,kmToMi(dayDistKM),padXL,width-padXR);
      text(xCoord,x,height-40);
      xCoord = xCoord+interval;
      //line(xCoord,height-padYTop,x,height-padYTop);
      text("Distance in Miles", width/2, height-25);
    }
  }
}

void drawAxisLines(){
  stroke(0);
  strokeWeight(2);
  line(padXL-5,height-padYBtm+5,padXL-5,padYTop);
  line(padXL-5,height-padYBtm+5,width-padXR+15,height-padYBtm+5);
}  

void drawYLabels() {
  fill(0);
  textFont(bodyFont);
  textSize(18);
  textAlign(CENTER,BASELINE);
  
  //Use thin, gray lines to draw the grid. 
  //stroke(255);
  //strokeWeight(1);

  if (day == 8){
    int interval = round(metersToFt(eleMax-eleMin)/3);  //Gives 4 Y axis markers
    int yCoord = (int)metersToFt(eleMin);
    for ( int i =0; i < 4; i++){
      float y = map(yCoord,metersToFt(eleMin),metersToFt(eleMax),height-padYBtm,padYTop);
      text(yCoord,padXL-30,y+5);
      yCoord = yCoord+interval;
      
    }
  } else {  
    int interval = round(metersToFt(dayMax-dayMin)/3); //Gives 4 Y axis markers 
    int yCoord =(int) metersToFt(dayMin);
    for ( int i =0; i < 4; i++){
      float y = map(yCoord,metersToFt(dayMin),metersToFt(dayMax),height-padYBtm,padYTop);
      text(yCoord,padXL-30,y+5);
      yCoord = yCoord+interval;
    }
  }
} 

void resetDailyStats(){
  //Reset daily values
    startDistKM = 1000; 
    finalDistKM =0;
    dayMax= MIN_FLOAT; 
    dayMin = MAX_FLOAT;
    dayMClimb = 0;
    dayGradeMin = MAX_FLOAT;
    dayGradeMax = MIN_FLOAT;
}

void updateDailyStats(){
  for (int row =0; row < rowCount; row++){
      if (dataTable.getFloat(row,0) == day){
      float value = dataTable.getFloat(row,3);
      if (value > dayMax){
        dayMax = value;
        
      }
      if (value < dayMin){
        dayMin = value;
      }
      float value2 = dataTable.getFloat(row,6);
      if ( value2 < startDistKM){
        startDistKM = value2;
      } 
      
      if ( value2 > finalDistKM){
        finalDistKM = value2;
      }
      dayDistKM = finalDistKM-startDistKM;
      
      //Calculate total climb
      float value3 = dataTable.getFloat(row,3);
      if (row < rowCount-1){
        if (value3 < dataTable.getFloat(row+1,3)){
          dayMClimb = dayMClimb +(dataTable.getFloat(row+1,3)-value3);
        }
      }
      //Calculate daily max/min grade
      float value4 = dataTable.getFloat(row,8);
      if (value4 > dayGradeMax){
        dayGradeMax = value4;
      }
      if (value4 < dayGradeMin){
        dayGradeMin = value4;
      }
    }
  }
}

void drawYText(){
  fill(0);
  textFont(bodyFont);   
  textSize(20);  
  translate(25,(height+padYTop-25)/2);  
  rotate(3*PI/2);               
  textAlign(CENTER);            
  text("Elevation in Feet",0,0);
  
}

void drawDataHighlight(int row){
  float ele = dataTable.getFloat(row,3);
  float slope = dataTable.getFloat(row,8);
  float distance = dataTable.getFloat(row,6);
  float x = map(distance, startDistKM,finalDistKM,padXL,width-padXR);
  float y = map(ele,dayMin,dayMax,height-padYBtm,0+padYTop);
  float d = dist(mouseX,mouseY,x,y);
  if ((d < 15) && (d < closestDist)){
    point(x,y);
    closestDist = d; 
    closestTextX = x-50; 
    closestTextY = y-50; 
    closestText = nf(metersToFt(ele),0,2)+"ft\n("+nf(slope,1,2)+"%)";
  }
}

class Table {
  int rowCountLocal;
  String[][] data;
  
  Table(String filename) {
    String[] rows = loadStrings(filename);
    
    data = new String[rows.length][];
    rowCountLocal = 0;
    for (int i = 0; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
      }
      if (rows[i].startsWith("#")) {
        continue;  // skip comment lines
      }
      // split the row on the tabs
      String[] pieces = split(rows[i], ',');
      // copy to the table array
      data[rowCountLocal] = pieces;
      rowCountLocal++;
    }
  }
  
  int getRowCount() {
    return rowCountLocal;
  }
  
  String getString(int rowIndex, int column) {
    return data[rowIndex][column];
  }
  
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }
  
  float getFloat(int rowIndex, int column) {
    return parseFloat(getString(rowIndex, column));
  }
}



  



