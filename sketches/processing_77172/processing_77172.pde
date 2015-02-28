
String[] data;
String[] dataLine; //for breaking it down
String[][] fullData;
int[][][] buildings = new int[155][9][2]; //

////////////
//Get the data and format it, so we can use it for drawing
////////////

data = loadStrings("data.txt"); //gets the raw data in CVS format
  dataLine = splitTokens(data[1], ","); 
  fullData = new String[data.length][dataLine.length];

  //split the individual lines where the comma is
  for (int i =0 ; i < data.length; i++) {
    dataLine = splitTokens(data[i], ",");
    for (int j =0 ; j < dataLine.length; j++) {
      fullData[i][j] = dataLine[j];
    }
  }

  //create the erray which we will use for drawing (this array stores year numbers and corresponding instances)
  for (int j = 0; j < 9; j++) {
    for (int i =0 ; i < buildings.length; i++) {
      buildings[i][j][0] = i + 1854;
      buildings[i][j][1] = 0;
    }
  }
  //count frequencies (this should actually be done with two for-loops instead of one, but I am lazy
  for (int i =0 ; i < data.length; i++) {
    if (int(fullData[i][1]) == 1) {
      buildings[(int(fullData[i][2]) - 1854)][0][1] = 1+ buildings[(int(fullData[i][2]) - 1854)][0][1] ;
    }
    if (int(fullData[i][1]) == 2) {
      buildings[(int(fullData[i][2]) - 1854)][1][1] = 1+ buildings[(int(fullData[i][2]) - 1854)][1][1] ;
    }
    if (int(fullData[i][1]) == 3) {
      buildings[(int(fullData[i][2]) - 1854)][2][1] = 1+ buildings[(int(fullData[i][2]) - 1854)][2][1] ;
    }
    if (int(fullData[i][1]) == 4) {
      buildings[(int(fullData[i][2]) - 1854)][3][1] = 1+ buildings[(int(fullData[i][2]) - 1854)][3][1] ;
    }
    if (int(fullData[i][1]) == 5) {
      buildings[(int(fullData[i][2]) - 1854)][4][1] = 1+ buildings[(int(fullData[i][2]) - 1854)][4][1] ;
    }
    if (int(fullData[i][1]) == 6) {
      buildings[(int(fullData[i][2]) - 1854)][5][1] = 1+ buildings[(int(fullData[i][2]) - 1854)][5][1] ;
    }
    if (int(fullData[i][1]) == 7) {
      buildings[(int(fullData[i][2]) - 1854)][6][1] = 1+ buildings[(int(fullData[i][2]) - 1854)][6][1] ;
    }
    if (int(fullData[i][1]) == 8) {
      buildings[(int(fullData[i][2]) - 1854)][7][1] = 1+ buildings[(int(fullData[i][2]) - 1854)][7][1] ;
    }
    if (int(fullData[i][1]) == 9) {
      buildings[(int(fullData[i][2]) - 1854)][8][1] = 1+ buildings[(int(fullData[i][2]) - 1854)][8][1] ;
    }
  }

////////////
//draw the graph
////////////
  background(0);
  strokeWeight(1);
  size (1200, 700);
  float spacing = width/float(buildings.length+1);
  translate(50, 50);
  scale(0.9, 0.9);
  
  text("nõmme hoonetele antud väärtushinnagute sagedus ehitusaastate järgi", 20, -15);
  text("graph by paul strohmeier & johanna rannula, based on data provided by riin alatalu", 745, -15);
  
  //vertical lines
  for (int i = 1 ; i < buildings.length+1; i++) { 
    stroke(25);
    line( i * spacing, height, i * spacing, 0);
  }
  //thicker lines and years
  for (int i = 1 ; i < buildings.length+1; i++) { 
    if ((i-1)%5 == 0) {
      stroke(55);
      line( (i+1) * spacing, height, (i+1) * spacing, 0);
      pushMatrix();
      translate(i * spacing, height-20);
      rotate(PI/4);
      text(i+1854, 0, 0);
      popMatrix();
    }
  }

  //horizontal Lines & labals (again, this is sort of clumsy, but it worked 
  //could be done with a second for-loop instead of all the typing
  for (int i = 0 ; i < 9; i++) { 
    stroke(35);
    line( width, (i+1)* height/10, 0, (i+1)* height/10);
    if (i == 0) {
      text("miljööväärtuslik hoone", 15, (i+1)* height/10-5);
    }
    if (i == 1) {
      text("mälestis", 15, (i+1)* height/10-5);
    }
    if (i == 2) {
      text("uusehitis (vähemväärtuslik)", 15, (i+1)* height/10-5);
    }
    if (i == 3) {       
      text("uusehitis (väärtuslik)", 15, (i+1)* height/10-5);
    }
    if (i== 4) {
      text("uushoone", 15, (i+1)* height/10-5);
    }
    if (i== 5) {
      text("väga väärtuslik hoone", 15, (i+1)* height/10-5);
    }
    if (i == 6) {
      text("miljööliselt vähemväärtuslik hoone", 15, (i+1)* height/10-5);
    }
    if (i == 7) {
      text("väärtusetu hoone", 15, (i+1)* height/10-5);
    }
    if (i == 8) {
      text("väärtuslik hoone", 15, (i+1)* height/10-5);
    }
  }

// displaying the actual data
  for (int j = 0; j < 9; j++) {
    translate (0, height/10);
    stroke(30*j, 10*j+1000, 255- 30*j);
    strokeWeight(1);
    for (int i = 1 ; i < buildings.length; i++) { 
      float previousOffset = buildings[i-1][j][1];
      float offset = buildings[i][j][1];
      if (previousOffset + offset > 0) {
        line(i * spacing, previousOffset/2, (i+1) * spacing, offset/2);
        line(i * spacing, - previousOffset/2, (i+1) * spacing, - offset/2);
      }
    }
  }
