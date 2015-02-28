

//VARIABLES
PImage img; //iimage variable
Table eventTable; //declare table class

//variables for counting rows and columns
int rowCount;
int columnCount;

//variables for data points
String event;
float x;
float y;
int radius = 2;

int yearMin, yearMax; 

//array for years
int[] years; 

int yearInterval = 10;

//variable for our font
PFont plotFont; 

// plot variables
float plotX1, plotY1; 
float plotX2, plotY2; 


void setup( ) {

  size(952, 1200); 

  //LOAD BACKGROUND IMAGE
  img = loadImage("164.jpg");

  //LOAD FONT
  plotFont = loadFont("ApercuPro-12.vlw");

  // Make a data table from a file that contains
  // the time line you have created.
  //refer to the class table --> we called this eventTable
  //use the class table to organize our data in the file myLife
  eventTable = new Table("myLife.tsv"); 

  // The row count variable is declared globally (ie it can be seen by all the 
  //sections of the sketch), because we use it a lot.
  //This line fills the row count with the amount of rows by calling a function
  //called getRowCount(); from our object 'eventTable'. 
  
  rowCount = eventTable.getRowCount( );
  println(rowCount);

  // Define corners of the plotted time series 
  plotX1 = 570; 
  plotX2 = 880; 
  plotY1 = 490; 
  plotY2 = 490;
}

void draw( ) {
  //draw background and image with each loop of draw
  background(255);
  
  image(img, 0, 0);
  tint(90);
  // Drawing attributes for the ellipses.
  smooth( );
  fill(255,0,255);
  stroke(255);
  strokeWeight(1);

  // Loop through the rows of the timeline file and draw the points.
  for (int row = 0; row < rowCount; row++) {

    //fiill yearT with the value at (row, 1) - this value is returned by the function
    //getFloat from our object eventTable
    float yearT = eventTable.getFloat(row, 1); // column 1
   
    float age = eventTable.getFloat(row, 2); // column 2

      println(age);//check it is working
//gives an x value calculated for each year (yearT)
//take yearT which is in the range 1982-2014 and remap it to our range of
//pixel x values -> so this is pixel value plotX1 to value plotX2
    x = map(yearT, 1993, 2014, plotX1, plotX2); //map x

    ellipse(x, plotY1, 5, 5   ); //draw our data point

    //this calls the function below that draws our labels to the screen when 
    //the mouse passes over them
    drawevent(x, plotY1, row);
  }
}

void drawevent(float x, float y, int row) {
  //fill the variable event with the string returne by getString (from our obbject 
  // eventTable
  event = eventTable.getString(row, 0);

  //a conditional that defines the interactivity
  //if distance is less than (radius + 2) then execture the code below
  if (dist(x, y, mouseX, mouseY) < radius+2) {
    
    fill(255);
    textSize(25);
    textAlign(CENTER);
    // Show the string in event at the coordinates, x and y-10
    text(event, x, y-10);
  }
}
//TABLE CLASS
class Table {
  //two dimensional array that holds the data
  String[][] data;
  //variable for counting what row we are in
  int rowCount;
  
  //CONSTRUCTOR
  Table() {
    data = new String[10][10];
  }

  //FUNCTION CALLED TABLE THAT LOADS THE DATA FILE INTO A TABLE
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

//FUNCTION THAT RETURNS THE AMOUNT OF ROWS IN THE FILE
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
  
  //FUNTION THAT GETS ROW NAME - or whatever is in column 0
  String getRowName(int row) {
    return getString(row, 0);
  }

//FUNCTION THAT RETURNS A TABLE VALUE AS A STRING
//ARGUMENTS ARE ROW INDEX AND COLUMN NUMBER
  String getString(int rowIndex, int column) {
    return data[rowIndex][column];
  }

//FUNCTION THAT RETURNS A TABLE VALUE AS A STRING
//ARGUMENTS ARE ROW NAME AND COLUMN NUMBER
  String getString(String rowName, int column) {
    return getString(getRowIndex(rowName), column);
  }

  //FUNCTION THAT RETURNS A TABLE VALUE AS AN INT
  int getInt(String rowName, int column) {
    return parseInt(getString(rowName, column));
  }

  //FUNCTION THAT RETURNS A TABLE VALUE AS AN INT
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }

  //FUNCTION THAT RETURNS A TABLE VALUE AS AN FLOAT
  float getFloat(String rowName, int column) {
    return parseFloat(getString(rowName, column));
  }

  //FUNCTION THAT RETURNS A TABLE VALUE AS AN FLOAT
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


