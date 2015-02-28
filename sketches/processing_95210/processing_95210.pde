
/*
 *  Title: P11_04_BarPlots
 *  By:    Barton Poulson (artbybart.org & dataliteracy.com)
 *  Date:  03 April 2013
 *
 *  Assignment: 
 *    Create a sketch that draws bars to represent data values. You can
 *    use real data or you can create artificial data for this exercise.
 */
 
// Data from http://www.databaseolympics.com/

color[] crowds = {#678C8B, #8FA89B, #A2BAB0, #D0EDDE, #B3B597};
color[] palette = crowds;

PFont titleFont, labelFont;

String[] tugCountries = {"GBR", "SWE", "USA", "BEL", "DEU", "FRA", "GRE", "NED"};
// Note: The 1900 Tug of War gold medal team was composed of
//       athletes from both Sweden and Denmark. However, 
//       Sweden and not Denmark won solo medals later, 
//       so only Sweden is listed in this dataset.
int[]    tugMedals = {5, 3, 3, 1, 1, 1, 1, 1};
String[] tugNames  = {"Great Britain", "Sweden", "USA", "Belgium", "Germany",
                      "France", "Greece", "The Netherlands"};

Table olympicArts;
int rowCount;

void setup() {
  size(600, 200);
  olympicArts = new Table("olympicarts.tsv");
  rowCount = olympicArts.getRowCount();
  println("rowCount for olympicArts = " + rowCount);
  titleFont = loadFont("GillSans-Bold-18.vlw");
  labelFont = loadFont("GillSans-12.vlw");
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(palette[0]);
  noStroke();
  
  // Title
  textAlign(CENTER, CENTER);
  textFont(titleFont);
  text("Olympic Tug of War Medal Winners, 1900-1920", width/2, 20);

  // Tug of War bar chart based on summary data
  int bb = 40;   // Bottom border
  int lb = 75;  // Left side border
  
  for(int i = 0; i < tugCountries.length; i++) {
    int w = 50;    // Width of bars
    int s = 10;    // Space between bars
    int[] t  = new int[tugCountries.length]; // Tall (for bars)
    t[i] = tugMedals[i] * 20;
    int[] x = new int[tugCountries.length];
    x[i] = int(lb + (i + .5) * (w + s));
    int[] y = new int[tugCountries.length];
    y[i] = height - bb - t[i]/2;
    
    if((mouseX > (x[i] - w/2)) && (mouseX < (x[i] + w/2)) &&
       (mouseY > (y[i] - t[i]/2)) && (mouseY < (y[i] + w/2))) {
       fill(palette[4]);
       textFont(labelFont);
       textAlign(CENTER);
       // Info on rollover...
       text(tugNames[i] + ": " + tugMedals[i], x[i], y[i] - t[i]/2 - 10);
    } else {
    fill(palette[3]);
    }
    rect(x[i], y[i], w, t[i]);
  
    textAlign(CENTER);
    textFont(labelFont);
    fill(palette[4]);
    text(tugCountries[i], x[i], height - bb/2);
  }
  
  stroke(palette[4]);
  textFont(labelFont);
  textAlign(RIGHT, CENTER);
  for(int i = 0; i < 6; i++) {
    int y = height - bb - i * 20;
    line(lb - 5, y, lb - 8, y);
    text(i, lb - 15, y);
  }
}

