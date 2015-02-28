
ArrayList FillHistory = new ArrayList();
ArrayList TopHistory = new ArrayList();
ArrayList HighlightHistory = new ArrayList();
Designator[] dsg;

int designatorNumber = 100; 
float distanceThreshhold = 180;
float GOD = 0.4;
float GODvertical = 200;
float GODverticalRand = 50;
float primeControl = 0;
float secondControl = 1300;
float downControl, specdownControl, mouseControlX, mouseControlY, travelDown;
int frameCounter = 0;
int frameDeleter = 0;
int blur = 0;
int o = 4;

PGraphics web;
PGraphics guide;

void setup()
{
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(120);
  size(1280, 720);
  smooth();
  web = createGraphics(1280, 720);
  guide = createGraphics(1280, 720);
  rectMode(CORNERS);
}

void draw()
{
  background(0, 0, 0);
  
  float mouseCommandX = map(constrain(mouseControlX, -100, 100), -50, 50, -0.0004, 0.0004);
  float mouseCommandY = map(constrain(mouseControlY, -100, 100), -50, 50, -0.45, 0.45);
  downControl = ((pow(map(frameCounter, -140, 1300, -1, 1), 6) * 300));
  specdownControl = ((pow(map(frameCounter, primeControl, secondControl, -1, 1), 4) * 300));
  GOD = GOD + mouseCommandX;
  GODvertical = GODvertical + mouseCommandY;
  GODverticalRand = GODverticalRand + mouseCommandY;

  PVector exterior = new PVector(frameCounter + random(map(sin(radians(frameCounter)), -1, 1, -50, 50)) - 20, ((random(sin(radians(frameCounter * GOD) - 150) * GODvertical)) + 250 + random(map(sin(radians(frameCounter)), -1, 1, -50, 50)) + downControl), 0);
  PVector filler = new PVector(frameCounter + random(-50, 50) - 20, random((random(sin(radians(frameCounter * GOD) - 150) * GODvertical)) + 250 + random(map(sin(radians(frameCounter)), -1, 1, -50, 50)), 720) + downControl, 0);
  PVector highlighter = new PVector(frameCounter + random(map(sin(radians(frameCounter)), -1, 1, -50, 50)) - 20, ((random(sin(radians((frameCounter) * GOD) - 150)) * GODvertical) + 250 + random(map(sin(radians(frameCounter)), -1, 1, -50, 50)) + specdownControl), 0);  

  TopHistory.add(0, exterior);
  FillHistory.add(0, filler);
  HighlightHistory.add(0, highlighter);

  web.beginDraw();
  web.smooth();
  web.colorMode(HSB, 360, 100, 100, 100);
  web.strokeWeight(0.5);
  web.stroke(0, 0, 100, 17);
  web.strokeCap(ROUND);
  for (int p=0; p<TopHistory.size(); p++) {
    PVector v = (PVector) TopHistory.get(p);
    float connectChance = p/TopHistory.size() + exterior.dist(v)/distanceThreshhold;
    if (connectChance < random(0.3))  web.line(exterior.x, exterior.y, v.x, v.y);
  }
  for (int p=0; p<FillHistory.size(); p++) {
    PVector l = (PVector) FillHistory.get(p);
    float connectChance2 = p/FillHistory.size() + filler.dist(l)/distanceThreshhold;
    if (connectChance2 < random(0.4))  web.line(filler.x, filler.y, l.x, l.y);
  }
  for (int p=0; p<HighlightHistory.size(); p++) {
    PVector v = (PVector) HighlightHistory.get(p);
    float connectChance = p/HighlightHistory.size() + highlighter.dist(v)/distanceThreshhold;
    if (connectChance < random(0.3))  web.line(highlighter.x, highlighter.y, v.x, v.y);
  }
  web.endDraw();

  guide.beginDraw();
  guide.smooth();
  guide.colorMode(HSB, 360, 100, 100, 100);
  guide.stroke(200, 100, 100, 7.5);
  guide.strokeWeight(0.5);
  guide.strokeCap(SQUARE);
  float flowpoint = -20;
  dsg = new Designator[designatorNumber];
  for (int i = 0; i<dsg.length; ++i) {
    float downControl2 = ((pow(map(flowpoint, -140, 1300, -1, 1), 6) * 300));
    dsg[i] = new Designator((flowpoint), ((sin(radians(flowpoint * GOD) - 150) * GODvertical) + 250 + map(sin(radians(flowpoint)), -1, 1, -50, 50) )+ downControl2);
    flowpoint = flowpoint + (width + 120)/designatorNumber;
  }
  if (frameCount > 100) {
    for (int l = 1; l<dsg.length; ++l) {
      guide.line(dsg[l-1].xpos, dsg[l-1].ypos, dsg[l].xpos, dsg[l].ypos);
    }
  }

  if (mousePressed == false) {
    guide.noStroke();
    guide.rectMode(CORNERS);
    guide.fill(0, 0, 0, blur);
    guide.rect(0, 0, width, height);
  }
  blur = blur + 1;

  if (frameCount < 150 || mousePressed == true /*&& mouseX < 12 && mouseX > 270 && mouseY < 14 && mouseY > 41 || mousePressed == true && mouseX < 12 && mouseX > 168 && mouseY < 54 && mouseY > 81*/) {
    blur = 0;
    guide.stroke(200, 100, 100, 12);
    strokeWeight(1);
    guide.line(dsg[o-3].xpos, dsg[o-3].ypos, dsg[o-2].xpos, dsg[o-2].ypos);
    strokeWeight(2);
    guide.line(dsg[o-2].xpos, dsg[o-2].ypos, dsg[o-1].xpos, dsg[o-1].ypos);
    strokeWeight(3);
    guide.line(dsg[o-1].xpos, dsg[o-1].ypos, dsg[o].xpos, dsg[o].ypos);
    strokeWeight(4);
    guide.line(dsg[o].xpos, dsg[o].ypos, dsg[o+1].xpos, dsg[o+1].ypos);
    strokeWeight(6);
    guide.line(dsg[o+1].xpos, dsg[o+1].ypos, dsg[o+2].xpos, dsg[o+2].ypos);
    strokeWeight(1);
    guide.line(dsg[o+2].xpos, dsg[o+2].ypos, dsg[o+3].xpos, dsg[o+3].ypos);
    o++;
    if (o >= (designatorNumber - 4)) {
      o = 4;
    }
  }
  guide.endDraw();

  frameCounter = frameCounter + 2;
  frameDeleter = frameDeleter + 2;

  if (frameCounter > 1380) {
    FillHistory.clear();
    TopHistory.clear();
    HighlightHistory.clear();

    frameCounter = frameCounter - frameDeleter;
    frameDeleter = 0;
    if (primeControl <= 450) {
      primeControl = primeControl + 150;
    } 
    else if (primeControl > 450) {
      primeControl = 20;
    }
    if (secondControl >= 750) {
      secondControl = secondControl - 150;
    } 
    else if (secondControl < 750) {
      secondControl = 1280;
    }
  }
  pushStyle();
  image(guide, 0, 0);
  popStyle();
  pushStyle();
  alpha(10);
  image(web, 0, 0);
  popStyle();

  if (keyPressed && key == ' ') saveFrame("Connective Terrain #####.png");

  strokeWeight(1);
  stroke(0, 0, 40);
  if (mouseX > 12 && mouseX < 270 && mouseY > 14 && mouseY < 41) {
    fill(0, 0, 40);
    rect(12, 14, 270, 41);
  } else {
    fill(0, 0, 20);
    rect(12, 14, 270, 41);
  }
  if (mouseX > 12 && mouseX < 168 && mouseY > 54 && mouseY < 81) {
    fill(0, 0, 40);
    rect(12, 54, 168, 81);
  } else {
    fill(0, 0, 20);
    rect(12, 54, 168, 81);
  }
  fill(0, 0, 100, 100);
  textSize(16);
  textAlign(LEFT, TOP);
  text("Clear & Maintain Current Curve", 20, 18);
  text("Clear All & Restart", 20, 58);
  textAlign(RIGHT, TOP);
  text("Press Space To Save Creation", width-20, 18);
  noFill();
  rect(width-12, 14, width-258, 41);
}


void mouseDragged() {
  if (pmouseX < mouseX) {
    mouseControlX--;
  } else if (pmouseX > mouseX) {
    mouseControlX++;
  }
  if (pmouseY < mouseY) {
    mouseControlY--;
  } else if (pmouseY > mouseY) {
    mouseControlY++;
  }
}

void mouseReleased() {
  mouseControlX = 0;
  mouseControlY = 0;
}

void mouseClicked() {
  stroke(0, 0, 40);
  if (mouseX > 12 && mouseX < 270 && mouseY > 14 && mouseY < 41) {
    FillHistory.clear();
    TopHistory.clear();
    HighlightHistory.clear();
    background(0, 0, 0);
    web.background(0, 0, 0);
    web.background(0, 0, 0, 0);
    blur = 0;
    frameCounter = 0;
    frameDeleter = 0;
    primeControl = 0;
    secondControl = 0;
    fill(0, 0, 20);
    rect(12, 14, 270, 41);
    rect(12, 54, 168, 81);
  }
  if (mouseX > 12 && mouseX < 168 && mouseY > 54 && mouseY < 81) {
    FillHistory.clear();
    TopHistory.clear();
    HighlightHistory.clear();
    background(0, 0, 0);
    web.background(0, 0, 0);
    web.background(0, 0, 0, 0);
    blur = 0;
    frameCounter = 0;
    frameDeleter = 0;
    primeControl = 0;
    secondControl = 0;
    GOD = 0.4;
    GODvertical = 200;
    GODverticalRand = 1;
    fill(0, 0, 20);
    rect(12, 54, 168, 81);
    rect(12, 14, 270, 41);
  }
  fill(0, 0, 100, 100);
  textSize(16);
  textAlign(LEFT, TOP);
  text("Clear & Maintain Current Curve", 20, 18);
  text("Clear All & Restart", 20, 58);
  textAlign(RIGHT, TOP);
  text("Press Space To Save Creation", width-20, 18);
  noFill();
  rect(width-12, 14, width-258, 41);
}
class Designator {
  float xpos, ypos;
  Designator(float xp, float yp) {
    xpos = xp;
    ypos = yp;
  }
}



