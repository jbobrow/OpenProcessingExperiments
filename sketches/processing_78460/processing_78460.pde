
//-----Loads Points to the Map with Values-----


     Table locationTable; //reads each locations coordinates (x and y values) and puts into a table
     Table nameTable; //var for state names table
     
     int rowCount; //row count is stored globally b/c is used often
     Table dataTable;
     
     float dataMin = MAX_FLOAT; //a built-in value for the maximum possible float value, ensures that dataMin will be replaced with the first value found in the table
     float dataMax = MIN_FLOAT; //same is done for dataMax, by setting it to MIN_FLOAT
     
     int Y_AXIS = 1;
     int X_AXIS = 2;
     color b1, b2, c1, c2;

     
void setup() {
      size(740, 500);

      locationTable = new Table("locations.tsv"); //reads a file as a grid of rows and columns
      nameTable = new Table("names.tsv"); //state names table

      PFont font = loadFont("HelveticaNeue-Light-12.vlw");
      textFont(font);

rowCount = locationTable.getRowCount();
       // Read the data table.
       dataTable = new Table("random.tsv");
       // Find the minimum and maximum values.
       for (int row = 0; row < rowCount; row++) { //using a for loop to go through each line of data in the table and determine largest and smallest amount of data
         float value = dataTable.getFloat(row, 1);
         if (value > dataMax) {
           dataMax = value;
         }
         if (value < dataMin) {
           dataMin = value;
    } 
  }
  
    // Gradient
      c1 = color(103, 252, 5); //green
      c2 = color(252, 46, 5); //red
//      noLoop();
}

void draw() { 
  background(255);
 

  // Gradient
  setGradient(-1, -1, 741, 501, c1, c2, Y_AXIS);

  
  //drawing attributes for the ellipses
  smooth( ); 
  fill(192, 0, 0); 
  noStroke( );
  
  for (int row = 0; row < rowCount; row++) { //loops through the rows of the locaitons file and draw the points
        String abbrev = dataTable.getRowName(row);
        float x = locationTable.getFloat(abbrev, 1); //reads each location's corridinates (x and y values)
        float y = locationTable.getFloat(abbrev, 2);
        drawData(x, y, abbrev);
  }
  

  
}


   void drawData(float x, float y, String abbrev) {
       float value = dataTable.getFloat(abbrev, 1);
       float radius = 0;
       if (value >= 0) {
         radius = map(value, 0, dataMax, 15, 50); //adjust the diameter of the ellipse here 
         fill(#000000);  // blue
       } else {
         radius = map(value, 0, dataMin, 1.5, 15);
         fill(#FF4422);  // red
       }
       
       ellipseMode(RADIUS);
       ellipse(x, y, radius, radius);
       if (dist(x, y, mouseX, mouseY) < radius+2) {
         fill(0);
         textAlign(CENTER);  
  
       //option for showing full state names
         String name = nameTable.getString(abbrev, 1);
         text(name + " " + value, x, y-radius-4);
         
         //option for showing abbreviated state names
         //text(value + " (" + abbrev + ")", x, y-radius-4);
         
//         data (value) with the state abbreviation (abbrev), x and y position of the text, 
//         vertical location which is the y- coordinate at the center of the circle, minus 
//         the radius to get to the edge of the cir- cle, minus four more pixels
  } 
}

  // Gradient
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
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


