
int AnzahlRechtecke=5;

ClickableRect[] Rechtecke=new ClickableRect[AnzahlRechtecke];

void setup() {
  size(310,70);
  for (int index=0;index<AnzahlRechtecke;index++) {
    Rechtecke[index]=new ClickableRect(10+60*index, 10, 50, 50);
  }
  for (int index=0;index<AnzahlRechtecke;index+=2) {
    Rechtecke[index].setColor(200, 10, 250);
  }
}

void draw() {
  background(50, 50, 55);

  for (int index=0;index<AnzahlRechtecke;index++) {
    Rechtecke[index].draw();
  }
}

void mouseClicked() {
  for (int index=0;index<AnzahlRechtecke;index++) {
    if (Rechtecke[index].mouseOver()) {
      Rechtecke[index].countClick();
    }
  }
}

class ClickableRect {
  int x0, y0, w, h;
  int counter=0;
  color hinterGrundFarbe=color(0, 0, 200);

  public ClickableRect(int x, int y, int newWidth, int newHeight) {
    w=newWidth;
    h=newHeight;
    setPosition(x, y);
  }

  public void setPosition(int x, int y) {
    x0=x;
    y0=y;
  }

  public void setColor(int r, int g, int b) {
    hinterGrundFarbe=color(r, g, b);
  }

  public void draw() {
    fill(hinterGrundFarbe);
    strokeWeight(2);
    if (mouseOver()) {
      stroke(200, 200, 180);
    }
    else {
      stroke(130, 130, 130);
    }
    rect(x0, y0, w, h);
    fill(240, 240, 150);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(counter, x0+w/2, y0+h/2);
  }
  public boolean mouseOver() {
    if (mouseX>=x0&&mouseX<x0+h&&mouseY>=y0&&mouseY<y0+h) {
      return true;
    }
    else {
      return false;
    }
  }
  public void countClick() {
    counter++;
  }
}

