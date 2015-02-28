
import java.awt.Point;

int tickInterval;
int tickLength = 6;

int[] alphValues = {
  10, 21, 9, 2, 15, 23, 12, 30, 7, 26, 
  20, 5, 23, 32, 14, 19, 25, 15, 17, 16, 
  29, 32, 24, 10, 31, 12
};

LinkedList<Point> tickLocs = new LinkedList<Point>();

PFont displayFont;
String curWord = "";
LinkedList<Point> wordPoints = new LinkedList<Point>();
boolean display = true;

void setup() {
  size(500, 500);
  smooth();
  tickInterval = height / 35;
  displayFont = loadFont("AngsanaUPC-30.vlw");
  initTicks();
}

void draw() {
  background(0);
  strokeWeight(2);
  //Make the axes
  fill(255);
  stroke(255);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);


  drawTicks(true);
  drawTicks(false);

  if (display)
    displayWord();
  else
    drawFigure();
}

void keyPressed() {
  if (keyCode == 10) {
    completeWord();
    return;
  }else if (Character.isLetter((char)keyCode) && !display) {
    curWord = "";
    background(0);
    wordPoints.clear();
    display = true;
  }

  if (!Character.isLetter((char)keyCode)){
    curWord += " ";
    return;
  }

  curWord += (char)(keyCode);
}

void completeWord() {
  display = false;
  createFigure();
}

void createFigure() {
  for (int i = 0; i < curWord.length(); i++) {
    if (Character.isLetter(curWord.charAt(i))) {
      String s = curWord.charAt(i) + "";
      s.toLowerCase();
      int index = int(s.charAt(0)) - int('A');
      int xVal = alphValues[index] - 18;
      int yVal = alphValues[alphValues.length - index - 1] - 18;

      xVal = tickInterval * xVal;
      yVal = tickInterval * yVal;
      xVal += width/2;
      yVal += height/2;

      wordPoints.add(new Point(xVal, yVal));
    }
  }
}

void drawFigure() {
  color l = color(252, 48, 75);
  color e = color(252,176,68);
  for (int i = 1; i < wordPoints.size(); i++) {
    fill(l);
    stroke(l);
    strokeWeight(2.5);

    Point p = wordPoints.get(i);
    Point prev = wordPoints.get(i-1);

    line(p.x, p.y, prev.x, prev.y);
    ellipseMode(CENTER);
    int rad = 5;
    fill(e);
    stroke(e);
    ellipse(p.x, p.y, rad, rad);
    ellipse(prev.x, prev.y, rad, rad);
  }

  //Connect the first to the last
  if (wordPoints.size() > 0) {
    Point p = wordPoints.get(0);
    Point prev = wordPoints.get(wordPoints.size()-1);
    fill(l);
    stroke(l);
    line(p.x, p.y, prev.x, prev.y);
    
    ellipseMode(CENTER);
    int rad = 5;
    fill(e);
    stroke(e);
    ellipse(p.x, p.y, rad, rad);
    ellipse(prev.x, prev.y, rad, rad);
  }
}

void initTicks() {
  for (int i = 0; i < height; i+= tickInterval) {
    tickLocs.add(new Point(i, height/2));
  }
}

void drawTicks(boolean horizontal) {
  java.util.Iterator iter = tickLocs.iterator();
  if (horizontal) {
    while (iter.hasNext ()) {
      Point p = (Point) iter.next();
      strokeWeight(2);
      fill(255);
      line(p.x, p.y - tickLength / 2, p.x, p.y + tickLength / 2);
    }
  }
  else {
    while (iter.hasNext ()) {
      Point p = (Point) iter.next();
      strokeWeight(2);
      fill(255);
      line(p.y - tickLength / 2, p.x, p.y + tickLength / 2, p.x);
    }
  }
}

void displayWord() {
  fill(255, 255, 0);
  textFont(displayFont);
  textAlign(CENTER);
  text(curWord, width/2, height - 40);
}


