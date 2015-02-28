
//
// D. Bishop 26 July 2007
//
// Cholera Map
//
// Data from http://www.ncgia.ucsb.edu/pubs/snow/snow.html

String[] deaths;
String[] pumps;
String[] streets;
int i;
float myscale = 20.0;
int direction = 1;
boolean draw_deaths = true;


void drawstreets(float s_stroke, float s_weight) {
  //
  // streets
  //
  noFill();
  stroke(s_stroke);
  strokeWeight(s_weight);
  for (int i=0; i < streets.length; i++) {
    String[] pieces = split(streets[i], '\t');
    int j = int(pieces[1]);
    beginShape();
    for (int k = 0; k < j; k++) {
      String[] pieces2 = split(streets[i+k+1], '\t');
      float x = float(pieces2[0]) * myscale;
      float y = float(pieces2[1]) * myscale;
      vertex(x, height-y);
    }
    endShape();
    i = i + j;
  }

  //
  // pumps
  //
  //  stroke(50*(s_stroke/150),50*(s_stroke/150),255*(s_stroke/150));
  //  fill(50*(s_stroke/150),50*(s_stroke/150),255*(s_stroke/150));
  strokeWeight(1);
  for (int i = 0; i < pumps.length; i = i+1) {
    String[] pieces = split(pumps[i], '\t');
    int x = int(float(pieces[0]) * 20);
    int y = int(float(pieces[1]) * 20);
    int size = 5;
    stroke(0);
    ellipse(x-size/2, height-(y-size/2), size+1, size+1);
    stroke(50, 50, 255);
    ellipse(x-size/2, height-(y-size/2), size, size);
  }
}

void drawdeaths(int i) {
  stroke(255, 255, 255);
  fill(255, 255, 255);
  if (i < deaths.length && draw_deaths) {
    String[] pieces = split(deaths[i], '\t');
    int x = int(float(pieces[0]) * 20);
    int y = int(float(pieces[1]) * 20);
    ellipse(x, height-y, 2, 2);
  }
}


void setup() {
  size(460, 460);
  background(0);
  frameRate(24);
  deaths = loadStrings("deaths");
  pumps = loadStrings("pumps");
  streets = loadStrings("streets");
  PFont font;   
  font = loadFont("BishopHandwriting-48.vlw"); 
  textFont(font, 18);
  fill(130);
  text("London 1854", 70, 60);
  // smooth();
  noFill();
  //  drawstreets(100.0,0.5);
  fill(255, 100, 100);
  //  ellipse(57,57,6,6);
  //  ellipse(397,397,6,6);
  //  ellipse(57,397,6,6);
  //  ellipse(397,57,6,6);
}

void draw() {
  //
  // streets
  //
  drawstreets(min(i/2, 75), 0.20);

  //
  // deaths
  //
  drawdeaths(i);

  // fade back out once drawn the first time
  i += direction;
  if (i == deaths.length) {
    direction = -1;
    draw_deaths = false;
  }
  if (i == 0) {
    direction = 1;
  }
}



