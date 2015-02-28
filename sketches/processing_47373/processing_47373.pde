
/*
Aldis Ozolins
 ID 2
 Survey XML visualziation
 46 people surveyed
 */


///////////////////////////global Variables//////////////////////////////////


XMLElement xml;
PGraphics pg1, pg2;
PFont fontA;
PImage type;


///////////////////////////setup//////////////////////////////////

void setup() {
  size (900, 600);
  pg1 = createGraphics(width, height/2, P2D);
  pg2 = createGraphics(width, height/2, P2D);
  xml = new XMLElement(this, "survey.xml");
  fontA = loadFont("Helvetica-Bold-48.vlw");
  
}

///////////////////////////draw loop//////////////////////////////////

void draw() {
  type = loadImage("type.png");

  pg1.beginDraw();
  pg1.background(0);
  pg1.colorMode(HSB);
  pg1.ellipseMode(CORNER);
  pg1.fill(255, 40);
  pg1.smooth();
  pg1.noFill();

  pg2.beginDraw();
  pg2.background(0);
  pg2.colorMode(HSB);
  pg2.ellipseMode(CORNER);
  pg2.fill(255, 40);
  pg2.smooth();
  pg2.noFill();

  XMLElement[] row = xml.getChildren("row");
  for (int i=0; i<row.length; i++) {
    int answerVal = int(row[i].getChild("answer").getContent());
    if (answerVal==0) {
      dataSet(pg1, row[i], height/2);
    }
    else {
      dataSet(pg2, row[i], 0);
    }
  }

  pg1.endDraw();
  pg2.endDraw();
  image(pg1, 0, 0);
  image(pg2, 0, height/2);
  stroke(255, 50);
  strokeWeight(4);
  line(0,height/2, 1500, height/2);
  fill(255, 50);
  pushMatrix();
  scale(.75);
  image(type, 20, 20);
  popMatrix();
}

///////////////////////////custom functions//////////////////////////////////

void dataSet (PGraphics pg, XMLElement row, int yoff) {
  int genderVal = int(row.getChild("gender").getContent());
  float circColor = map(genderVal, 0, 2, 0, 255);
  
  int typeVal = int(row.getChild("type").getContent());
  float circStroke = map(typeVal, 0, 2, 50, 255);
  
  pg.strokeWeight(4);
  pg.stroke (circColor, circStroke, 255, 50);

  int timeVal = int(row.getChild("time").getContent());
  float circHeight = map(timeVal, 0, 6, 0, 500);

  int ageVal = int(row.getChild("age").getContent());
  float circWidth = map(ageVal, 0, 56, 0, 750);

  pg.ellipse(20, yoff-circHeight/2, circWidth, circHeight);
}


