
//Referenced code from:
//http://cwwang.com/2008/02/23/csv-import-for-processing/
//for importing csv files into a 2d array
//by che-wei wang
//and
//http://www.openprocessing.org/sketch/94237
//Anirudh 'Ani' Gubba
//Many thanks!

String [][] csv;
int csvWidth=0;
PFont font1;
PFont font2;
int myX=0;
int myY=0;

void setup() {
  size(600, 400);
  background(39, 146, 255);
  smooth();
  noStroke();
  font1=createFont("Futura", 16, true); //bigger and smaller fonts
  font2=createFont("Futura", 32, true);
  displayPlanes(); //show the plane images
  String lines[] = loadStrings("flights2.csv"); //pull in the file
  for (int i=0; i < lines.length; i++) { //array
    String [] chars=split(lines[i], ','); //split the csv file by commas
    if (chars.length>csvWidth) {
      csvWidth=chars.length;
    }
  }

  //create csv array based on # of rows and columns in csv file
  csv = new String [lines.length][csvWidth];

  //2d array for grabbing select cells in a table
  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ',');
    for (int j=0; j < temp.length; j++) {
      csv[i][j]=temp[j];
    }
  }
}
void draw() {
  //if statements where mouse is in certain area then data is displayed at bottom of the screen
  if (mouseX > 20 && mouseX <= 185 && mouseY>0 && mouseY <= 175) {
    background(39, 146, 255);
    smooth();
    displayPlanes();
    textFont(font2);
    text(csv[1][3] + " " + "flights", width-240, height-40);
  }
  else if (mouseX > 330 && mouseX <= 470 && mouseY>20 && mouseY <= 140) {
    background(39, 146, 255);
    smooth();
    displayPlanes();
    textFont(font2);
    text(csv[2][3] + " " + "flights", width-240, height-40);
  }
  else if (mouseX > 175 && mouseX <= 375 && mouseY > 90 && mouseY <= 270) {
    background(39, 146, 255);
    smooth();
    displayPlanes();
    textFont(font2);
    text(csv[3][3] + " " + "flights", width-240, height-40);
  }
  else if (mouseX > 30 && mouseX <= 90 && mouseY >220 && mouseY <= 280) {
    background(39, 146, 255);
    smooth();
    displayPlanes();
    textFont(font2);
    text(csv[4][3] + " " + "flights", width-240, height-40);
  }
  else if (mouseX > 290 && mouseX <= 480 && mouseY>180 && mouseY <= 320) {
    background(39, 146, 255);
    smooth();
    displayPlanes();
    textFont(font2);
    text(csv[5][3] + " " + "flights", width-240, height-40);
  }
}
//make text that doesn't change, from/to data
void displayPlanes() {
  String lines[] = loadStrings("flights2.csv");
  for (int i=0; i < lines.length; i++) {
    String [] chars=split(lines[i], ',');
    if (chars.length>csvWidth) {
      csvWidth=chars.length;
    }
  }

  csv = new String [lines.length][csvWidth];

  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ',');
    for (int j=0; j < temp.length; j++) {
      csv[i][j]=temp[j];
    }
  }
  textFont(font1);
  text("Top 5 Most Frequent Flights", width-400, height-380);
  pushMatrix();
  text(csv[1][1] + " " + "to" + " " + csv[1][2], width-430, height-320);
  scale(1.2);
  drawAirplane(80, 65);
  popMatrix();
  pushMatrix();
  text(csv[2][1] + " " + "to" + " " + csv[2][2], width-130, height-310);
  scale(1.1);
  drawAirplane(360, 80);
  popMatrix();
  pushMatrix();
  text(csv[3][1] + " " + "to" + " " + csv[3][2], width-260, height-220);
  drawAirplane(270, 180);
  popMatrix();
  pushMatrix();
  text(csv[4][1] + " " + "to" + " " + csv[4][2], width-430, height-85);
  scale(0.9);
  drawAirplane(120, 350);
  popMatrix();
  pushMatrix();
  text(csv[5][1] + " " + "to" + " " + csv[5][2], width-108, height-115);
  scale(0.8);
  drawAirplane(550, 350);
  popMatrix();
}
//draw an airplane
void drawAirplane (float myX, float myY) {
  fill(255);
  noStroke();
  smooth();
  ellipse(myX, myY, 110, 30);
  quad(myX-50, myY, myX-30, myY, myX-57, myY-50, myX-65, myY-50);
  triangle(myX+20, myY, myX-10, myY, myX, myY+40);
  fill(0);
  ellipse(myX+40, myY-5, 5, 5);
  ellipse(myX+30, myY-5, 5, 5);
  ellipse(myX+20, myY-5, 5, 5);
  ellipse(myX+10, myY-5, 5, 5);
  ellipse(myX, myY-5, 5, 5);
  ellipse(myX-10, myY-5, 5, 5);
  ellipse(myX-20, myY-5, 5, 5);
  ellipse(myX-30, myY-5, 5, 5);
  fill(255);
}



