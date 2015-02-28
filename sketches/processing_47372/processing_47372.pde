
PImage b;

XMLElement xml;
int columnW = 30;
int columnS = 130;
int columnG = 5;
int baseL = 600;
int baseLgap = 1;
String fileName = "KPCC.xml";


void setup() {

  xml = new XMLElement(this, fileName);
  int entries = xml.getChildCount();
  size(960, 800);
}


void draw()
{
  background(255);
  b = loadImage("KPCC_13_backdrop.jpg");
  image(b,0,0);
  xml = new XMLElement(this, fileName);

  int entries = xml.getChildCount();

  size((columnG+columnW)*entries+2*columnS, 800);

  XMLElement [] hours = xml.getChildren("row/hours");
  XMLElement [] donation = xml.getChildren("row/donation");

  for (int i=0; i < entries; i++) {
    int hrHeight = int(hours[i].getContent())*15;
    float doHeight = float(donation[i].getContent())*0.75;

    drawGraph( columnS +i*(columnG+columnW), baseL, hrHeight, 150);
    drawGraph( columnS +i*(columnG+columnW), baseL-baseLgap, -(doHeight)-baseLgap, 50);
  }
}

void keyPressed() {
  if (key == '1'){
  fileName = "KPCC.xml";
  }
  if (key == '2'){
    fileName = "KPCC-hours.xml";
  }
  if (key == '3'){
    fileName = "KPCC-donations.xml";
  }
}

void drawGraph( int _positionX, int _positionBaseL, float _height, int _fill) {
  noStroke();
  fill(_fill);
  rect(_positionX, _positionBaseL, columnW, _height);
}

//void mousePressed() {
//  filename = "KPCC-hours";
//}


