
// Ex11_01

color[] rainbow = {#FFFFCD, #CC5C54, #F69162, #85A562, #7AB5DB};
color[] palette = rainbow;
PFont labelFont, titleFont;

Table data;
Table dataSking;
Table dataTest;
Table dataBob4;
Table dataSkeleton;
int rowCount;
int d = 10;

void setup() {
  size(1000, 600);
  data = new Table("data.tsv");
  rowCount = data.getRowCount();
  println("rowCount = " + rowCount);
  
  dataSking = new Table("Sking.tsv");
  rowCount = dataSking.getRowCount();
  println("rowCount = " + rowCount);
  
  dataBob4 = new Table("bob4.tsv");
  rowCount = dataBob4.getRowCount();
  println("rowCount = " + rowCount);
  
  dataSkeleton = new Table("Skeleton.tsv");
  rowCount = dataSkeleton.getRowCount();
  println("rowCount = " + rowCount);
  titleFont = loadFont("GillSans-Bold-18.vlw");
  labelFont = loadFont("GillSans-16.vlw");
}

void draw() {
  background(#FFFFFF);
  textFont(titleFont);
  stroke(180);
  fill(180);
  textAlign(CENTER);
  text("Sochi 2014 Olympic, Comparison of Top 10 Records in a 10-Second Interval", width/2, 20);
  textFont(labelFont);
fill(palette[1], 160);
for (int i = 0; i < 10; i++) {
  line(i * 80 + 250, 100, i * 80 + 250, 100);
  text (i+40, i * 80 + 250, 150);
}

  smooth();
 // noStroke();
  for (int row = 0; row < 10; row++) {
    // Country names
    String country = data.getString(row, 1);
    
    // 500 M short track
    float time = map(data.getFloat(row,  3) - 40, 0, 1, 0, 80) + 250;
    fill(palette[1], 160);
    ellipse(time, height*.2, d, d);
    text("Men's 500m Short Track", 100, height*.2+5);
    if(dist(time, height*.2, mouseX, mouseY) < (d/2+1)) {
      text(country, time, height*.2 - 10);
    } 
    
    fill(palette[2], 160);
    for (int i = 0; i < 10; i++) {
    line(i * 80 + 250, 100, i * 80 + 250, 100);
    text (i+101, i * 80 + 250, height*.3+30);
    }
    // Slalom
    country = dataSking.getString(row, 3);
    float SkiTime = map(dataSking.getFloat(row, 10) - 101, 0, 1, 0, 80) + 250;
    ellipse(SkiTime, height*.3, d, d);
    text("Men's Slalom", 100, height*.3+5);
    if(dist(SkiTime, height*.3, mouseX, mouseY) < (d/2+1)) {
      text(country, SkiTime, height*.3 - 10);
    }

     fill(palette[3], 160);
    for (int i = 0; i < 10; i++) {
    line(i * 80 + 250, 100, i * 80 + 250, 100);
    text (i+220, i * 80 + 250, height*.4+30);
    }
    // bob4
    country = dataBob4.getString(row, 3);
    float bobTime = map(dataBob4.getFloat(row, 7) - 220, 0, 1, 0, 80) + 250;
    fill(palette[3], 160);
    ellipse(bobTime, height*.4, d, d);
    text("Bobsleigh 4 men", 100, height*.4+5);
    if(dist(bobTime, height*.4, mouseX, mouseY) < (d/2+1)) {
      text(country, bobTime, height*.4 - 10);
    }

    // Skeleton
    fill(palette[4], 160);
    for (int i = 0; i < 10; i++) {
    line(i * 80 + 250, 100, i * 80 + 250, height-70);
    text (i+224, i * 80 + 250, height*.5+30);
    }
    // bob4
    country = dataSkeleton.getString(row, 3);
    float SkeletonTime = map(dataSkeleton.getFloat(row, 8) - 224, 0, 1, 0, 80) + 250;
    fill(palette[4], 160);
    ellipse(SkeletonTime, height*.5, d, d);
    text("Men's Skeleton", 100, height*.5+5);
    if(dist(SkeletonTime, height*.5, mouseX, mouseY) < (d/2+1)) {
      text(country, SkeletonTime, height*.5 - 10);
    }
  } 
}
class Table {
  int rowCount;
  String[][] data;
  
  
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
}


