
Table data;
float [] date;
float [] interestBOE;
float [] interestFED;
float [] interestECB;
float [] CPIBOE;
float [] CPIFED;
float [] CPIECB;
float [] unemploymentBOE;
float [] unemploymentFED;
float [] unemploymentECB;
int n, x;
color[] palette = {
  #FF8E00, #1921B1, #00B25C
};

int wide = 400;           // Width of window
int high = 400;            // Height of window
float border = 20;         // Size of border
float lb = border;         // Left border
float rb = wide - border;  // Right border
float bb = high - border;  // Bottom border
float tb = border;         // Top borders

float gw = rb - lb;        // Grid width
float gh = bb - tb;        // Grid height


void setup() {
  size (400, 400);
  n=96;
  data = new Table ("data.tsv"); 
  date = new float [n];
  interestBOE = new float [n];
  interestFED = new float [n];
  interestECB = new float [n];
  CPIBOE = new float [n];
  CPIFED = new float [n];
  CPIECB = new float [n];
  unemploymentBOE = new float [n];
  unemploymentFED = new float [n];
  unemploymentECB = new float [n];
  x = 1;
}

void draw() {
  background(50);
  loadData();
  drawData();
  frame();
  xAxis("CPI", lb, bb, rb);
  yAxis("Central Bank Rate", lb, bb, tb);
}

void loadData() {
  // load data from data.tsv


  for (int i = 0; i<n; i++) {
    date[i] = data.getFloat(i, 0);
  } 

  for (int i = 0; i<n; i++) {
    interestBOE[i] = map(data.getFloat(i, 1), 0, 6, 380, 20);
  } 

  for (int i = 0; i<n; i++) {
    interestFED[i] = map(data.getFloat(i, 2), 0, 6, 380, 20);
  } 

  for (int i = 0; i<n; i++) {
    interestECB[i] = map(data.getFloat(i, 3), 0, 6, 380, 20);
  } 

  for (int i = 0; i<n; i++) {
    CPIBOE[i] = map(data.getFloat(i, 4), -3, 6, 20, 380);
  } 

  for (int i = 0; i<n; i++) {
    CPIFED[i] = map(data.getFloat(i, 5), -3, 6, 20, 380);
  } 

  for (int i = 0; i<n; i++) {
    CPIECB[i] = map(data.getFloat(i, 6), -3, 6, 20, 380);
  } 

  for (int i = 0; i<n; i++) {
    unemploymentBOE[i] = map(data.getFloat(i, 7), 4, 10, 20, 380);
  } 

  for (int i = 0; i<n; i++) {
    unemploymentFED[i] = map(data.getFloat(i, 8), 4, 10, 20, 380);
  } 

  for (int i = 0; i<n; i++) {
    unemploymentECB[i] = map(data.getFloat(i, 9), 4, 10, 20, 380);
  }
}

void drawData() {

  x = (int)map(mouseX, 0, 400, 1, 96);
  noStroke();
  fill(palette[2]);
  ellipse(CPIECB[x], interestECB[x], 55, 55);

  fill(palette[1]);
  ellipse(CPIFED[x], interestFED[x], 50, 50);

  fill(palette[0]);
  ellipse(CPIBOE[x], interestBOE[x], 20, 20);

  // draw date
  fill(150);
  textSize(16);
  text(data.getString(x, 0), 350, 50);
}

void frame () {
  noStroke();
  fill(50);
  rect(0, 0, width, border);    // Top mask
  rect(0, bb, width, border);   // Bottom mask
  rect(0, 0, border, height);   // Left mask
  rect(rb, 0, border, height);  // Right mask
}
void xAxis (String axisTitle, float xl, float y, float xr) {
  stroke(250);
  strokeWeight(1);
  line(xl, y, xr, y);

  fill(250);
  textSize(10);
  textAlign(CENTER, CENTER);
  text(axisTitle, width/2, bb + 10);
}

void yAxis (String axisTitle, float x, float yb, float yt) {
  stroke(250);
  strokeWeight(2);
  line(x, yb, x, yt);

  fill(250);
  textAlign(RIGHT, CENTER);
  text(axisTitle, lb -5, height/2);
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


