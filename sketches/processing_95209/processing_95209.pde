
/*
 *  Title: P11_03_LinePlots
 *  By:    Barton Poulson (artbybart.org & dataliteracy.com)
 *  Date:  03 April 2013
 *
 *  Assignment: 
 *    Create a sketch that draws lines to represent data values. You can
 *    use real data or you can create artificial data for this exercise.
 */

// Palette derived with Kuler from Braque's painting
// "Nude descending a staircase"
color[] palette = {#D9AC59, #401C07, #A6620F, #D9AC59, #D9B341};
PFont titleFont, labelFont;

Table artData;
int rowCount;
float mx = 29; // mouseX

void setup() {
  size(1200, 400);
  artData = new Table("braque.tsv");
  rowCount = artData.getRowCount();
  println("rowCount = " + rowCount);
  titleFont = loadFont("GillSans-Bold-36.vlw");
  labelFont = loadFont("GillSans-24.vlw");
  smooth();
}

void draw() {
  noCursor();
  background(palette[0]);
  textFont(titleFont);
  stroke(palette[2]);
  fill(palette[2]);
  textAlign(CENTER);
  text("Google Searches for Georges Braque", width/2, height/10);
  
  textFont(labelFont);
  textAlign(LEFT);

  // Read popularity
  for (int row = 0; row < rowCount; row++) {
    
    // Braque's popularity data
    String dates = artData.getString(row, 0);
    float popularity = artData.getFloat(row, 1);
    float x = map(row, 0, 104, width/15, width*23/24);
    float y = map(popularity, -2, 4, height*3/4, height/10);
    
    // Slicing interaction for dates and values
    // Placed here so it goes behind the data lines
    strokeWeight(2);
    if((mx > width/15) && (mx < width*23/24)) {
      line(mx, height*3/20, mx, height*3/4);
      if(abs(mx - x) < 4) {
        fill(palette[1]);
        text(dates, mx + 12, height*2/10);
        text(nfp(popularity, 1, 3), mx + 12, height*11/40);
      }
    }  
    
    // Lines and dots (skips January)
    if (row%12 != 0) {  
      stroke(palette[1]);
      line(x, y, x, height*3/4);
      noStroke();
      fill(palette[1]);
      int d = 6;
      ellipse(x, y, d, d);
    }
  }
  
  // Read dates
  for (int row = 0; row < rowCount; row += 12) {
    String dates = artData.getString(row, 0);
    float popularity = artData.getFloat(row, 1);
    float x = map(row, 0, 104, width/15, width*23/24);
    float y = map(popularity, -2, 4, height*3/4, height/10);
    
    // Dates
    text(dates, x, height*17/20);
      
    // Lines and dots for January
    stroke(palette[1]);
    strokeWeight(6);
    strokeCap(SQUARE);
    line(x, y, x, height*3/4);
    noStroke();
  }
}

// Use left and right arraw keys to move cursor flag
void keyPressed() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      mx -= 4;
    } else if (keyCode == RIGHT) {
      mx += 4;
    }
  }
}

void mouseMoved() {
  mx = mouseX;
}


