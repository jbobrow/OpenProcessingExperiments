
/*
 *  Title: P10_03_AppendedTabularData
 *  By:    Barton Poulson (artbybart.org & dataliteracy.com)
 *  Date:  06 March 2013
 *
 *  Assignment: 
 *    Create a sketch that uses data from an external .csv file. You can
 *    use real data or you can create artificial data for this exercise.
 *    You will need to use Ben Fry's Table class, which is a separate PDE
 *    file that you can get from the lynda.com exercise files.
 */

// colors: background, lines, bars, accent, extra
color[] palette = {#778C85, #F2E6D0, #395059, #8C1B2F, #B5BFAA};
PFont titleFont;
PFont yFont;
Table composers;

int lm = 100;    // Left margin for grid
int bm = 100;    // Bottom margin for grid
int gw = 800;    // Grid width
int gh = 300;    // Grid height
int minX = 0;    // Minimum value of X for slider
int maxX = 418;  // Maximum value of X for slider (use rowCount)
int minY = 0;    // Minimum value of Y for grid
int maxY = 100;  // Maximum value of Y for grid
int bw = 100;    // Bar width

int row = 0;         // Initializes row at 0
int rowCount = 418;  // rowCount = 418 (from looking at spreadsheet)
float sliderX = 0;   // Initializes x coordinate for slider
int n = 5;           // Number of bars
String[] names = {"Puccini", "Verdi", "Mozart", "Wagner", "Bizet"};
PImage[] portraits = new PImage[n];
String[] imageNames = {"puccini.jpg", "verdi.jpg", "mozart.jpg", 
                       "wagner.jpg", "bizet.jpg"};

// setup ///////////////////////////////////////////////////////////////////////
void setup() {
  size(1000, 600);
  smooth();
  titleFont = loadFont("GillSans-Bold-32.vlw");
  yFont = loadFont("GillSans-14.vlw");
  
  // Reading the data file
  composers = new Table("composers.tsv");
  
  // Load images into array
  for (int i = 0; i < n; i++) {
    portraits[i] = loadImage(imageNames[i]);
  }
}

// draw ///////////////////////////////////////////////////////////////////////
void draw() {
  background(palette[0]);
  
  // Four custom functions: mainTitle, gridLines, slider, bar
  mainTitle("Google Searches for Opera Composers");
  gridLines(lm, bm, gw, gh, minY, maxY, 4);
  slider("Week", lm, 50, gw, minX, maxX, "Jan 2005", "Dec 2012");
  for (int i = 0; i < names.length; i++) {
    bar(lm, gw, bm, bw, i, names.length, names[i], composers.getInt(row, i + 1));
  }
}

// mainTitle //////////////////////////////////////////////////////////////////
void mainTitle (String titleText) {
  textAlign(CENTER, CENTER);
  textFont(titleFont);
  fill(palette[3]);
  text(titleText, width/2, 30);
}

// gridLines //////////////////////////////////////////////////////////////////
void gridLines (float lm, float bm, float wide, float high, 
                int minY, int maxY, int divY) {
  // Arguments: left margin, bottom margin, width of grid
  // height of grid, minimum value for Y, max for Y,
  // number of divisions for Y axis
  
  pushMatrix();
  
  // Translate origin to bottom left of grid
  translate(lm, height - bm);
  
  stroke(palette[1]);
  strokeCap(SQUARE);
  
  // Y axis line (optional)
//  strokeWeight(1);
//  line(0, 0, 0, -high);
  
  // Reference lines
  strokeWeight(1);
  for (float i = 0; i <= divY; i++) {
    float y = (i/divY) * -high;
    line(0, y, wide, y);
  }
    
  // y axis numbers
  textFont(yFont);
  fill(palette[1]);
  textAlign(RIGHT, CENTER);
  for (float i = 0; i <= divY; i++) {
    float y = (i/divY) * -high;
    // nfs(x, 0, 0) converts float to string with no decimals
    text(nfs(i*100/divY, 0, 0), -10, y);
  }

  popMatrix();
}

// slider ////////////////////////////////////////////////////////////////////
void slider(String title, float lm, float bm, float wide,
            int minX, int maxX, String minLabel, String maxLabel) {
  // Arguments: left margin, bottom margin, width of slider
  // minimum value for slider, max for slider
  float d = 20; // slider button diameter
  
  // Slider line
  stroke(palette[3]);
  strokeCap(SQUARE);
  strokeWeight(5);
  line(lm, height - bm, lm + wide, height - bm);
  
  // Slider button
  noStroke();
  fill(palette[1]);
  if ((dist(mouseX, mouseY, sliderX, height - bm) < d) && mousePressed)
    sliderX = mouseX;
  sliderX = constrain(sliderX, lm, lm + wide - 1);  // The "-1" avoids array error
  ellipse(sliderX, height - bm, d, d);
  fill(palette[3]);
  ellipse(sliderX, height - bm, d/2, d/2);
  
  // Slider title
  textAlign(CENTER, CENTER);
  fill(palette[3]);
  text(title, lm + wide/2, height - bm + 20);
  
  // Slider min/max labels
  text(minLabel, lm, height - bm + 20);
  text(maxLabel, lm + wide, height - bm + 20);
  
  // Use slider to set data value
  row = int(((sliderX - lm)/gw) * rowCount);
  
  // Slider current value
  text(composers.getString(row, 0), sliderX, height - bm - 25);
}

// bar ///////////////////////////////////////////////////////////////////////
void bar(int lm, int gw, int bm, int bw, int bar_i,
         int bar_n, String name, int barHeight) {
           
  fill(palette[3]);  
  float barH = barHeight * (gh/100);  // Stretches bar height to match grid
  // Calculates x coordinate for each bar to space evenly
  float bar_X = lm + (bar_i + 1) * (gw / (bar_n + 1));
  float bar_bY = height - bm;         // Y for bottom of bar
  float bar_tY = bar_bY - barH;       // Y for top of bar
  float labelY = 65;                  // Y coordinate for bar labels
    
  // Draw bar
  rect(bar_X - bw/2, bar_tY, bw, barH);
  
  // Images above bars with labels
  image(portraits[bar_i], bar_X - bw/2, 80);
  textAlign(CENTER, CENTER);
  fill(palette[1]);
  text(name, bar_X, labelY);
}

