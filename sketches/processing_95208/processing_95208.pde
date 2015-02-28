
/*
 *  Title: P11_02_Scatterplots
 *  By:    Barton Poulson (artbybart.org & dataliteracy.com)
 *  Date:  05 March 2013
 *
 *  Assignment: 
 *    Create a sketch that draws a scatterplot to show the association
 *    between two quantitative variables. You can use real data or
 *    you can create artificial data for this exercise.
 */

color[] minard = {#666666, #607F9C, #E9CCAE, #FFFFF3, #D01312};
color[] palette = minard;
PFont labelFont;

Table stateData;
int rowCount;
int d = 10;

void setup() {
  size(600, 500);
  stateData = new Table("stateData.tsv");
  rowCount = stateData.getRowCount();
  println("rowCount = " + rowCount);
  labelFont = loadFont("GillSans-Bold-18.vlw");
  smooth();
}

void draw() {
  background(palette[0]);
  textFont(labelFont);
  stroke(180);
  fill(180);

  // Line and labels for X axis
  textAlign(CENTER);
  line(100, 400, 550, 400);
  for (int i = 0; i < 7; i++) {
    text (i-3, i * 75 + 100, 420);
  }
  text("Videogames", 325, 445);

  // Line and labels for Y axis
  textAlign(RIGHT);
  line(100, 50, 100, 400);
  for (int i = 0; i < 8; i++) {
    text (i-3, 95, 400-i*50);
  }
  text("Dance", 70, 250);

  // Gets data, draws dots
  for (int row = 0; row < rowCount; row++) {
    // State names
    String state = stateData.getString(row, 0);
    
    // videoGames
    float videoGames = stateData.getFloat(row,  5);
    float x = map(videoGames, -3, 3, 100, 555);

    // dance
    float dance = stateData.getFloat(row, 7);
    float y = map(dance, -3, 4, 400, 50);

    noStroke();
    fill(palette[4], 120);
    ellipse(x, y, d, d);

    textAlign(LEFT);
    fill(180);
    if(dist(x, y, mouseX, mouseY) < (d/2+1)) {
      text(state, x, y - 10);
    }
  }
}

