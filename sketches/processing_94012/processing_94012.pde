
import java.util.Timer;
import java.util.TimerTask;
import java.awt.Point;
import java.awt.Rectangle;

PFont font;
PFont regFont;
PFont headerFont;
PImage buttonI;
Rectangle button;

int slide = 1;
boolean pause;

int[] data = {
  7221, 10008, 4864, 6236
};

LinkedList<Bar> bars = new LinkedList<Bar>();

void setup() {
  size(600, 650);
  initBars();

  font = loadFont("AgencyFB-Bold-48.vlw");
  regFont = loadFont("Arial-BoldMT-15.vlw");
  headerFont = loadFont("CourierNewPS-BoldMT-16.vlw");
  buttonI = loadImage("button.png");
  int btnWidth = 50;
  int btnHeight = 50;
  button = new Rectangle(width - 30 - btnWidth, height - 30 - btnHeight, btnWidth, btnHeight);

  smooth();
  background(0);
  drawTitle();
  frameRate(150);
}

void draw() {
  //background(0);

  //fill(255);
  //textFont(font);
  // textAlign(CENTER);
  //text("US IMMIGRATION RATES: ", width/2, height/2);
  if (!pause) {
    background(0);
    drawTitle();
    drawHeaders();

    image(buttonI, button.x, button.y, button.width, button.height);

    java.util.Iterator iterator = bars.iterator();

    while (iterator.hasNext ()) {
      Bar b = (Bar) iterator.next();
      if (b.getIndex() == slide) {
        b.animate(7, false, true);
        b.display();
      }
    }
  }
}

void drawHeaders() {
  textFont(headerFont);
  textSize(20);
  textAlign(CENTER);
  int ind = 2 * slide - 2;
  Bar b = bars.get(ind);
  Point p = b.getLocation();
  int loc1 = p.x;
  fill(255);
  text("MALES", p.x + b.getCurWidth()/2, p.y + b.getCurHeight() + 30);
  b = bars.get(ind+1);
  p = b.getLocation();
  text("FEMALES", p.x + b.getCurWidth()/2, p.y + b.getCurHeight() + 30);

  int centX = (loc1 + p.x + b.getCurWidth()) / 2;
  fill(255, 100, 100);

  String s = "2008";
  if (slide == 2)
    s = "2010";

  
  textSize(30);
  int offset = b.getCurHeight() + p.y;
  offset = (height - offset) / 2;
  text(s, centX, b.getCurHeight() + p.y + offset + 20);
}

void initBars() {
  int y = 545;
  int w = 120;
  int d = data[0];
  float mp = 30;
  int spacer = 60;
  
  int xStart = height/2 - w - spacer;

  Bar b = new Bar(color(0, 80, 255), w, int(d / mp));
  b.setLocation(xStart, y);
  b.setIndex(1);
  b.setData(d);
  b.setText("Africa: 1,092\nAsia: 2,291\nEurope: 1,569\nNorth America: 2,064\nOceania: 7\nSouth America: 188\nUnknown: 10");

  //Bar b1 = new Bar(color(220,234,219),

  bars.add(b);

  d = data[1];
  b = new Bar(color(192, 0, 0), w, int(d / mp));
  b.setLocation(bars.getLast().getLocation().x + w + spacer, y);
  b.setData(d);
  //1,605	1,984	895	203	14	154	9
  b.setText("Africa: 1,605\nAsia: 1,984\nEurope: 895\nNorth America: 203\nOceania: 14\nSouth America: 154\nUnknown: 9");
  b.setIndex(1);

  bars.add(b);

  d = data[2];
  b = new Bar(color(49, 105, 138), w, int(d / mp));
  b.setLocation(bars.getFirst().getLocation().x, y);
  b.setData(d);
  b.setText("Africa: 1,551\nAsia: 3,425\nEurope: 826\nNorth America: 230\nOceania: 14\nSouth America: 181\nUnknown: 9");
  b.setIndex(2);

  bars.add(b);

  d = data[3];
  b = new Bar(color(102, 0, 102), w, int(d / mp));
  b.setLocation(bars.getLast().getLocation().x + w + spacer, y);
  b.setData(d);
  b.setText("Africa: 1,223\nAsia: 4,444\nEurope: 1,505\nNorth America: 2,566\nOceania: 5\nSouth America: 251\nUnknown: 14");
  b.setIndex(2);

  bars.add(b);

  java.util.Iterator iterator = bars.iterator();
  while (iterator.hasNext ()) {
    Bar b1 = (Bar) iterator.next();
    b1.setCurWidth(b.getMaxWidth());
  }
}

void drawTitle() {
  fill(255);
  textFont(font);
  textAlign(CENTER);
  text("Immigrant Orphans Adopted by", width/2, 50);
  text("U.S. Citizens by Gender", width/2, 115);
}

void mousePressed() {
  if (button.contains(new Point(mouseX, mouseY)) && slide < 2) {
    slide++;

    int col = 112;
    pause = true;
    long s = millis();

    background(col);
    while (millis () - s < 800) {
      background(col);
    }
    pause = false;
    background(255);
  }

  //println("mX = " + mouseX + "\tmY = " + mouseY);
  println("slide = " + slide);
}

void mouseMoved() {
  java.util.Iterator iterator = bars.iterator();
  while (iterator.hasNext ()) {
    final Bar b = (Bar) iterator.next();
    final Point p = b.getLocation();
    if (mouseX >= p.x && mouseX <= p.x + b.getCurWidth() && mouseY >= p.y && mouseY <= p.y + b.getCurHeight()) {
      //Show more info
      Runnable r = new Runnable() {
        public void run() {
          textFont(regFont);
          textAlign(LEFT);
          fill(255);
          text(b.getText(), mouseX, mouseY);
          //println("HIT");
          textAlign(CENTER);
          fill(255, 255, 0);
          text(b.getData() + "", p.x + b.getCurWidth() / 2, p.y - 20);
        }
      };

      b.setRunnable(r);
    }
    else {
      b.setRunnable(null);
    }
  }
}

class Bar {
  Point loc;
  int maxWidth, maxHeight;
  int curWidth, curHeight;
  color c;
  ResizeTask task;
  Timer tm;
  boolean animated;
  int index;
  Rectangle bounds;
  Runnable r;
  String st;
  int data;

  Bar(color a, int maxW, int maxH, int curW, int curH) {
    maxWidth = maxW;
    maxHeight = maxH;
    curWidth = curW;
    curHeight = curH;
    c = a;

    bounds = new Rectangle(0, 0, curWidth, curHeight);
  }

  Bar(color a, int dw, int dh) {
    maxWidth = dw;
    maxHeight = dh;
    c = a;
  }

  void setLocation(int x, int y) {
    loc = new Point(x, y);
    if (bounds == null)
      bounds = new Rectangle(0, 0, curWidth, curHeight);
    bounds.setLocation(loc);
  }

  void setLocation(Point p) {
    loc = p;
  }

  void setIndex(int i) {
    index = i;
  }

  int getIndex() {
    return index;
  }

  void animate(int growDelay, boolean growW, boolean growH) {
    if (animated)
      return;

    tm = new Timer();
    ResizeTask task = new ResizeTask(this, growW, growH);
    tm.scheduleAtFixedRate(task, 500, growDelay);
    animated = true;
  }

  void stopAnimation() {
    if (tm == null)
      return;

    tm.cancel();
    tm.purge();
    tm = null;
  }

  int getMaxWidth() {
    return maxWidth;
  }

  void setCurWidth(int w) {
    curWidth = w;
    bounds.width = curWidth;
  }

  int getCurWidth() {
    return curWidth;
  }

  int getMaxHeight() {
    return maxHeight;
  }

  void setCurHeight(int h) {
    curHeight = h;
    bounds.height = curHeight;
  }

  int getCurHeight() {
    return curHeight;
  }

  boolean contains(int x, int y) {
    return bounds.contains(x, y);
  }

  Point getLocation() {
    return loc;
  }

  void display() {
    rectMode(CORNERS);
    fill(c);
    stroke(c);
    rect(loc.x, loc.y, loc.x + curWidth, loc.y + curHeight);

    if (r != null)
      r.run();
  }

  void setRunnable(Runnable r2) {
    r = r2;
  }

  void setText(String s) {
    st = s;
  }

  String getText() {
    return st;
  }

  void setData(int d) {
    data = d;
  }

  int getData() {
    return data;
  }
}

class ResizeTask extends TimerTask {
  Bar bar;
  boolean gW;
  boolean gH;

  ResizeTask(Bar ba, boolean w, boolean h) {
    bar = ba;
    gW = w;
    gH = h;
  }

  void run() {
    boolean c1 = bar.getCurHeight() < bar.getMaxHeight() && gH;
    boolean c2 = bar.getCurWidth() < bar.getMaxWidth() && gW;
    Point p = bar.getLocation();

    if (!c1 && gH && gH == !gW || !c2 && gW && gW == !gH || !c1 && !c2) {
      bar.stopAnimation();
      return;
    }

    if (c1) {
      bar.setCurHeight(bar.getCurHeight() + 1);
      p.y -= 1;
    }

    if (c2) {
      bar.setCurWidth(bar.getCurWidth() + 1);
    }

    // println("CurH = " + b.getCurHeight());
    //println("CurW = " + b.getCurWidth());
  }
}


