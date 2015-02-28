
// Ex11_03

color[] sea = {#D3BB86, #007DFF, #BA3D49, #DAFF39, #E2E1DC};
color[] palette = sea;
PFont titleFont, labelFont;
int startLine;
int xStart;

Table seaData;
int rowCount;
float mx = 29; // mouseX

void setup() {
  size(2500, 400);
  seaData = new Table("sea level2.txt");
  rowCount = seaData.getRowCount();
  println("rowCount = " + rowCount);
  titleFont = loadFont("GillSans-Bold-18.vlw");
  labelFont = loadFont("GillSans-12.vlw");
  startLine = 300;
  xStart = 20;
  smooth();
}

void draw() {
  noCursor();
  background(palette[0]);
  textFont(titleFont);
  stroke(palette[3]);
  fill(palette[3]);
  textAlign(CENTER);
  text("Sea Level Changes Between 1992 to 2013", width/2, 20);
  
  textFont(labelFont);
  textAlign(LEFT);

  // Read level
  for (int row = 0; row < rowCount; row++) {
    
    // sea level data
    String dates = seaData.getString(row, 0);
    float level = seaData.getFloat(row, 1);
    float x = map(row, 0, 727, xStart, width-xStart);
    float y = map(level, 70,-15, xStart, height);
//    println(nfp(level, 1, 3) + " : " + nf(y, 3, 2));
//    noLoop();
    
    // Slicing interaction for dates and values
    // Placed here so it goes behind the data lines
    strokeWeight(1);
//    strokeWeight(5);
    if((mx > xStart) && (mx < width-xStart)) {
      line(mx, 30, mx, startLine);
      if(abs(mx - x) < 2) {
        fill(palette[1]);
        text(dates, mx + 6, 40);
        text(nfp(level, -15, 70), mx + 6, 55);
      }
    }  
    
    // Lines and dots
    stroke(palette[1]);
    line(x, y, x, startLine);

    noStroke();
    fill(palette[1]);
    int d = 3;
    ellipse(x, y, d, d);
  }
  
  // Read dates
  for (int row = 0; row < rowCount; row += 12) {
    String dates = seaData.getString(row, 0);
    float level = seaData.getFloat(row, 1);
    float x = map(row, 0, 727, xStart, width-xStart);
    float y = map(level, 70,-15, xStart, height);
    

      
    // Lines and dots for January
    stroke(palette[1]);
    strokeWeight(3);
    strokeCap(SQUARE);
    line(x, y, x, startLine);
    noStroke();
  }
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      mx -= 1;
    } else if (keyCode == RIGHT) {
      mx += 1;
    }
  }
}

void mouseMoved() {
  mx = mouseX;
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
      String[] pieces = split(rows[i]," ");
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


