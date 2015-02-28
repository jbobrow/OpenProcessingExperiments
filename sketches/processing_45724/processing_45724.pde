


boolean drawn = false;
boolean clear; 


Drawing drawUnit;
Unit unit;
Creature creature;

Button refresh;

void setup() {
  size(600, 600);
  smooth();
  background(255);
  refresh = new Button("refresh");

  drawUnit = new Drawing();
  unit = new Unit();
  //creature = new Creature(2);
}

void draw() {


  if (mousePressed && refresh.over() == true) {
    clear();
  } 

  if (mousePressed && drawn == false && refresh.over() == false) {
    drawUnit.makeDrawing(mouseX, mouseY, pmouseX, pmouseY);
  }

  if (drawn == true && clear == false) {
    background(255);
    creature.display();
    refresh.display();
  }
}




void mouseReleased() {

  if (drawn == false && refresh.over() == false) {
    drawn = true;
    unit.buildGuy();
    creature = new Creature(4, unit);
    creature.buildCreature();
  }
}

void clear() {
  background(255);
  drawn = false;
  unit.reset();
}


class Button {

  float x, y, w, h;
  String title;
  boolean over = false;
  color bkg = color(255, 0);

  Button(String t) {
    w = 50;
    x = width - w - 2;
    y = 2;
    h = 15;
    title = t;
  }

  void display() {


    stroke(0, 0, 0);
    fill(bkg);
    rect(x, y, w, h);

    if (over()) {
      bkg = color(#AB8AB8, 127);
    } 
    else {
      bkg = color(255);
    }

    stroke(0, 0, 0);
    strokeWeight(2);
    fill(bkg);
    rect(x, y, w, h);

    fill(0);
    text(title, x +1, y+h-1);
  }


  boolean over() {

    if (mouseX > x && mouseX < x + w &&
      mouseY > y && mouseY < y + h) {
      return true;

    } 
    else {
      return false;
    }
  }
}



class Creature {

  Unit[] units;

  Creature (int n, Unit unit) {
    units = new Unit[n];
    for (int i = 0; i < units.length; i++) {
      units[i] = unit.makeCopy();
    }
  }

  void buildCreature() {
    for (int i = 0; i < units.length; i++) {
     
     int w = units[i].xMax - units[i].xMin;
     units[i].xMin = units[i].xMin + i*20; 
     

    }
  }
  
  void display() {
    for (int i = 0; i < units.length; i++) {
      units[i].xMin += random(-2,3);
      units[i].yMin += random(-2,3);
     units[i].display();
     //println(units[i].yMin);

    }
  }
  

}


class Drawing {

  Drawing() {
  }

  void makeDrawing(int x, int y, int px, int py) {
    float speed = abs(x-px) + abs(y-py);
    strokeWeight(8+speed/7);
    line(x, y, px, py);
  }
}


class Unit {

  PGraphics unit;
  color transparent = color(255, 0, 0, 1);
  color black = color(0);
  color white = color(255);
  color redColor = color(255, 0, 0, 1);

  int xMin;
  int xMax;
  int yMin;
  int yMax;

  int unitWidth;
  int unitHeight;

  


  Unit() {
    xMin = width;
    xMax = 0;
    yMin = height;
    yMax = 0;
  }

  Unit(int xmin, int xmax, int ymin, int ymax, PGraphics un) {
    xMin = xmin;
    xMax = xmax;
    yMin = ymin;
    yMax = ymax;
    unit = un;   // Maybe you later might need to copy the PGraphics object
  }

  Unit makeCopy() {
    return new Unit(xMin, xMax, yMin, yMax, unit);
  }


  void buildGuy() {

    loadPixels();

    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        if (get(i, j) == black) {
          if (i < xMin) {
            xMin = i;
          }
          if (i > xMax) {
            xMax = i;
          }
          if (j < yMin) {
            yMin = j;
          }
          if (j > yMax) {
            yMax = j;
          }
        }
      }
    }

    unitWidth = xMax - xMin;
    unitHeight = yMax - yMin;

    unit = createGraphics(unitWidth, unitHeight, P2D);


    unit.beginDraw();
    unit.loadPixels();

    for (int b = 0; b < unitWidth; b++) {
      for (int c = 0; c < unitHeight; c++) {
        if (get(xMin + b, yMin + c) == black) {
          unit.pixels[b + c * unitWidth] = black;
        }
        else if (get(xMin + b, yMin + c) == white) {
          unit.pixels[b + c * unitWidth] = redColor;
        }
      }
    }
    unit.updatePixels();
    unit.endDraw();
  }

  void display() {
    image(unit, xMin, yMin);
  }

  void reset() {
    xMin = width;
    xMax = 0;
    yMin = height;
    yMax = 0;
  }


}


