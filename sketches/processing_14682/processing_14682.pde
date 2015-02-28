
PImage mapImage;
Table locationTable;
Table aTable;
int rowCount;
float highestValue = 0;
boolean rect1Over, rect2Over, rect3Over = false;
color rect1Color, rect1Highlight;
color rect2Color, rect2Highlight;
color rect3Color, rect3Highlight;
int rectColorInt = 0;
int rectResizeInt = 0;
int Year = 3;

void setup( ) {
  size(640, 400);
  smooth();
  
  rect1Color = color(192,0,0);
  rect2Color = color(0,192,0);
  rect3Color = color(0,0,192);
  rect1Highlight = color(240,0,0);
  rect2Highlight = color(0,240,0);
  rect3Highlight = color(0,200,250);
  
  aTable = new Table("donorenNED.tsv");
  rowCount = aTable.getRowCount();  
  
}

void draw() {
  background(255);
  smooth();
  
  update(mouseX,mouseY);
  
  if(rectColorInt < 192){
   rectColorInt += 2; 
  }
  
  fill(0);
  textSize(12);
  text("", 20, 30);
  text("Donoren 2009", 35, 50);
  text("Donoren 2008", 35, 70);
  text("Klik voor beide jaren", 35, 390);
  
  if(rect1Over) {
    fill(rect1Highlight);
  } else {
    fill(rect1Color);
  }
  rect(20, 40, 12, 12);
  
  if(rect2Over) {
    fill(rect2Highlight);
  } else {
    fill(rect2Color);
  }
  rect(20, 60, 12, 12);
  
  if(rect3Over) {
    fill(rect3Highlight);
  } else {
    fill(rect3Color);
  }
  rect(20, 380, 12, 12);
  
  if(Year == 3){
    
    highestValue = 0; 
    for(int rowHighValue = 0; rowHighValue < rowCount; rowHighValue++){
      if(aTable.getFloat(rowHighValue, 1) > highestValue){
        highestValue = aTable.getFloat(rowHighValue, 1);      
      }      
      if(aTable.getFloat(rowHighValue, 2) > highestValue){
           highestValue = aTable.getFloat(rowHighValue, 2); 
      }
    }
    
    float[] rowArray = new float [aTable.getRowCount()];
      
    fill(0);
    textSize(28);
    text("Orgaandonoren 2008/2009", 160, 22);
    textSize(12);
    text("0", 200, height - 20);
    text(int(highestValue), width-120, height - 20);
    text(int(highestValue/2), (((width-120) - 200)/2) + 200, height - 20);
      
    for(int row = 0; row < rowCount; row++){
      
      fill(0,0,0);
      text(aTable.getString(row, 0),135,((height - 25) - (height / rowCount)) / rowCount * (row+1.6));
      
      
      float xSize = aTable.getFloat(row, 2) * -1;     
      float h = map(xSize, 0, highestValue, 0, -width/2);  
          
      fill(rectColorInt,0,0);
      if(rectResizeInt < h){
        rect(200, ((height - 25) - (height / rowCount)) / rowCount * (row+1), 
          rectResizeInt, (((height - 25) - (height / rowCount)) / rowCount)/2.1);
        
      }else{
        rect(200, ((height - 25) - (height / rowCount)) / rowCount * (row+1), 
            h, (((height - 25) - (height / rowCount)) / rowCount)/2.1);
      }
    
      xSize = aTable.getFloat(row, 1) * -1;     
      h = map(xSize, 0, highestValue, 0, -width/2);  
          
      fill(0,rectColorInt,0);
      if(rectResizeInt < h){
        rect(200, ((height - 25) - (height / rowCount)) / rowCount * (row+1.5), 
          rectResizeInt, (((height - 25) - (height / rowCount)) / rowCount)/2.2);
        
      }else{
      rect(200, ((height - 25) - (height / rowCount)) / rowCount * (row+1.5), 
          h, (((height - 25) - (height / rowCount)) / rowCount)/2.2);
      }
    }
  }else if(Year == 2 || Year == 1){
     highestValue = 0; 
     for(int rowHighValue = 0; rowHighValue < rowCount; rowHighValue++){
        if(aTable.getFloat(rowHighValue, Year) > highestValue){
          highestValue = aTable.getFloat(rowHighValue, Year);      
        }      
     }
    
     float[] rowArray = new float [aTable.getRowCount()];
      
     fill(0);
     textSize(30);
     if(Year==1){
       text("Orgaandonoren 2008", 160, 22);
     }else{
       text("Orgaandonoren 2009", 160, 22);
     }
    
     textSize(12);
     text("0", 200, height - 20);
     text(int(highestValue), width-120, height - 20);
     text(int(highestValue/2), (((width-120) - 200)/2) + 200, height - 20);
      
     for(int row = 0; row < rowCount; row++){
      
       fill(0,0,0);
       text(aTable.getString(row, 0),135,((height - 25) - (height / rowCount)) / rowCount * (row+1.6));
       float xSize = aTable.getFloat(row, Year) * -1;    
       
       float h = map(xSize, 0, highestValue, 0, -width/2);  
       
       if(Year == 2){     
         fill(rectColorInt,0,0);
       }else{
         fill(0,rectColorInt,0);
       }
       if(rectResizeInt < h){
        rect(200, ((height - 25) - (height / rowCount)) / rowCount * (row+1), 
           rectResizeInt, (((height - 25) - (height / rowCount)) / rowCount)-2);         
      }else{
       rect(200, ((height - 25) - (height / rowCount)) / rowCount * (row+1), 
           h, (((height - 25) - (height / rowCount)) / rowCount)-2);        
      }
    }
  }
  rectResizeInt += 2;  
}

void update(int x, int y)
{
  if ( overRect(20, 40, 12, 12) ) {
    rect1Over = true;
  } else {
    rect1Over = false;
  }
  
  if ( overRect(20, 60, 12, 12) ) {
    rect2Over = true;
  } else {
    rect2Over = false;
  }
  
  if ( overRect(20, 380, 12, 12) ) {
    rect3Over = true;
  } else {
    rect3Over = false;
  }
}

boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void mousePressed()
{  
  if (rect1Over) {
    Year = 2;
    rectColorInt = 0;
    rectResizeInt = 0;
  }
  if(rect2Over){
    Year = 1;  
    rectColorInt = 0;
    rectResizeInt = 0;
  }  
  if(rect3Over){
    Year = 3;  
    rectColorInt = 0;
    rectResizeInt = 0;
  }
}


class Table {
  String[][] data;
  int rowCount;
  
  
  Table() {
    data = new String[10][10];
  }

  
  Table(String filename) {
    String[] rows = loadStrings(filename);
    data = new String[rows.length][];
    
    for (int i = 0; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
      }
      if (rows[i].startsWith("#")) {
        continue;  // skip comment lines
      }
      
      // split the row on the tabs
      String[] pieces = split(rows[i], TAB);
      // copy to the table array
      data[rowCount] = pieces;
      rowCount++;
      
      // this could be done in one fell swoop via:
      //data[rowCount++] = split(rows[i], TAB);
    }
    // resize the 'data' array as necessary
    data = (String[][]) subset(data, 0, rowCount);
  }


  int getRowCount() {
    return rowCount;
  }
  
  
  // find a row by its name, returns -1 if no row found
  int getRowIndex(String name) {
    for (int i = 0; i < rowCount; i++) {
      if (data[i][0].equals(name)) {
        return i;
      }
    }
    println("No row named '" + name + "' was found");
    return -1;
  }
  
  
  String getRowName(int row) {
    return getString(row, 0);
  }


  String getString(int rowIndex, int column) {
    return data[rowIndex][column];
  }

  
  String getString(String rowName, int column) {
    return getString(getRowIndex(rowName), column);
  }

  
  int getInt(String rowName, int column) {
    return parseInt(getString(rowName, column));
  }

  
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }

  
  float getFloat(String rowName, int column) {
    return parseFloat(getString(rowName, column));
  }

  
  float getFloat(int rowIndex, int column) {
    return parseFloat(getString(rowIndex, column));
  }
  
  
  void setRowName(int row, String what) {
    data[row][0] = what;
  }


  void setString(int rowIndex, int column, String what) {
    data[rowIndex][column] = what;
  }

  
  void setString(String rowName, int column, String what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = what;
  }

  
  void setInt(int rowIndex, int column, int what) {
    data[rowIndex][column] = str(what);
  }

  
  void setInt(String rowName, int column, int what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }

  
  void setFloat(int rowIndex, int column, float what) {
    data[rowIndex][column] = str(what);
  }


  void setFloat(String rowName, int column, float what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }
  
  
  // Write this table as a TSV file
  void write(PrintWriter writer) {
    for (int i = 0; i < rowCount; i++) {
      for (int j = 0; j < data[i].length; j++) {
        if (j != 0) {
          writer.print(TAB);
        }
        if (data[i][j] != null) {
          writer.print(data[i][j]);
        }
      }
      writer.println();
    }
    writer.flush();
  }
}


