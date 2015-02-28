
// Oliver Haimson  alhaimso
// Homework 12
// Copyright 2012

// Time to PhD at Berkeley, Columbia, and Princeton
// data from http://data.princeton.edu/wws509/datasets/#phd
// thanks to German Rodriguez for making this data available online

// INSTRUCTIONS:
// Type 'b', 'c', or 'p' to view a school individually
// Press space bar to view all schools
// Type 'm' to show/hide mean for each school

// Berkeley mean = 5.44
// Columbia mean = 5.06
// Princeton mean = 3.67
// total mean = 5.02

int [ ] years;
int [ ] univ;
int [ ] countUS;
int [ ] countForeign;
int [ ] countTotal;
int [ ] total = new int [14];
int [ ] total2 = new int [14];
int [ ] Berkeley = new int [14];
int [ ] Berkeley2 = new int[14];
int [ ] Columbia = new int [14];
int [ ] Columbia2 = new int [14];
int [ ] Princeton = new int [14];
int [ ] Princeton2 = new int [14];

float startHeight;
float startWidth;
String stage;
boolean transitionb0, transitionc0, transitionp0, showMeans;
PFont font, titleFont;

void setup( ) {
  size(470, 685);
  noStroke();
  loadData();
  Berkeley = subset(countTotal, 0, 14);
  Columbia = subset(countTotal, 14, 14);
  Princeton = subset(countTotal, 28, 14);
  for (int i=0; i<total.length; i++) {
    total[i] = (Berkeley[i]+Columbia[i]+Princeton[i]);
  }
  arrayCopy(Berkeley, Berkeley2);
  arrayCopy(Princeton, Princeton2);
  arrayCopy(Columbia, Columbia2);
  stage = "0";
  startHeight = height*.9;
  startWidth = width*.2;
  font = createFont("Arial-Bold", 48);
  titleFont = createFont("Helvetica-Bold", 48);
  transitionb0=false;
  transitionc0=false;
  transitionp0=false;
  showMeans=false;
}

void draw() {
  background(18, 30, 25);
  if (stage=="0") {
    drawData();
  }
  else if (stage=="b") {
    // show Berkeley only
    if (transitionb0) {
      total2 = new int [14];
      arrayCopy(total, total2);
      transitionb0=false;
    }
    transitionb0();
  }
  else if (stage=="c") {
    // show Columbia only
    if (transitionc0) {
      total2 = new int [14];
      arrayCopy(total, total2);
      arrayCopy(Berkeley, Berkeley2);
      arrayCopy(Princeton, Princeton2);
      transitionc0=false;
    }
    transitionc0();
  }
  else if (stage=="p") {
    // show Princeton only
    if (transitionp0) {
      total2 = new int [14];
      arrayCopy(total, total2);
      arrayCopy(Berkeley, Berkeley2);
      arrayCopy(Columbia, Columbia2);
      transitionp0=false;
    }
    transitionp0();
  }
}

void drawLabels() {
  fill(150);
  textFont(font);
  textSize(14);
  // x axis
  textAlign(CENTER);
  float x=startWidth;
  for (int i=0; i<total.length; i++) {
    text(i+1, x+10, startHeight+25);
    x+=25;
  }
  text("YEARS", width*.5+30, startHeight+50);
  // y axis
  textAlign(RIGHT, CENTER);
  for (int j=0; j<=1100; j++) {
    if (j%100==0) {
      text(j, startWidth-15, startHeight-j/2.0);
    }
  }
  // rotate label to vertical
  // citation: text rotation code thanks to Jo Wood on the Processing Forum
  // https://forum.processing.org/topic/vertical-text
  textAlign(CENTER, BOTTOM);
  pushMatrix();
  translate(35, height*.5-30);
  rotate(-HALF_PI);
  text("NUMBER OF STUDENTS", 0, 0);
  popMatrix();
  // instructions
  textAlign(RIGHT);
  textSize(10);
  text("TYPE 'B', 'C', or 'P' TO VIEW", width*.93, height*.13);
  text("A SCHOOL INDIVIDUALLY", width*.93, height*.15);
  text("PRESS SPACE BAR TO", width*.93, height*.18);
  text("VIEW ALL SCHOOLS", width*.93, height*.2);
  text("TYPE 'M' TO SHOW/HIDE", width*.93, height*.23);
  text("MEAN FOR EACH SCHOOL", width*.93, height*.25);
  // title
  textFont(titleFont);
  textAlign(CENTER, BOTTOM);
  textSize(24);
  text("TIME TO PHD", width*.5+30, height*.06);
  textSize(12);
  text("AT BERKELEY, COLUMBIA, AND PRINCETON", width*.5+30, height*.085);
  fill(243, 195, 53);
  text("BERKELEY", width*.395, height*.085);
  fill(115, 175, 219);
  text("COLUMBIA", width*.547, height*.085);
  fill(228, 125, 44);
  text("PRINCETON", width*.77, height*.085);
}

void transitionp0() {
  // transition from showing all schools to showing Princeton only
  float x=startWidth;
  for (int i=0; i<total2.length; i++) {
    if (total2[i]/2.0 > Princeton[i]/2.0) {
      total2[i] -=4;
      if (Berkeley2[i] > 0) {
        Berkeley2[i] -=2;
      }
      // draw Berkeley
      fill(243, 195, 53);
      rect(x, startHeight-total2[i]/2.0, 20, Berkeley2[i]/2.0);
      // draw Columbia
      fill(115, 175, 219);
      rect(x, startHeight-total2[i]/2.0+Berkeley2[i]/2.0, 20, Columbia2[i]/2.0);
    }
    // draw Princeton
    fill(228, 125, 44);
    rect(x, startHeight-Princeton[i]/2.0, 20, Princeton[i]/2.0);
    x+=25;
    fill(18, 30, 25);
    rect(25, startHeight, width, 75);
  }
  if (showMeans) {
  // mean
  stroke(200,13,13);
  strokeWeight(2);
  line(156, startHeight-Princeton[2]/2.0, 156, startHeight-1);
  noStroke();
  }
  drawLabels();
}

void transitionc0() {
  // transition from showing all schools to showing Columbia only
  float x=startWidth;
  for (int i=0; i<total2.length; i++) {
    if (total2[i]/2.0 > Columbia[i]/2.0+Berkeley2[i]/2.0) {
      total2[i] -=4;
      Berkeley2[i] -=2;
      if (Princeton2[i] > 0) {
        Princeton2[i] -=2;
      }
      // draw Berkeley
      fill(243, 195, 53);
      rect(x, startHeight-total2[i]/2.0, 20, Berkeley2[i]/2.0);
      // draw Princeton
      fill(228, 125, 44);
      rect(x, startHeight-Princeton2[i]/2.0, 20, Princeton2[i]/2.0);
      // draw Columbia
      fill(115, 175, 219);
      rect(x, startHeight-total2[i]/2.0+Berkeley2[i]/2.0, 20, Columbia[i]/2.0);
    }
    // draw only Columbia
    else if (total2[i]/2.0 <= Columbia[i]/2.0+Berkeley2[i]/2.0) {
      total2[i] -=4;
      Berkeley2[i] -=2;
      fill(243, 195, 53);
      rect(x, startHeight-total2[i]/2.0, 20, Berkeley2[i]/2.0);
      fill(115, 175, 219);  
      rect(x, startHeight-Columbia[i]/2.0, 20, Columbia[i]/2.0);
      fill(18, 30, 25);
      rect(25, startHeight, width, 75);
    }
    x+=25;
  }
  if (total2[4]/2.0 <= Columbia[4]/2.0+Berkeley2[4]/2.0 && showMeans) {
    // mean
    stroke(200,13,13);
    strokeWeight(2);
    line(196.5, startHeight-Columbia[4]/2.0, 196.5, startHeight-1);
    noStroke();
  }
  drawLabels();
}

void transitionb0() {
  float x=startWidth;
  for (int i=0; i<total2.length; i++) {
    if (total2[i]/2.0 > Berkeley[i]/2.0) {
      total2[i] -=4;
      // draw Columbia
      if (total2[i]/2.0 > Columbia[i]/2.0+Princeton[i]/2.0) {
        fill(115, 175, 219);
        rect(x, startHeight-total[i]/2.0+Berkeley[i]/2.0, 20, Columbia[i]/2.0);
      }
      // draw Princeton
      if (total2[i]/2.0 > Princeton[i]/2.0) {
        fill(228, 125, 44);
        rect(x, startHeight-total[i]/2.0+Berkeley[i]/2.0+Columbia[i]/2.0, 20, Princeton[i]/2.0);
      }
      else if (total2[i]/2.0 <= Princeton[i]/2.0) {
        fill(228, 125, 44);
        rect(x, startHeight-total2[i]/2.0+Berkeley[i]/2.0, 20, total2[i]/2.0-Berkeley[i]/2.0);
      }
      // draw Berkeley
      fill(243, 195, 53);
      rect(x, startHeight-total2[i]/2.0, 20, Berkeley[i]/2.0);
    }
    // draw only Berkeley
    if (total2[i]/2.0 <= Berkeley[i]/2.0) {
      fill(243, 195, 53);
      rect(x, startHeight-Berkeley[i]/2.0, 20, Berkeley[i]/2.0);
    }
    x+=25;
  }
  if (total2[4]/2.0 <= Berkeley[4]/2.0 && showMeans) {
    // mean
    stroke(200,13,13);
    strokeWeight(2);
    line(203, startHeight-Berkeley[4]/2.0, 203, startHeight-1);
    noStroke();
  }
  drawLabels();
}

void drawData() {
  float x = startWidth;
  for (int i=0; i<total.length; i++) {
    fill(243, 195, 53);
    rect(x, startHeight-total[i]/2.0, 20, Berkeley[i]/2.0);
    fill(115, 175, 219);
    rect(x, startHeight-total[i]/2.0+Berkeley[i]/2.0, 20, Columbia[i]/2.0);
    fill(228, 125, 44);
    rect(x, startHeight-total[i]/2.0+Berkeley[i]/2.0+Columbia[i]/2.0, 20, Princeton[i]/2.0);
    x+=25;
  }
  // means
  if (showMeans) {
  stroke(200, 13, 13);
  strokeWeight(2);
  line(203, startHeight-total[4]/2.0, 203, startHeight-Columbia[4]/2.0-Princeton[4]/2.0);
  line(196.5, startHeight-total[4]/2.0+Berkeley[4]/2.0, 196.5, startHeight-Princeton[4]/2.0);
  line(156, startHeight-Princeton[2]/2.0, 156, startHeight-1);
  noStroke();
  }
  drawLabels();
}

void loadData() {
  // thanks to Jim Roberts for help with this function
  String [ ] data = loadStrings("phd.csv");
  years = new int [data.length];
  univ = new int [data.length];
  countUS = new int [data.length];
  countForeign = new int [data.length];
  countTotal = new int [data.length];

  for (int i = 0; i < data.length; i++) {
    String[ ] oneLine = split(data[i], ',');
    int [ ] oneLineIntValues = int( oneLine);
    years[i] = oneLineIntValues[0];
    univ[i] = oneLineIntValues[1];
    countUS[i] = oneLineIntValues[2];
    countForeign[i] = oneLineIntValues[3];
    countTotal[i] = oneLineIntValues[4];
  }
}

void keyPressed() {
  if (key==' ') {
    stage="0";
  }
  if (key=='b') {
    stage="b";
    transitionb0=true;
  }
  else if (key=='c') {
    stage="c";
    transitionc0=true;
  }
  else if (key=='p') {
    stage="p";
    transitionp0=true;
  }
  else if (key=='m') {
    showMeans=!showMeans;
  }
}


