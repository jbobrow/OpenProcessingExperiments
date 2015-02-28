
/*
 *  Title: P11_01_DotPlots
 *  By:    Barton Poulson (artbybart.org & dataliteracy.com)
 *  Date:  05 March 2013
 *
 *  Assignment: 
 *    Create a sketch that uses dots to show the distribution 
 *    of a quantitative variables. You can use real data or
 *    you can create artificial data for this exercise.
 */

int dg = 20;   // Dark gray
int mg = 80;   // Medium gray
int lg = 200;  // Light gray
PFont xFont;
PFont yFont;

Table stateData;
int rowCount;
int d = 10;

void setup() {
  size(600, 200);
  stateData = new Table("stateData.tsv");
  rowCount = stateData.getRowCount();
  println("rowCount = " + rowCount);
  xFont = loadFont("GillSans-Bold-18.vlw");
  yFont = loadFont("GillSans-16.vlw");
}

void draw() {
//  background(palette[0]);
  background(dg);
  
  // y (search data) labels
  textFont(yFont);
  stroke(mg);
  fill(mg);
  textAlign(CENTER);
  for (int i = 0; i < 8; i++) {
    line(i * 80 + 100, 20, i * 80 + 100, height - 30);
    text (i-2, i * 80 + 100, height - 10);
  }

  // x (sport) labels
  textFont(xFont);
  fill(mg);
  text("nfl", 60, height*.2+5);

  fill(mg);
  text("nba", 60, height*.4+5);

  fill(mg);
  text("mlb", 60, height*.6+5);

  fill(mg);
  text("mls", 60, height*.8+5);

  // Draw data, 
  smooth();
  noStroke();

  for (int row = 0; row < rowCount; row++) {
    // State names
    String state = stateData.getString(row, 0);
    
    // NFL
    float nfl = (stateData.getFloat(row,  9) + 2) * 65 + 100;
    fill(lg, 160);
    ellipse(nfl, height*.2, d, d);
    if(dist(nfl, height*.2, mouseX, mouseY) < (d/2+1)) {
      text(state, nfl, height*.2 - 10);
    }

    // NBA
    float nba = (stateData.getFloat(row, 10) + 2) * 65 + 100;
    fill(lg, 160);
    ellipse(nba, height*.4, d, d);
    if(dist(nba, height*.4, mouseX, mouseY) < (d/2+1)) {
      text(state, nba, height*.4 - 10);
    }

    // MLB
    float mlb = (stateData.getFloat(row, 11) + 2) * 65 + 100;
    fill(lg, 160);
    ellipse(mlb, height*.6, d, d);
    if(dist(mlb, height*.6, mouseX, mouseY) < (d/2+1)) {
      text(state, mlb, height*.6 - 10);
    }

    // MLS
    float mls = (stateData.getFloat(row, 12) + 2) * 65 + 100;
    fill(lg, 160);
    ellipse(mls, height*.8, d, d);
    if(dist(mls, height*.8, mouseX, mouseY) < (d/2+1)) {
      text(state, mls, height*.8 - 10);
    }
  }
}

