
PFont myFont;
String[] myTable;
String[] tempRow;

void setup(){
  size(600, 600);  
  background(255);  
  
  colorMode(HSB);  //Hue, Saturation, Brightness
  smooth();
  
  myFont = createFont("Raleway-Bold-12.vlw", 12);
  textFont(myFont);
  
  //load the table
  //An array of Strings (just text)
  myTable = loadStrings("manhattan_garbage_collection.tsv");
  
  //Any row, just to get the number of columns
  tempRow = split(myTable[0], '\t');
}

void draw(){
  background(255);
  
  //Looping through all the columns of the table
  for(int i = 2; i < tempRow.length; i++){
    println("Beginning a new column.");
  
    //Looping through all the lines of the table
   
    for(int j = 1; j <= (myTable.length - 1)/2; j++){
      
      String[] myRow = split(myTable[j], '\t'); //Object that holds each line
      float tonnage = parseFloat(myRow[i]);     //Getting the tonnage for each column
      
      //2012
      float hue = map(i, 2, tempRow.length, 0, 180);
//      float x = map(i, 2, tempRow.length, 100, width); 
//      float y = map(j, 1, myTable.length, 200, height - 100);
      float x =width/2;
      float y =height/2;
      float angle = map(j, 1, (myTable.length - 1)/2 + 1, -PI/2, PI*3/2);
      angle += i * 2*PI / 10 / 4;
      
      float barWidth = map(tonnage,
                           0, getHighestValue(myTable, 5),
                           0, 200);
      noStroke();
      pushMatrix(); 
        translate(x, y);
        rotate(angle);
        
        fill(hue, 255, 255, 80);
        rect(100, 0, barWidth, -10);
        
        //2013
        myRow = split(myTable[j + 9], '\t');
        tonnage = parseFloat(myRow[i]);
        barWidth = map(tonnage,
                             0, getHighestValue(myTable, 5),
                             0, 200);
        
        fill(hue, 255, 255, 255);
        rect(100, 0, barWidth, 10);
        fill(0);
        text(myRow[1], 80, 0);      
      popMatrix();
      
      println("i: " + i + ", j: " + j + ", tonnage: " + tonnage);
    }
  }
}


//This function is going to return the highest value in a given column in a table
float getHighestValue(String[] anyTable, int columnIndex ){  
  float highestValue = 0;
  for(int i = 0; i < anyTable.length; i++){
    String[] myRow = split(anyTable[i], '\t');
    float columnValue = parseFloat(myRow[columnIndex]); 
    if(columnValue > highestValue){
      highestValue = columnValue;
    } 
  }
  return highestValue;  
}


