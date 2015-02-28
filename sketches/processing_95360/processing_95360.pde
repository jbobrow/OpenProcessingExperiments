
//Referenced code from:
//http://cwwang.com/2008/02/23/csv-import-for-processing/
//for importing csv files into a 2d array
//by che-wei wang
//and
//http://www.openprocessing.org/sketch/94237
//Anirudh 'Ani' Gubba
//and
//Grabbed data from GLAAD's "Where We Are On TV Reports"
//Many thanks!

String [][] broadcast;
String [][] cable;
int broadcastWidth=0;
int cableWidth=0;
PFont font1;
PFont font2;
int myX=0;
int myY=0;

void setup() {
  size(750, 750);
  background(37, 186, 156);
  smooth();
  noStroke();
  font1=createFont("CapitalsRegular", 30, true);
  font2=createFont("EuphemiaUCAS", 25, true);
  initializeBackground();
  initializeBroadcast();
  initializeCable();
  initializeTV(0, 0);
  initializeTV(300, 0);
  initializeTV(0, 160);
  initializeTV(300, 160);
  initializeTV(0, 330);
  initializeTV(300, 330);
  initializeTV(0, 490);
  initializeTV(300, 490);
}
//if mouse is on a certain year, then data from that year is displayed in the TVs
void draw() {
  if (mouseX > 20 && mouseX <=80 && mouseY>50 && mouseY<=170) {
    background(37, 186, 156);
    initializeBackground();
    initializeTV(0, 0);
    initializeTV(300, 0);
    initializeTV(0, 160);
    initializeTV(300, 160);
    initializeTV(0, 330);
    initializeTV(300, 330);
    initializeTV(0, 490);
    initializeTV(300, 490);
    smooth();
    fill(255);
    textFont(font2);
    text(broadcast[1][1], width-400, height-610);
    text(broadcast[1][2], width-100, height-610);
    text(broadcast[1][3], width-400, height-450);
    text(broadcast[1][4], width-100, height-450);
    text(cable[1][1], width-400, height-260);
    text(cable[1][2], width-100, height-260);
    text(cable[1][3], width-400, height-100);
    text(cable[1][4], width-100, height-100);
  }
  else if (mouseX>20 && mouseX<=80 && mouseY>170 && mouseY<=290) {
    background(37, 186, 156);
    initializeBackground();
    initializeTV(0, 0);
    initializeTV(300, 0);
    initializeTV(0, 160);
    initializeTV(300, 160);
    initializeTV(0, 330);
    initializeTV(300, 330);
    initializeTV(0, 490);
    initializeTV(300, 490);
    smooth();
    fill(255);
    textFont(font2);
    text(broadcast[2][1], width-400, height-610);
    text(broadcast[2][2], width-100, height-610);
    text(broadcast[2][3], width-400, height-450);
    text(broadcast[2][4], width-100, height-450);
    text(cable[2][1], width-400, height-260);
    text(cable[2][2], width-100, height-260);
    text(cable[2][3], width-400, height-100);
    text(cable[2][4], width-100, height-100);
  }
  else if (mouseX>20 && mouseX<=80 && mouseY>290 && mouseY <=410) {
    background(37, 186, 156);
    initializeBackground();
    initializeTV(0, 0);
    initializeTV(300, 0);
    initializeTV(0, 160);
    initializeTV(300, 160);
    initializeTV(0, 330);
    initializeTV(300, 330);
    initializeTV(0, 490);
    initializeTV(300, 490);
    smooth();
    fill(255);
    textFont(font2);
    text(broadcast[3][1], width-400, height-610);
    text(broadcast[3][2], width-100, height-610);
    text(broadcast[3][3], width-400, height-450);
    text(broadcast[3][4], width-100, height-450);
    text(cable[3][1], width-400, height-260);
    text(cable[3][2], width-100, height-260);
    text(cable[3][3], width-400, height-100);
    text(cable[3][4], width-100, height-100);
  }
  else if (mouseX>20 && mouseX<=80 && mouseY>410 && mouseY<=530) {
    background(37, 186, 156);
    initializeBackground();
    initializeTV(0, 0);
    initializeTV(300, 0);
    initializeTV(0, 160);
    initializeTV(300, 160);
    initializeTV(0, 330);
    initializeTV(300, 330);
    initializeTV(0, 490);
    initializeTV(300, 490);
    smooth();
    fill(255);
    textFont(font2);
    text(broadcast[4][1], width-400, height-610);
    text(broadcast[4][2], width-100, height-610);
    text(broadcast[4][3], width-400, height-450);
    text(broadcast[4][4], width-100, height-450);
    text(cable[4][1], width-400, height-260);
    text(cable[4][2], width-100, height-260);
    text(cable[4][3], width-400, height-100);
    text(cable[4][4], width-100, height-100);
  }
  else if (mouseX>20 && mouseX<=80 && mouseY>530 && mouseY<=650) {
    background(37, 186, 156);
    initializeBackground();
    initializeTV(0, 0);
    initializeTV(300, 0);
    initializeTV(0, 160);
    initializeTV(300, 160);
    initializeTV(0, 330);
    initializeTV(300, 330);
    initializeTV(0, 490);
    initializeTV(300, 490);
    smooth();
    fill(255);
    textFont(font2);
    text(broadcast[5][1], width-400, height-610);
    text(broadcast[5][2], width-100, height-610);
    text(broadcast[5][3], width-400, height-450);
    text(broadcast[5][4], width-100, height-450);
    text(cable[5][1], width-400, height-260);
    text(cable[5][2], width-100, height-260);
    text(cable[5][3], width-400, height-100);
    text(cable[5][4], width-100, height-100);
  }
}
//be able to parse data from the broadcast TV csv file
void initializeBroadcast() {
  String lines[] = loadStrings("broadcastnetworks.csv");
  for (int i=0; i< lines.length; i++) {
    String [] chars=split(lines[i], ',');
    if (chars.length>broadcastWidth) {
      broadcastWidth=chars.length;
    }
  }
  broadcast = new String [lines.length][broadcastWidth];
  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp = split(lines[i], ',');
    for (int j=0; j<temp.length; j++) {
      broadcast[i][j]=temp[j];
    }
  }
}
//be able to parse data from cable TV csv file
void initializeCable() {
  String cablelines[] = loadStrings("cablenetworks.csv");
  for (int k=0; k< cablelines.length; k++) {
    String [] chars=split(cablelines[k], ',');
    if (chars.length>cableWidth) {
      cableWidth=chars.length;
    }
  }
  cable = new String [cablelines.length][cableWidth];
  for (int k=0; k < cablelines.length; k++) {
    String [] temp = new String [cablelines.length];
    temp = split(cablelines[k], ',');
    for (int l=0; l<temp.length; l++) {
      cable[k][l]=temp[l];
    }
  }
}
//background objects and text, timeline, etc.
void initializeBackground() {
  fill(14, 115, 95);
  quad(myX+30, myY+50, myX+70, myY+50, myX+70, myY+650, myX+30, myY+650);
  rect(myX+50, myY+90, 30, 15);
  rect(myX+50, myY+210, 30, 15);
  rect(myX+50, myY+330, 30, 15);
  rect(myX+50, myY+450, 30, 15);
  rect(myX+50, myY+570, 30, 15);
  textFont(font1);
  text("2008-2009", myX+90, myY+110);
  text("2009-2010", myX+90, myY+230);
  text("2010-2011", myX+90, myY+350);
  text("2011-2012", myX+90, myY+470);
  text("2012-2013", myX+90, myY+590);
  text("Number of LGBT Characters on TV", myX+110, myY+35);
  textFont(font2);
  text("Broadcast Television", myX+390, myY+70);
  text("Cable Television", myX+415, myY+415);
  text("Transgender", myX+320, myY+210);
  text("Transgender", myX+320, myY+535);
  text("Bisexual", myX+620, myY+210);
  text("Bisexual", myX+620, myY+535);
  text("Lesbian", myX+320, myY+370);
  text("Lesbian", myX+320, myY+700);
  text("Gay", myX+620, myY+370);
  text("Gay", myX+620, myY+700);
}
//draw a TV and be able to move it around
void initializeTV(float myX, float myY) {
  fill(14, 115, 95);
  rect(myX+320, myY+100, 80, 80);
  rect(myX+334, myY+90, 50, 15);
  pushMatrix();
  stroke(3);
  strokeWeight(3);
  line(myX+355, myY+90, myX+345, myY+70);
  line(myX+365, myY+90, myX+375, myY+70);
  popMatrix();
  noStroke();
}



