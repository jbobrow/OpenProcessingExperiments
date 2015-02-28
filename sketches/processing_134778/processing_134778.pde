
FloatTable data; 
float dataMin, dataMax; 

float plotX1, plotY1; 
float plotX2, plotY2; 
float labelX, labelY; 

int rowCount; 
int columnCount; 
int currentColumn = 0;

int yearMin, yearMax; 
int [] years; 

int yearInterval = 1; 
int volumeInterval = 1;
int volumeIntervalMinor = 1; 

PFont plotFont; 

color[] blog = {#46BFAF, #F0816F, #EEE93C, #74C048, #F19E3F};
color[] palette = blog;

void setup () {
  size (720, 460); 
  
  data = new FloatTable ("TotalData_DS.tsv"); 
  
  rowCount = data.getRowCount (); 
  println ("rowCount = " + rowCount); 
  
//  function getTableColumnCount(table) {
//    var columnCount = 0;
//    var rows = table.rows;
//    if (rows.length > 0) {
//        var cells = rows[0].cells;
//        for (var i = 0, len = cells.length; i < len; ++i) {
//            columnCount += cells[i].colSpan;
//        }
//    }
//    return columnCount;
//}
  
  columnCount = data.getColumnCount (); 
  println ("columnCount = " + columnCount); 
  
  years = int(data.getRowNames ()); 
  yearMin = years [0]; 
  yearMax = years [years.length - 1]; 
  println ("years = " + yearMin + " — " + yearMax); 
  
  dataMin = 0; 
  println ("dataMin = " + dataMin); 
  dataMax = ceil(data.getTableMax () / volumeInterval) * volumeInterval; 
  println ("dataMax = " + dataMax); 
  
  //Corners of the plotted time series
  plotX1 = 50;
  plotX2 = width - 120;
  labelX = 50; 
  plotY1 = 60; 
  plotY2 = height - 70; 
  labelY = height - 25; 
  
  println ("labelY = " + labelY); 


plotFont = createFont("ProximaNova-Semibold", 20); 
textFont(plotFont); 


smooth (); 
}

void draw () {
  background (0);
  
  // Show the plot area as a gray box
  fill (35); 
  rectMode (CORNERS); 
  noStroke (); 
  rect (plotX1, plotY1, plotX2, plotY2); 
  
  drawTitle (); 
  drawAxisLabels (); 
  
  drawYearLabels (); 
//  drawVolumeLabels (); 
  
  // draw key
  textAlign (LEFT);
  fill (palette[2]); 
  rect (615, 90, 625, 100);
  text ("Black", 635, 100);
  fill (palette[4]); 
  rect (615, 120, 625, 130);
  text ("Hispanic", 635, 130);
  fill (255); 
  rect (615, 150, 625, 160);
  text ("All Civilians", 635, 160);
  fill (palette[1]); 
  rect (615, 180, 625, 190);
  text ("White", 635, 190);
  fill (palette[3]); 
  rect (615, 210, 625, 220);
text ("Asian", 635, 220);
  
  stroke (255); 
  noFill (); 

  strokeWeight (2); 
//  drawDataPoints (currentColumn); 
//drawDataLine (currentColumn);
drawDataLine (0);
stroke (palette[1]);
drawDataLine (1);
stroke (palette[2]);
drawDataLine (2);
stroke (palette[3]);
drawDataLine (3);
stroke (palette[4]);
drawDataLine (4);

//drawDataHighlight (currentColumn);
stroke (255);
drawDataHighlight (0);
stroke (palette[1]);
drawDataHighlight (1);
stroke (palette[2]);
drawDataHighlight (2);
stroke (palette[3]);
drawDataHighlight (3);
stroke (palette[4]);
drawDataHighlight (4);

}

void drawTitle (){
  fill (255); 
  textSize (20); 
  textAlign (LEFT); 
//  String title = data.getColumnName (currentColumn); 
  text ("Unemployment by Demographic", plotX1, plotY1 - 20); 
}

void drawAxisLabels () {
  fill (255); 
  textSize (13); 
  textLeading (15); 
  
//  textAlign (CENTER, CENTER); 
//  // Use \n (aka enter or linefeed) to break the text into separate lines
//  text ("Unemployment\nby percentage\nof population", labelX, (plotY1 + plotY2)/2); 
  textAlign (CENTER); 
  text ("Year", (plotX1 + plotX2)/2, labelY);
}

void drawYearLabels () {
  fill (255); 
  textSize (10); 
  textAlign (CENTER, TOP); 
  
  // Use thin, gray lines to draw the grid
  stroke (0); 
  strokeWeight (1); 
  
  for (int row = 0; row < rowCount; row++) {
    if (years[row] % yearInterval == 0) {
      float x = map(years[row], yearMin, yearMax, plotX1, plotX2); 
      text (years[row], x, plotY2 + 10); 
      line (x, plotY1, x, plotY2); 
    }
}
}


void drawDataLine (int col) {
  beginShape (); 
  int rowCount = data.getRowCount (); 
  for (int row = 0; row < rowCount; row++) {
    if (data.isValid (row, col)) {
      float value = data.getFloat (row, col); 
      float x = map (years[row], yearMin, yearMax, plotX1, plotX2); 
      float y = map (value, dataMin, dataMax, plotY2, plotY1); 
      vertex (x, y);
    }
  }
  endShape (); 
}


void drawDataHighlight (int col) {
  for (int row = 0; row < rowCount; row++) {
    if (data.isValid (row, col)) {
      float value = data.getFloat (row, col); 
      float x = map(years[row], yearMin, yearMax, plotX1, plotX2); 
      float y = map(value, dataMin, dataMax, plotY2, plotY1); 
      if (dist(mouseX, mouseY, x, y) < 8) {
        
        strokeWeight (2); 
        fill (0); 
        ellipse (x, y, 10, 10); 
        
        // draw bg
        fill(255);
        noStroke();
        rectMode(CORNER); // note: this is the default mode. confusing b/c similar to CORNERS (plural)
        rect(x - 46, y - 30, 40, 25);
    
        fill(0);
        textSize (12); 
        textAlign (CENTER); 
        text (nf(value, 0, 2) + "%", x-26, y-15); 
      }
    }
  }
}

// first line of the file should be the column headers
// first column should be the row titles
// all other values are expected to be floats
// getFloat(0, 0) returns the first data value in the upper lefthand corner
// files should be saved as "text, tab-delimited"
// empty rows are ignored
// extra whitespace is ignored


class FloatTable {
  int rowCount;
  int columnCount;
  float[][] data;
  String[] rowNames;
  String[] columnNames;
  
  
  FloatTable(String filename) {
    String[] rows = loadStrings(filename);
    
    String[] columns = split(rows[0], TAB);
    columnNames = subset(columns, 1); // upper-left corner ignored
    scrubQuotes(columnNames);
    columnCount = columnNames.length;

    rowNames = new String[rows.length-1];
    data = new float[rows.length-1][];

    // start reading at row 1, because the first row was only the column headers
    for (int i = 1; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
      }
      if (rows[i].startsWith("#")) {
        continue;  // skip comment lines
      }

      // split the row on the tabs
      String[] pieces = split(rows[i], TAB);
      scrubQuotes(pieces);
      
      // copy row title
      rowNames[rowCount] = pieces[0];
      // copy data into the table starting at pieces[1]
      data[rowCount] = parseFloat(subset(pieces, 1));

      // increment the number of valid rows found so far
      rowCount++;      
    }
    // resize the 'data' array as necessary
    data = (float[][]) subset(data, 0, rowCount);
  }
  
  
  void scrubQuotes(String[] array) {
    for (int i = 0; i < array.length; i++) {
      if (array[i].length() > 2) {
        // remove quotes at start and end, if present
        if (array[i].startsWith("\"") && array[i].endsWith("\"")) {
          array[i] = array[i].substring(1, array[i].length() - 1);
        }
      }
      // make double quotes into single quotes
      array[i] = array[i].replaceAll("\"\"", "\"");
    }
  }
  
  
  int getRowCount() {
    return rowCount;
  }
  
  
  String getRowName(int rowIndex) {
    return rowNames[rowIndex];
  }
  
  
  String[] getRowNames() {
    return rowNames;
  }

  
  // Find a row by its name, returns -1 if no row found. 
  // This will return the index of the first row with this name.
  // A more efficient version of this function would put row names
  // into a Hashtable (or HashMap) that would map to an integer for the row.
  int getRowIndex(String name) {
    for (int i = 0; i < rowCount; i++) {
      if (rowNames[i].equals(name)) {
        return i;
      }
    }
    //println("No row named '" + name + "' was found");
    return -1;
  }
  
  
  // technically, this only returns the number of columns 
  // in the very first row (which will be most accurate)
  int getColumnCount() {
    return columnCount;
  }
  
  
  String getColumnName(int colIndex) {
    return columnNames[colIndex];
  }
  
  
  String[] getColumnNames() {
    return columnNames;
  }


  float getFloat(int rowIndex, int col) {
    // Remove the 'training wheels' section for greater efficiency
    // It's included here to provide more useful error messages
    
    // begin training wheels
    if ((rowIndex < 0) || (rowIndex >= data.length)) {
      throw new RuntimeException("There is no row " + rowIndex);
    }
    if ((col < 0) || (col >= data[rowIndex].length)) {
      throw new RuntimeException("Row " + rowIndex + " does not have a column " + col);
    }
    // end training wheels
    
    return data[rowIndex][col];
  }
  
  
  boolean isValid(int row, int col) {
    if (row < 0) return false;
    if (row >= rowCount) return false;
    //if (col >= columnCount) return false;
    if (col >= data[row].length) return false;
    if (col < 0) return false;
    return !Float.isNaN(data[row][col]);
  }
  
  
  float getColumnMin(int col) {
    float m = Float.MAX_VALUE;
    for (int i = 0; i < rowCount; i++) {
      if (!Float.isNaN(data[i][col])) {
        if (data[i][col] < m) {
          m = data[i][col];
        }
      }
    }
    return m;
  }

  
  float getColumnMax(int col) {
    float m = -Float.MAX_VALUE;
    for (int i = 0; i < rowCount; i++) {
      if (isValid(i, col)) {
        if (data[i][col] > m) {
          m = data[i][col];
        }
      }
    }
    return m;
  }

  
  float getRowMin(int row) {
    float m = Float.MAX_VALUE;
    for (int i = 0; i < columnCount; i++) {
      if (isValid(row, i)) {
        if (data[row][i] < m) {
          m = data[row][i];
        }
      }
    }
    return m;
  } 

  
  float getRowMax(int row) {
    float m = -Float.MAX_VALUE;
    for (int i = 1; i < columnCount; i++) {
      if (!Float.isNaN(data[row][i])) {
        if (data[row][i] > m) {
          m = data[row][i];
        }
      }
    }
    return m;
  }
  
  
  float getTableMin() {
    float m = Float.MAX_VALUE;
    for (int i = 0; i < rowCount; i++) {
      for (int j = 0; j < columnCount; j++) {
        if (isValid(i, j)) {
          if (data[i][j] < m) {
            m = data[i][j];
          }
        }
      }
    }
    return m;
  }

  
  float getTableMax() {
    float m = -Float.MAX_VALUE;
    for (int i = 0; i < rowCount; i++) {
      for (int j = 0; j < columnCount; j++) {
        if (isValid(i, j)) {
          if (data[i][j] > m) {
            m = data[i][j];
          }
        }
      }
    }
    return m;
  }
}


