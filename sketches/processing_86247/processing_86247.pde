
private MyRect myRect;

void setup() {
    size(480, 360, JAVA2D);
    background(0);
    noStroke();

    frameRate(25);

    myRect = new MyRect(360, 250);
  }

  public void draw() {
    fill(0, 30);
    rect(0, 0, width, height);

    if (frameCount < 100) {
      myRect.display();
    } else {
      myRect.display1();
    }
  }

  public void mouseMoved() {
   myRect.restoreImage(mouseX, mouseY);
  }
class Cell {
  color c;

  float origX, origY;
  float x, y;

  boolean fixed;
  float fixTime;

  public Cell(float argX, float argY, color col) {
    origX = argX;
    origY = argY;

    x = argX;
    y = argY;

    fixed = false;

    c = col;
  }

  public void move() {
    if (fixed) {
      if (millis() - fixTime > 1500) {
        fixed = false;
      } else {
        return;
      }
    }
    
    x += random(-20, 20);
    y += random(-20, 20);

    x = max(x, 0);
    x = min(x, width);

    y = max(y, 0);
    y = min(y, height);
  }

  public void restore() {
    x = origX;
    y = origY;

    fixed = true;
    fixTime = millis();
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getOrigX() {
    return origX;
  }

  public float getOrigY() {
    return origY;
  }

  public color getColor() {
    return c;
  }
}
public class MyRect {
  PImage img;

  float rectX, rectY;

  int pixelsLength;

  ArrayList<Cell> list;

  color c;

  public MyRect(int xSize, int ySize) {
    rectX = (width - xSize) / 2;
    rectY = (height - ySize) / 2;

    img = loadImage("grey.png");

    list = new ArrayList<Cell>();
    for (int i = 0; i < xSize; i++) {
      for (int j = 0; j < ySize; j++) {
        
        Cell c = new Cell(rectX + i, rectY + j, img.get(i, j));
        list.add(c);
        
      }
    }
  }

  public void display() {
    image(img, rectX, rectY);
  }

  public void display1() {
    for (Cell c : list) {

      c.move();
      fill(c.getColor());
      rect(c.getX(), c.getY(), 1, 1);

    }
  }

  public void restoreImage(int x, int y) {
    for (Cell c : list) {
      if (PApplet.abs(c.getOrigX() - x) < 20 && PApplet.abs(c.getOrigY() - y) < 20) {
        c.restore();
      }
    }
  }
}


