
XMLElement xml;

int mode=1;
int margin = 140;
int xpos = 150;
int barHeight;

PImage noMarried;
PImage yesMarried;

color bgcolor = color(250);



void setup () {
  size(1280, 720);
  smooth();
  noStroke();
  background(bgcolor);

  noMarried = loadImage("no_married.png");
  yesMarried = loadImage("yes_married.png");

  xml = new XMLElement(this, "fame.xml");
}



void draw() {
  if (mode==1) {
    background(bgcolor);

    XMLElement[] row = xml.getChildren("row");
    XMLElement[] group0 = xml.getChildren("row/group0");
    XMLElement[] group1 = xml.getChildren("row/group1");
    XMLElement[] group2 = xml.getChildren("row/group2");
    XMLElement[] group3 = xml.getChildren("row/group3");
    XMLElement[] group4 = xml.getChildren("row/group4");
    XMLElement[] group5 = xml.getChildren("row/group5");
    XMLElement[] group6 = xml.getChildren("row/group6");

    for (int i=0; i<row.length; i++) {
      int group0Vals = int(group0[i].getContent());
      int group1Vals = int(group1[i].getContent());
      int group2Vals = int(group2[i].getContent());
      int group3Vals = int(group3[i].getContent());
      int group4Vals = int(group4[i].getContent());
      int group5Vals = int(group5[i].getContent());
      int group6Vals = int(group6[i].getContent());

      fameGraph(group0Vals, margin, i);
      fameGraph(group1Vals, margin+xpos, i);
      fameGraph(group2Vals, margin+xpos*2, i);
      fameGraph(group3Vals, margin+xpos*3, i);
      fameGraph(group4Vals, margin+xpos*4, i);
      fameGraph(group5Vals, margin+xpos*5, i);
      fameGraph(group6Vals, margin+xpos*6, i);
    }
  } 
  else if (mode==2) {
    stats();
  }
  else if (mode==3) {
    background(0, 0, 255);
  }

  fill(0);
  rect(20, 20, 80, 15);
  rect(20, 40, 80, 15);
  rect(20, 60, 80, 15);
}



void fameGraph(int v, int x, int barHeight) {
  if (v == 1) {
    fill(250, 100, 130);
    rect(x, 500, 5, barHeight*-10);
  }
  if (v == 2) {
    fill(250, 100, 130);
    rect(x+30, 500, 5, barHeight*-10);
    fill(180, 80, 150);
    rect(x+35, 500, 5, barHeight*-10);
  }
  if (v == 3) {
    image(noMarried, x+70, 280, 10, 220);
    fill(bgcolor);
    rect(x+68, 280, 15, barHeight*10);
  }

  if (v == 4) {
    fill(250, 180, 0);
    rect(x+10, 500, 5, barHeight*-10);
  }
  if (v == 5) {
    fill(250, 180, 0);
    rect(x+45, 500, 5, barHeight*-10);
    fill(250, 140, 0);
    rect(x+50, 500, 5, barHeight*-10);
  }
  if (v == 6) {
    image(yesMarried, x+85, 280, 10, 220);
    fill(bgcolor);
    rect(x+83, 280, 15, barHeight*10);
  }
}



void stats () {
  for (int x = 140; x<1140; x+=150) {
    fill(230);
    rect(x, 510, 100, 2);
  }
}



void mousePressed() {
  //(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed)
  if (mouseX > 20 && mouseX < 20+80 && mouseY > 20 && mouseY < 20+15 && mousePressed) {
    mode=1;
  }
  else if (mouseX > 20 && mouseX < 20+80 && mouseY > 40 && mouseY < 40+15 && mousePressed) {
    mode=2;
  }
  else if (mouseX > 40 && mouseX < 40+80 && mouseY > 60 && mouseY < 60+15 && mousePressed) {
    mode=3;
  }
}


