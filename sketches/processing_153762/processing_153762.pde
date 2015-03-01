
//ArrayList<Line> upLines = new ArrayList<Line>();
//ArrayList<Line> downLines = new ArrayList<Line>();
ArrayList<Line> middleLines = new ArrayList<Line>();

int lineWidth = 10;

void setup() {
  size(780, 780);
  smooth(8);
  for (int i = 0; i < width; i += lineWidth+lineWidth/2) {
    //upLines.add(new Line(new PVector(i, height), new PVector(i, height)));
    //downLines.add(new Line(new PVector(i, 0), new PVector(i, 0)));
    middleLines.add(new Line(new PVector(i, height/2), new PVector(i, height/2)));
  }
}

void draw() {
  background(0);
  /*for (Line ul : upLines) {
    ul.drawLine();
    ul.update();
  }*/
  /*for (Line dl : downLines) {
    dl.drawLine();
    dl.update();
  }*/
  for (Line ml : middleLines) {
    ml.drawLine();
    ml.update();
  }
}

class Line {
  PVector baseLoc;
  PVector loc;

  int maxLineHeight = int(random(10, 100));
  float lineSpeed = random(1, 3);
  int startX = 10;

  float angle = 0;

  int r = int(random(255, 255));
  int g = int(random(0, 100));
  int b = int(random(100, 255));

  Line(PVector baseLoc_, PVector loc_) {
    baseLoc = baseLoc_;
    loc = loc_;
  } 

  void drawLine() {
    stroke(r, g, b);
    strokeWeight(lineWidth);
    line(baseLoc.x, baseLoc.y, loc.x, loc.y);
  }

  void update() {
    angle += lineSpeed;
    float wave = abs(cos(radians(angle))*maxLineHeight);
    if (baseLoc.y <= 0) {
      loc.y = wave;
    }
    else if (baseLoc.y >= height) {
      loc.y = height-wave;
    }
    else {
      baseLoc.y = height/2-wave;
      loc.y = height/2+wave;
    }
  }
}


