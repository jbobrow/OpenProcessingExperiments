
PImage smiley; 
PImage unhappy; 
PImage straight; 
PImage straight2;
PImage natl; 
PImage mapImage; 
PImage nothing; 
Table locationTable; 
int rowCount; 
Table dataTable;
Table nameTable;
//float dataMin = MAX_FLOAT;
//float dataMax = MIN_FLOAT;
float dataMin = -10;
float dataMax = 10;
PFont font;
int a = 0;
String s = "The Gallup-Healthways Well-Being index score is an average of six sub-indexes, which individually examine life evaluation, emotional health, physical health, healthy behavior, work environment, and access to basic necessities";
String st = "1=2008     2=2009     3=2010     4=2011     5=2012";

void setup( ) { 
  size(975, 500);
  smiley = loadImage("Smiley_Face.png"); 
  unhappy = loadImage("unhappy.png"); 
  straight = loadImage("straightface.png"); 
  straight2 = loadImage("straightface2.png"); 
  natl = loadImage("intro.png"); 
  mapImage = loadImage("map2.png");
  nothing = loadImage("nothing.png"); 

  font = loadFont("ArialMT-18.vlw");

  locationTable = new Table("locations.tsv"); 
  rowCount = locationTable.getRowCount( );
  dataTable = new Table("wellbeingblank.tsv");  // READ THE DATA TABLE.
  nameTable = new Table("names.tsv"); 

  //find the minimum and maximum values.
  for (int row = 0; row < rowCount; row++) { 
    float value = dataTable.getFloat(row, 1); 
    if (value > dataMax) { 
      dataMax = value;
    } 
    if (value < dataMin) { 
      dataMin = value;
    }
  }
}

// Global variables set in drawData( ) and read in draw( )
float closestDist; 
String closestText; 
float closestTextX; 
float closestTextY; 

void draw( ) { 
  background(240, 248, 255); 
  image(mapImage, 0, 0); 

  textAlign(LEFT);
  textFont(font, 14);
  fill(182, 0, 0);
  text(st, 620, 425, 600, 750);  

  textAlign(LEFT);
  textFont(font, 14);
  fill(79, 129, 189);
  text(s, 20, 445, 700, 850);  

  textAlign(CENTER);
  textFont(font, 22);
  fill(79, 129, 189);

  if (a==0) {
    text("WELL BEING", 487.5, 30);
  } 
  else {
    text("WELL BEING "+a, 487.5, 30);
  }

  closestDist = MAX_FLOAT; 
  for (int row = 0; row < rowCount; row++) { 
    String abbrev = dataTable.getRowName(row); 
    float x = locationTable.getFloat(abbrev, 1); //column 1
    float y = locationTable.getFloat(abbrev, 2); //column 2
    fill(0, 51, 102);
    drawData(x, y, abbrev);
    image(natl, width/2+180, 80);
    // image(straight2, width/2+225, 295);

    image(smiley, width/2+170, 30, 45, 45);
    image(straight2, width/2+270, 30, 45, 45);
    image(unhappy, width/2+370, 30, 45, 45);
  } 

  // Use global variables set in drawData( ) 
  // to draw text related to closest circle. 
  if (closestDist != MAX_FLOAT) { 
    fill(204, 0, 0);
    textAlign(CENTER); 
    text(closestText, closestTextX, closestTextY);
  }
} 

void drawData(float x, float y, String abbrev) { 
  float value = dataTable.getFloat(abbrev, 1); 
  float radius = 0; 
  float size = 0; 
  if (value >= 8) { 
    size = map(value, 0, dataMax, 1, 20); 
    image(smiley, x-20, y-10, 20+size, 20+size);
    // noStroke();
    // fill(255, 255, 0, 0); // yellow
  } 
  else if (value >= 6) {
    size = map(value, 0, dataMax, 1, 20); 
    image(straight2, x-10, y-10, 10+size, 10+size);
    //radius = map(value, 0, dataMax, 1, 15); 
    // stroke(51, 255, 51);
    // fill(0, 204, 0); // green
  }
  else if (value > 0) {
    size = map(value, 0, dataMax, 0, 20); 
    image(unhappy, x-10, y-10, 7+size, 7+size);
    //  radius = map(value, 0, dataMin, 1.5, 15); 
    // stroke(0);
    // fill(#FF0000); // red
  }
  else if (value == 0) {
    //image(nothing, x, y, 0, 0);
    size=0;
    image(nothing, x-10, y-10, size, size);
  } 

  ellipseMode(RADIUS); 
  ellipse(x, y, radius, radius);
  float d = dist(x, y, mouseX, mouseY); 
  // Because the following check is done each time a new 
  // circle is drawn, we end up with the values of the 
  // circle closest to the mouse. 
  if ((d < radius + 10) && (d < closestDist)) { 
    closestDist = d; 
    textSize(16);

    textFont(font, 16);
    fill(255, 69, 0);
    String name = nameTable.getString(abbrev, 1); 
    closestText = name + " " + nf(value+60, 0, 2); 
    closestTextX = x+10; 
    closestTextY = y-radius-15;
  }
}

void keyPressed( ) { 
  if (key == '1') { 
    updateTable1();
    a= 2008;
    natl = loadImage("ntl_2008.png");

  }
  if (key == '2') { 
    updateTable2();
    a= 2009;
    natl = loadImage("ntl_2009.png");
  }
  if (key == '3') { 
    updateTable3();
    a= 2010;
    natl = loadImage("ntl_2010.png");
  }
  if (key == '4') { 
    updateTable4();
    a= 2011;
    natl = loadImage("ntl_2011.png");
  }
  if (key == '5') { 
    updateTable5();
    a= 2012;
    natl = loadImage("ntl_2012.png");
  }
}

void updateTable1() { 
  dataTable = new Table("wellbeing2008.tsv");
}

void updateTable2() { 
  dataTable = new Table("wellbeing2009.tsv");
}

void updateTable3() { 
  dataTable = new Table("wellbeing2010.tsv");
}

void updateTable4() { 
  dataTable = new Table("wellbeing2011.tsv");
}

void updateTable5() { 
  dataTable = new Table("wellbeing2012.tsv");
}

class Table {
  String[][] data;
  int rowCount;
  
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



