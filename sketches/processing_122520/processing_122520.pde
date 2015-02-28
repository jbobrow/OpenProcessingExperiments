
//Alex Lee, HW10, Computing for the Arts with Processing 
//Copyright Alex Lee 2013 Pittsburgh PA

/*

Bar-graph visualizer for data from the professional Starcraft II scene. 

Hover the mouse over months to see the win rates for that month. 

I attempted to make a pyramid shape first (see the drawTriangles function),
but I couldn't figure out why my math for the shape vectors were incorrect. 


*/

color bgColor = #FFFFFF;
color textColor = #333643;
color cursorColor = #FFFFFF;
color zergColor = #987BC1;
color protossColor = #FAE712;
color terranColor = #F52C2C;

String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
int[] years = {2011, 2012, 2013};

float[] zvpWinrates = {55.4,
55.1,
52.5,
50.6,
58.6,
49.7,
52.2,
50.9,
52.1,
49.6,
49.4,
53.1,
53.2,
53,
50.9,
53.4,
50.1,
51.2,
53.2,
47.9,
49.4,
50.5,
49.1,
51.6,
46.4};
float[] zvtWinrates = {46.3,
49.2,
47.8,
48.9,
50.1,
47.3,
52.9,
48.7,
54.3,
54.4,
56.6,
51.1,
55.5,
55.5,
57.4,
54.8,
56.4,
55.4,
45.8,
44.3,
48.5,
50.5,
45.5,
45,
51.5};
float[] pvtWinrates = {49.3,
44.5,
50.6,
45.7,
47.5,
50.7,
44.9,
48.1,
51.8,
47.7,
52,
46.3,
51.2,
51.2,
47.8,
48.2,
49.6,
48.6,
43,
50.7,
50.2,
52.3,
53.3,
57.7,
49.2};

float winrateDistances[] = new float[zvpWinrates.length];
float monthDistance;

int sideBuffer = 25;

float triangleTop = 100;
float triangleSide = 300;
float triangleHeight = sqrt(sq(triangleSide) - sq(triangleSide/2));


void setup() {
 size (800, 600);
 frameRate(30); 
}


void draw() {
  drawBackground();
  drawCursor();
  calculateTriangles();
}

void drawBackground() {
  background(bgColor);
  //drawing lines at bottom 
  stroke(textColor);
  fill(textColor);
  textAlign(LEFT);
  float lineDistance = (width - (sideBuffer)) / zvpWinrates.length;
  monthDistance = lineDistance;
  int r = 5; 
  rect(0, height - r, width, r);
  for(int i = 0; i < zvpWinrates.length; i++) {
    if((i + 8) % 12 == 0) {
      strokeWeight(3);
      line(lineDistance * i + sideBuffer, height - r, lineDistance * i + sideBuffer, height - r - 8);
    }
    else {
      strokeWeight(.4);
      line(lineDistance * i + sideBuffer, height - r, lineDistance * i + sideBuffer, height - r - 8);
    }
    //drawing text at bottom 
    pushMatrix();
    translate(lineDistance * i + sideBuffer + 4, height - 18 - r);
    rotate(radians(270));
    textSize(12);
    text(months[((i + 8) % 12)] + " " + years[floor((i + 8) / 12)], 0, 0);
    popMatrix();
    //calculating winrate distances 
    winrateDistances[i] = lineDistance * i + sideBuffer;
  }
  textAlign(CENTER); 
  int h = 50;
  textSize(18);
  text("Starcraft II Race Balance", width/2, h-8);
  textSize(12);
  text("International Win Rates from Sept. 2011 - Sept. 2013 by Matchup", width/2, h + 12);
  text("Z = Zerg, P = Protoss, T = Terran", width/2, h + 25);
  text("Compiled by aligulac.com and @SC2stats", width/2, h + 38);
  //bar text
}

void drawCursor() {
  fill(cursorColor);
  noStroke();
  int cursorWidth = 1; 
  rect(mouseX - cursorWidth / 2, height - 5, cursorWidth, 65);
}

//find the difference between the current winrate and next months winrate, multiply it by the percentage, and then add it to the current
//find how far you are into the current month (a percentage) 

/*


float colVal = map( slideX, width*.1, width*.9, 0, 255 );


triangleMid - (triangleHeight / 2)
*/

void calculateTriangles() {
  float tempZvP = 50;
  float tempZvT = 50;
  float tempPvT = 50;
  for(int j = 0; j < winrateDistances.length; j++) {
    if(mouseX >= winrateDistances[j] && mouseX < winrateDistances[j] + monthDistance && j < winrateDistances.length - 1) {
      float currentDistance = (mouseX - winrateDistances[j]) / monthDistance; 
      tempZvP = zvpWinrates[j];
      tempZvP += (zvpWinrates[j+1] - zvpWinrates[j]) * currentDistance;
      //println("zvp:" + tempZvP);
      tempZvT = zvtWinrates[j];
      tempZvT += (zvtWinrates[j+1] - zvtWinrates[j]) * currentDistance;
      //println("zvt:" + tempZvT);
      tempPvT = pvtWinrates[j];
      tempPvT += (pvtWinrates[j+1] - pvtWinrates[j]) * currentDistance;
      //println("pvt:" + tempPvT);
    }
  }
  drawBar("ZvP", tempZvP);
  drawBar("ZvT", tempZvT);
  drawBar("PvT", tempPvT);
  //drawTriangle("Zerg", tempZvP, tempZvT, tempPvT);  
  //drawTriangle("Protoss", tempZvP, tempZvT, tempPvT);  
  //drawTriangle("Terran", tempZvP, tempZvT, tempPvT);  
}


void drawBar(String Matchup, float Balance) {
  noStroke();
  float min = 40;
  float max = 60;
  int rectTop = 170;
  int rectWidth = 90;
  int rectHeight = 200;
  
  fill(textColor);
  textAlign(CENTER);
  if(Matchup == "ZvP") { 
    text("Z: " + round(Balance) + "%", 300, rectTop - 10);
    text("P: " + round(100 - Balance) + "%", 300, rectTop + rectHeight + 20);
  }
  else if(Matchup == "ZvT") { 
    text("Z: " + round(Balance) + "%", 400, rectTop - 10);
    text("T: " + round(100 - Balance) + "%", 400, rectTop + rectHeight + 20);
  }
  else if(Matchup == "PvT") { 
    text("P: " + round(Balance) + "%", 500, rectTop - 10);
    text("T: " + round(100 - Balance) + "%", 500, rectTop + rectHeight + 20);
  }
  
  
  
  Balance = map(Balance, min, max, 0, rectHeight);
  //println("New " + Matchup + ": " + Balance);
  if(Matchup == "ZvP") {
    fill(zergColor);
    rect(255, rectTop, rectWidth, Balance);
    fill(protossColor);
    rect(255, rectTop + Balance, rectWidth, (rectHeight - Balance));
  }
  if(Matchup == "ZvT") {
    fill(zergColor);
    rect(355, rectTop, rectWidth, Balance);
    fill(terranColor);
    rect(355, rectTop + Balance, rectWidth, (rectHeight - Balance));
  }
  if(Matchup == "PvT") {
    fill(protossColor);
    rect(455, rectTop, rectWidth, Balance);
    fill(terranColor);
    rect(455, rectTop + Balance, rectWidth, (rectHeight - Balance));
  }
  
}


void drawTriangle(String Race, float ZvP, float ZvT, float PvT) {
  noStroke();
  float min = 40;
  float max = 60;
  ZvP = map(ZvP, min, max, 0, triangleSide);
  //println("newzvp" + ZvP);
  ZvT = map(ZvT, min, max, 0, triangleSide);
  PvT = map(PvT, min, max, 0, triangleSide);
  if(Race == "Zerg") {
    fill(zergColor);
    beginShape();
    vertex(width/2, triangleTop);
    vertex(width/2 - triangleSide/2 + cos(radians(60)) * (triangleSide - ZvP), sin(radians(60)) * (triangleSide - ZvP) + triangleHeight + triangleTop);//need to add triangle top
    vertex(width/2, triangleTop + triangleHeight*2/3);
    vertex(width/2 - triangleSide/2 + cos(radians(60)) * (triangleSide - ZvT), sin(radians(60)) * (triangleSide - ZvT) + triangleHeight + triangleTop);
    endShape();
  }
  if(Race == "Protoss") {
    fill(protossColor);
    beginShape();
    vertex(width/2 - triangleSide/2, triangleHeight + triangleTop);
    vertex(width/2 - triangleSide/2 + cos(radians(60)) * (triangleSide - ZvP), sin(radians(60)) * (triangleSide - ZvP) + triangleTop);
    //vertex(100, 100);
    vertex(width/2, triangleHeight*2/3 + triangleTop);
    vertex(width/2, triangleHeight + triangleTop);
    //vertex(600, 100);
    endShape();
  }
  if(Race == "Terran") {
    fill(terranColor);
    beginShape();
    //vertex(width/2 + (triangleHeight/2), triangleMid - (triangleHeight / 2));
    vertex(100, 100);
    //vertex(width/2, triangleMid);
    vertex(600, 100);
    endShape();
  }
}


