
color[] minard = {#232C33, #607F9C, #E9CCAE, #FFFFF3, #D01312};
color[] palette = minard;
PFont labelFont;

Table stateData;
int rowCount;
int d = 10;

void setup() {
  size(620, 500);
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


  textAlign(RIGHT);
  line(100, 50, 100, 400);
  for (int i = 0; i < 8; i++) {
    text (i-3, 95, 400-i*50);
  }
  text("Mobile", 70, 250);


  for (int row = 0; row < rowCount; row++) {
    // State names
    String state = stateData.getString(row, 0);
    
    // videoGames
    float videoGames = stateData.getFloat(row,  5);
    float x = map(videoGames, -3, 3, 100, 555);


    float Mobile = stateData.getFloat(row, 7);
    float y = map(Mobile, -3, 4, 400, 50);

    stroke(#B1FFFF, 2);
    fill(#B1FFFF, 180);
    ellipse(x, y, d, d);

    textAlign(LEFT);
    fill(180);
    if(dist(x, y, mouseX, mouseY) < (d/2+1)) {
      text(state, x, y - 10);
    }
  }
}
