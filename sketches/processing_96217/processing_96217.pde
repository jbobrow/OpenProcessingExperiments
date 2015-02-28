
// yanglin 2013.04.15

color[] rainbow = {#ffffff, #CC5C54, #F69162, #8c632d, #e4ddc3, #fbb84f, #94b485, #7AB5DB, #8e81b5 };
color[] palette = rainbow;
PFont labelFont;

Table stateData;
int rowCount;
int d = 10;

void setup() {
  size(650, 400);
  stateData = new Table("stateData.tsv");
  rowCount = stateData.getRowCount();
  println("rowCount = " + rowCount);
  labelFont = loadFont("GillSans-Bold-18.vlw");
}

void draw() {
  background(palette[0]);
  textFont(labelFont);
  stroke(180);
  fill(180);
  textAlign(CENTER);

for (int i = -1; i < 8; i++) {
  line(i * 80 + 180, 20, i * 80 + 180, height - 30);
  text (i-2, i * 80 + 180, height - 10);
}

  smooth();
  noStroke();

  for (int row = 0; row < rowCount; row++) {
    // State names
    String state = stateData.getString(row, 0);
    
    // VGA
    float vga = (stateData.getFloat(row,  5) + 2) * 65 + 180;
    fill(palette[1], 160);
    ellipse(vga, height*.1, d, d);
    text("vga", 50, height*.1+5);
    if(dist(vga, height*.1, mouseX, mouseY) < (d/2+1)) {
      text(state, vga, height*.1 - 10);
    }
    
    // IPH
    float iph = (stateData.getFloat(row,  6) + 2) * 65 + 180;
    fill(palette[2], 160);
    ellipse(iph, height*.2, d, d);
    text("iph", 50, height*.2+5);
    if(dist(iph, height*.2, mouseX, mouseY) < (d/2+1)) {
      text(state, iph, height*.2 - 10);
    }
    
    // DAN
    float dan = (stateData.getFloat(row,  6) + 2) * 65 + 180;
    fill(palette[3], 160);
    ellipse(dan, height*.3, d, d);
    text("dan", 50, height*.3+5);
    if(dist(dan, height*.3, mouseX, mouseY) < (d/2+1)) {
      text(state, dan, height*.3 - 10);
    }
    
     // TCH
    float tch = (stateData.getFloat(row,  7) + 2) * 65 + 180;
    fill(palette[4], 160);
    ellipse(tch, height*.4, d, d);
    text("tch", 50, height*.4+5);
    if(dist(tch, height*.4, mouseX, mouseY) < (d/2+1)) {
      text(state, tch, height*.4 - 10);
    }
    
    // NFL
    float nfl = (stateData.getFloat(row,  9) + 2) * 65 + 180;
    fill(palette[5], 160);
    ellipse(nfl, height*.5, d, d);
    text("nfl", 50, height*.5+5);
    if(dist(nfl, height*.5, mouseX, mouseY) < (d/2+1)) {
      text(state, nfl, height*.5 - 10);
    }

    // NBA
    float nba = (stateData.getFloat(row, 10) + 2) * 65 + 180;
    fill(palette[6], 160);
    ellipse(nba, height*.6, d, d);
    text("nba", 50, height*.6+5);
    if(dist(nba, height*.6, mouseX, mouseY) < (d/2+1)) {
      text(state, nba, height*.6 - 10);
    }

    // MLB
    float mlb = (stateData.getFloat(row, 11) + 2) * 65 + 180;
    fill(palette[7], 160);
    ellipse(mlb, height*.7, d, d);
    text("mlb", 50, height*.7+5);
    if(dist(mlb, height*.7, mouseX, mouseY) < (d/2+1)) {
      text(state, mlb, height*.7 - 10);
    }

    // MLS
    float mls = (stateData.getFloat(row, 12) + 2) * 65 + 180;
    fill(palette[8], 160);
    ellipse(mls, height*.8, d, d);
    text("mls", 50, height*.8+5);
    if(dist(mls, height*.8, mouseX, mouseY) < (d/2+1)) {
      text(state, mls, height*.8 - 10);
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


