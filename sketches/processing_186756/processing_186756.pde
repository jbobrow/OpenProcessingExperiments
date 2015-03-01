
/*
** Cyclist Count by Year At Selected Commuter Locations
 ** data from:
 ** https://data.cityofnewyork.us/d/m6ar-24vj?category=Transportation&view_name=Cyclist-Count-by-Year-At-Selected-Commuter-Locatio
 ** your task: create a unique data visualization.
 ** for more information on working with data in Processing, see: https://processing.org/tutorials/data/
 */

String[] headers;
int[][] data; 

void setup() {
  size(900, 500);
  // load csv file into String array
  String [] lines = loadStrings("Cyclist_Count_by_Year_At_Selected_Commuter_Locations.csv");

  //split the first line into an array and load it into our global headers array
  headers = split(lines[0], ",");

  //create a temporary 2D String array.
  //we'll think of it as a 28 row x 9 column matrix
  String[][] tempData = new String[lines.length-1][headers.length];

  //Curious to see how many rows and columns we're loading into our tempData?
  //uncomment this line below.
  println( lines.length-1 + " rows by " + headers.length + " cols.");

  //loop through each of the subsequent lines after the header row and
  //assign each to the row index of our tempData matrix 
  for (int i = 1; i < lines.length; i++) {
    tempData[i-1] = split(lines[i], ",");//assigns an array to each temData row
  }

  //construct our global data matrix.
  //we can also think of this as a 28 row x 9 col matrix
  data = new int[tempData.length][tempData[0].length];

  //loop through each of the rows and columns of our tempData matrix.
  //a.k.a. nested for loops.
  for (int i = 0; i < tempData.length; i++) { //for each row
    for (int j = 0; j < tempData[i].length; j++) { //and for each col

      /*
      * since our raw data has "" (quotes) around each entry,
       * we need a way to remove them.  Let's use the handy split() method.
       * The delimiter is a " (double quotes) but we need to escape it using a forward slash.
       * for more info on escape characters in Java see:
       * http://stackoverflow.com/questions/1367322/what-are-all-the-escape-characters-in-java
       * example: split(""1024"", "\"") becomes --> {"", "1024", ""}  
       */
      String[] tempCellValue = split(tempData[i][j], "\"");
      // our middle entry contains the data, so we write tempCellValue[1]
      // handle our blank data OR data containing "N/A" by replacing with 0s 
      if (tempCellValue[1].equals("") || tempCellValue[1].equals("N/A")) {
        data[i][j] = 0;
      } else {
        data[i][j] = Integer.parseInt(tempCellValue[1]);
      }
    }
  }
}
void draw() {
  background(0);

  // draw something awesome with the data matrix and headers array
  // to access individual data cells all you have to do is call data[row][col],
  // where row is an int row number, and col is an int column number

  //declare y position variable that will move up 2 pixels everytime
  int yposition=height;

  //create loops that plots circles. 
  //The diameter of the circles will be 1/50th of 
  //the corresponding data cell  



  //for staten island
  for (int i = 1; i < 28; i++) {
    for (int j = 0; j < 9; j++) {
      noStroke();

      //Color of the circles will change slightly as years increase
      fill(((data[i][0])-1970)*5, 100, 200, 50);
      ellipseMode(CENTER);

      //Slight randomization to position to add some movement to vizuation
      ellipse (random(5, 10), yposition +(random(0-2)-1), data[i][1]/50, data[i][1]/50);
      yposition=yposition-2;
    }
  }

  //Display roll over text 


  if (mouseX<15) {
    float x = 30;
    float y = 150;
    textAlign(CENTER, BOTTOM);

    pushMatrix();
    translate(x, y);
    rotate(-HALF_PI);
    textSize(16);
    fill(255);
    text("Staten Island", -100, 10);
    popMatrix();
  }

  //for brooklyn bridge
  yposition=height;
  for (int i = 1; i < 28; i++) {
    for (int j = 0; j < 9; j++) {
      noStroke();
      fill(100, 200, ((data[i][0])-1970)*5, 50);
      ellipseMode(CENTER);
      ellipse (random(105, 110), yposition+(random(0-2)-1), data[i][2]/50, data[i][2]/50);
      yposition=yposition-2;
    }
  }

  if (mouseX>90 && mouseX<125) {
    float x = 30;
    float y = 150;
    textAlign(CENTER, BOTTOM);

    pushMatrix();
    translate(x, y);
    rotate(-HALF_PI);
    textSize(16);
    fill(255);
    text("Brooklyn Bridge", -100, 120);
    popMatrix();
  }

  //For Manhattan Bridge

  yposition=height;
  for (int i = 1; i < 28; i++) {
    for (int j = 0; j < 9; j++) {
      noStroke();
      fill(100, 0, ((data[i][0])-1970)*5, 200);
      ellipseMode(CENTER);
      ellipse (random(205, 210), yposition+(random(0-2)-1), data[i][3]/50, data[i][3]/50);
      yposition=yposition-2;
    }
  }

  if (mouseX>195 && mouseX<225) {
    float x = 30;
    float y = 150;
    textAlign(CENTER, BOTTOM);

    pushMatrix();
    translate(x, y);
    rotate(-HALF_PI);
    textSize(16);
    fill(255);
    text("Manhattan Bridge", -100, 220);
    popMatrix();
  }


  //For Williamsburg Bridge
  yposition=height;
  for (int i = 1; i < 28; i++) {
    for (int j = 0; j < 9; j++) {
      noStroke();
      fill(200, 100, ((data[i][0])-1970)*5, 50);
      ellipseMode(CENTER);
      ellipse (random(305, 310), yposition+(random(0-2)-1), data[i][4]/50, data[i][4]/50);
      yposition=yposition-2;
    }
  }


  if (mouseX>295 && mouseX<325) {
    float x = 30;
    float y = 150;
    textAlign(CENTER, BOTTOM);

    pushMatrix();
    translate(x, y);
    rotate(-HALF_PI);
    textSize(16);
    fill(255);
    text("Williamsburg Bridge", -100, 320);
    popMatrix();
  }

  //Queensboro Bridge
  yposition=height;
  for (int i = 1; i < 28; i++) {
    for (int j = 0; j < 9; j++) {
      noStroke();
      fill(200, ((data[i][0])-1970)*5, 100, 50);
      ellipseMode(CENTER);
      ellipse (random(405, 410), yposition+(random(0-2)-1), data[i][5]/50, data[i][5]/50);
      yposition=yposition-2;
    }
  }

  if (mouseX>395 && mouseX<425) {
    float x = 30;
    float y = 150;
    textAlign(CENTER, BOTTOM);

    pushMatrix();
    translate(x, y);
    rotate(-HALF_PI);
    textSize(16);
    fill(255);
    text("Queensboro Bridge", -100, 420);
    popMatrix();
  }
  //Hudson River Greenway at 50th
  yposition=height;
  for (int i = 1; i < 28; i++) {
    for (int j = 0; j < 9; j++) {
      noStroke();
      fill(50, 255, ((data[i][0])-1970)*5, 50);
      ellipseMode(CENTER);
      ellipse (random(505, 510), yposition+(random(0-2)-1), data[i][6]/50, data[i][6]/50);
      yposition=yposition-2;
    }
  }

  if (mouseX>495 && mouseX<525) {
    float x = 30;
    float y = 150;
    textAlign(CENTER, BOTTOM);

    pushMatrix();
    translate(x, y);
    rotate(-HALF_PI);
    textSize(16);
    fill(255);
    text("Hudson River Greenway at 50th St.", -100, 530);
    popMatrix();
  }

  //9th through 12th Ave. at 50th St.
  yposition=height;
  for (int i = 1; i < 28; i++) {
    for (int j = 0; j < 9; j++) {
      noStroke();
      fill(50, ((data[i][0])-1970)*5, 255, 50);
      ellipseMode(CENTER);
      ellipse (random(605, 610), yposition+(random(0-2)-1), data[i][7]/50, data[i][7]/50);
      yposition=yposition-2;
    }
  }

  if (mouseX>595 && mouseX<625) {
    float x = 30;
    float y = 150;
    textAlign(CENTER, BOTTOM);

    pushMatrix();
    translate(x, y);
    rotate(-HALF_PI);
    textSize(16);
    fill(255);
    text("9th through 12th Ave. at 50th St.", -100, 620);
    popMatrix();
  }

  yposition=height;
  for (int i = 1; i < 28; i++) {
    for (int j = 0; j < 9; j++) {
      noStroke();
      fill(175, ((data[i][0])-1970)*5, 255, 50);
      ellipseMode(CENTER);
      ellipse (random(805, 810), yposition+(random(0-2)-1), data[i][8]/50, data[i][8]/50);
      yposition=yposition-2;
    }
  }
  if (mouseX>795 && mouseX<825) {
    float x = 30;
    float y = 150;
    textAlign(CENTER, BOTTOM);

    pushMatrix();
    translate(x, y);
    rotate(-HALF_PI);
    textSize(20);
    fill(0);
    text("Totals", -100, 800);
    popMatrix();
  }
}



