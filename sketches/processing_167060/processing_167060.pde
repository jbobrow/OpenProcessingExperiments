
// Reading comScore Digital Media Usage data

String[] facts = {"Desktop time has remained consistent while Smartphone time increased 360%", 
                  "Over half of digital media time occurs on mobile devices",
                 "163 million Americans own Smartphones, 87 million own tablets"};
                  
String[] facts2 = {"Mobile Apps account for 52% of total Digital media time",
                  "42% of all Smartphone app time is with the user's single most used app",
                  "iPhone users average nine more app hours/month than Android users"};                 
       
                  
int nRows, nColumns, aRows, aColumns;
String[][] myData, myAgeData;
int hue1 = 240;
float marginY = 120;
float marginX = 100;
int intervalInSeconds = 2;

// Button
float[] btX, btY, btWidth, btHeight, btSpacing, data2010, data2014;
boolean chartOne, chartTwo, chartThree, isHovering1;
int btBrightness1, b;


void setup(){
  size(800, 600);
  colorMode(HSB);
  background(0);
  b = 0;

  // Loading the original txt files and storing each line as an element of my array originalData
  String[] originalData = loadStrings("CStrend.txt");
  String[] originalAgeData = loadStrings("deviceAge3.txt");

  getnRowsAndNColumns(originalData);
  myData = new String[nRows][nColumns];
  saveMyData(originalData);
  
  getAgenRowsAndNColumns(originalAgeData);  
  myAgeData = new String[aRows][aColumns];
  saveMyAgeData(originalAgeData);

}

void draw(){ 
   background(0);  
   drawButtons();
   drawChart();
   if(frameCount % (60 * intervalInSeconds) == 0){
      b++;
      if(b > facts.length - 1){
        b = 0;
      }
   }
}

void drawButtons(){

   //Creating button
  fill(250);
  noStroke();
  float btHeight = 40;
  float btWidth = marginX +60;
  float btX = marginX;
  float btY = height - marginY +20;
  float btSpacing = 60;
  fill(100, 255, btBrightness1);
  rect(marginX*3, height - marginY + 40, marginX *2, 30, 10);
  fill(0);
  textSize(12);
  textAlign(CENTER, CENTER);

   // Changing style based on interaction
    if(isHovering1 == true){
      btBrightness1 = 240;  
      }else{
      btBrightness1 = 190;  
      }  
     if(chartOne != true){
      text("See Share by Device and Age", marginX*3, height - marginY + 40, marginX*2, 30);
      }else{
      text("Return to Digital Media Use by Device", marginX*3, height - marginY + 40, marginX*2, 30); 
      }
}
void drawChart(){ 
   if(chartOne != true){
  // Draw trend chart
  float x, y;
   
      beginShape();
      for(int c = 1; c < nColumns; c ++){   
        x = map(c,
                1, nColumns - 1,
                marginX, width - marginX);
        y = map(parseFloat(myData[1][c]),
                0, 1200,
                height - marginY * 1.5, marginY);        
        vertex(x, y);
       
       fill(255);
       text(myData[2][0], width - marginX + 20, height - parseFloat(myData[1][9]));
       textSize(11);
       textAlign(CENTER, BOTTOM);
       text(myData[0][c], x, height - (marginX * 1.25) + 20);
      }
      fill(hue1, 255, 255);
      vertex(width - marginX, height - marginY * 1.25);
      vertex(marginX, height - marginY * 1.25);
      textAlign(LEFT);
      textSize(12);
      text(myData[2][0], width - marginX + 10, parseFloat(myData[2][9]));
      endShape();

      beginShape();
      for(int c = 1; c < nColumns; c ++){ 
        x = map(c,
                1, nColumns - 1,
                marginX, width - marginX);
        y = map(parseFloat(myData[1][c]) - parseFloat(myData[2][c]),
                0, 1200,
                height - marginY * 1.5, marginY);        
        fill(hue1/3*2, 255, 255);
        vertex(x, y);
       
      }
      vertex(width - marginX, height - marginY * 1.25);
      vertex(marginX, height - marginY * 1.25);
      textAlign(LEFT);
      textSize(10);
      text(myData[3][0], width - marginX + 10, height - parseFloat(myData[2][9])-(parseFloat(myData[3][9])/2));
      endShape();
        
      beginShape();
      for(int c = 1; c < nColumns; c ++){   
        x = map(c,
                1, nColumns - 1,
                marginX, width - marginX);
        y = map(parseFloat(myData[1][c]) - parseFloat(myData[2][c]) - parseFloat(myData[3][c]),
                0, 1200,
                height - marginY * 1.5, marginY);   
        textSize(10);             
        vertex(x, y);
                    }
      fill(hue1/3, 255, 255);
      vertex(width - marginX, height - marginY * 1.25);
      vertex(marginX, height - marginY * 1.25);
      textSize(12);
      textAlign(LEFT);
      text(myData[4][0], width - marginX + 10, height - (parseFloat(myData[4][9])/2));
      endShape();
        
    //labeling X axis and chart title
    fill(255);
    textAlign(CENTER);
    textSize(12);
    text("Monthly Minutes of Usage (billions)", width/2, marginY + 20);
    textSize(14);
    text(facts[b],width/2, 60);
       for(int s = 0; s < 1201; s += 300){
          float lineX1, lineY, lineX2;
          lineX1 = marginX;
          lineX2 = width - marginX;
          lineY = map(s, 0, 1200, height - (marginY * 1.25), marginY);
          stroke(255, 70);
          line(lineX1, lineY, lineX2, lineY);
          textSize(12);
          textAlign(RIGHT, CENTER);
          text(s, lineX1 - 10, lineY);
          fill(250);
          textSize(18);
          textAlign(CENTER);
          text("U.S. Adult Time Spent with Digital Media by Device", width/2, marginY/4);
          textSize(10);
          text("Source: comScore Inc. Multi-Platform Metrix", width/2, height - marginY/5);
        }      
     }else{
//draw stacked bar age chart
  float x1, y1, x2;
  x1 = marginX;
  x2 = width - marginX*1.5;
  
   //Title
  textSize(18);
  text("Time Spent with Digital Media by Age and Device", width/2, marginY/4);
  textSize(10);
  text("Source: comScore Inc. Multi-Platform Metrix", width/2, height - marginY/5);
  fill(255, 0, 255);
  textSize(18);
  textAlign(CENTER);
  text("Distribution of Digital Media Time by Age and Device", width/2, marginY/4);
  textSize(14);
  text(facts2[b],width/2, 60);
 
  // SCALE
  for(int i = 0; i < 101; i +=25){
    y1 = map(i,
    0, 100,
    height - marginY, marginY);
    stroke(255);
    line(x1 * 1.25 , y1, x2, y1);
    textSize(12); 
    text(i, x1, y1);
  }
  //title
    textAlign(CENTER);
    textSize(12);
    text("% of Digital Media Time", width/2, marginY - 20);
    textSize(10);
          text("Source: comScore Inc. Multi-Platform Metrix", width/2, height - marginY/5);
    
  //legend
    noStroke();
    fill(hue1, 255, 255);
    rect(x2+20, marginY + 20, 80, 20, 10);
    fill(hue1 -80, 255,255);
    rect(x2+20, marginY*2, 80, 20, 10);
    fill(hue1 -160, 255,255);
    rect(x2+20, marginY*2+100, 80, 20, 10);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Tablets", x2 + 60, marginY+30);
    text("Smartphones", x2 + 60, marginY * 2 +10); 
    text("Desktop", x2 + 60, marginY * 2 + 110);
    
    
    
  // Draw chart  
for(int c = 1; c < aColumns; c++){
  float rectY = height - marginY;
  for(int r = 1; r < aRows; r++){
      float rectX, rectWidth, rectHeight;
      rectWidth = 80;
      rectX = map(c, 
                  1, aColumns-1, 
                  marginX * 1.5, width - marginX * 2 - 50);
      rectHeight = map(parseFloat(myAgeData[r][c]),
                  0, 100, 
                  0, height - 2 * marginY);
                      
       stroke(0);
       fill(r * 80, 255, 255);               
       rect(rectX, rectY, rectWidth, - rectHeight);
       rectY -= rectHeight;
       fill(0);
       textAlign(CENTER);
       text(myAgeData[r][c] + "%", rectX + rectWidth/2, rectY + rectHeight/2);
       fill(255);
       text(myAgeData[0][c], rectX + rectWidth/2, height - marginY + 20);
       
       }
     }
   }
}

    
void saveMyData(String[] myArray){
  // Loop through each row of my originalData
  for(int r = 0; r < myArray.length; r++){
  
    // Storing the current row
    String thisRow = myArray[r];

    
    // Take the current row, and break it into separate elements
    // Store them in an Array of Strings called theseColumns
    String[] theseColumns = split(thisRow, '\t');
    
    for(int c = 0; c < theseColumns.length; c++){
//      println(theseColumns[c]);

      myData[r][c] = theseColumns[c];      
    }
  }
}

void saveMyAgeData(String[] myAgeArray){
  // This is gonna loop through each row 
  for(int r = 0; r < myAgeArray.length; r++){
  
    // Storing the current row
    String thisAgeRow = myAgeArray[r];

     // Take the current row, and break it into separate elements
    // Store them in an Array of Strings called theseColumns
    String[] theseAgeColumns = split(thisAgeRow, '\t');
 
    for(int a = 0; a < theseAgeColumns.length; a++){
      println(theseAgeColumns[a]);
      myAgeData[r][a] = theseAgeColumns[a];      
      
    }
  }
}

void getnRowsAndNColumns(String[] myArray){
  nRows = myArray.length;
  String[] cellsFromTheFirstRow = split(myArray[0], '\t');
  nColumns = cellsFromTheFirstRow.length;
  
  println(nRows);
  println(nColumns);
}
void getAgenRowsAndNColumns(String[] myAgeArray){
  aRows = myAgeArray.length;
  String[] cellsFromTheFirstAgeRow = split(myAgeArray[0], '\t');
  aColumns = cellsFromTheFirstAgeRow.length;
  
//  println(aRows);
  println(aColumns);
}


void mouseMoved(){
  // Makes each button brighter while mouse hovers over it
 //  rect(marginX*3, height - marginY + 40, marginX *2, 30, 10);
  if(mouseX >= marginX*3 && mouseX <= marginX * 5 &&
  mouseY >= height - marginY +40 && mouseY <= height - marginY +70){
    isHovering1 = true;
  }else{
    isHovering1 = false;
    }    
   }
void mouseReleased(){
  //initiates change in color, chart type or scale based on user interaction
  //rect(marginX*3, height - marginY + 40, marginX *2, 30, 10);
  if(isHovering1){
    if(!chartOne){
     chartOne = true;
  }else{
    chartOne = false;
  }
  }
 }
//overall US dig minutes grew 138% from 2010 to 2014, with over 1.3 billion minutes spent with digital media each month
//while desktop digial media time has remained fairly consistent over the past four years, smartphone time has increased 360%


