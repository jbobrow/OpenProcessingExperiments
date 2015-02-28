
import java.awt.*;
import java.awt.datatransfer.*;

int res = 20;
int base = 0;
int sat=0;
int bri=100;
int btn = 0;
PFont font;

String fillString = "";
void setup() {
  //  CourierNewPSMT-48.vlw
  font = loadFont("MonotypeGurmukhi-20.vlw");
  textFont(font, 26);

  size(400, 500);
  fill(255);
  ellipseMode(CENTER);
  colorMode(HSB, res);
  noStroke();
  for (int i=0;i<res;i++) {
    fill(i, res, res);
    rect(i*width/res, 0, width/res, 40);
  }
}
int xRest=0;
int yRest=0;
void draw() {

  translate(0, 40);

  for (int x=0;x<res;x++) {
    for (int y=0;y<res;y++) {
      fill(base, x, y);
      rect(x*(width/res), y*(width/res), width/res, width/res);
    }
  }
  if (mousePressed && mouseY > 45) {
    noCursor();
    xRest=mouseX;
    yRest=mouseY;
    sat=(int)map(xRest, 0, width, 0, res);
    bri= (int)map(yRest, 0, width, 0, res);

    btn=mouseButton;
    if (btn == 37) {
      fillString = "stroke("+base+","+ sat+","+bri+");";
      clip("stroke("+base+","+ sat+","+bri+");");
    }
    else if (btn == 39) {
      fillString = "background("+base+","+ sat+","+bri+");";
      clip("background("+base+","+ sat+","+bri+");");
    }
    fill(base, sat, bri);

    if (mouseY<200) {
      stroke(3, 0, 21);
    }
    else {
      stroke(2, 0, 2);
    }

    strokeWeight(5);
    ellipse(mouseX, mouseY-40, 5, 5);
    strokeWeight(1);
    rect(mouseX-20, mouseY-40, 40, 40);
    noStroke();
  }
  else {
    cursor();
  }


  fill(base, map(xRest, 0, width, 0, res), map(yRest, 0, width, 0, res));

  rect(0, 400, width, 60);

  if (mouseY<200) {
    fill(4, 0, 20);
  }
  else {
    fill(0);
  }
textFont(font, 20);
  text(fillString, 10, height-65);
  textFont(font, 14);
  text("[left  click] stroke", 220, height-80);
  text("[right click] background", 220, height-50);
}

void mousePressed() {
  if (mouseY <40) {
    base = (int)map(mouseX, 0, width, 0, res-1);
    if (btn == 37) {
      fillString = "stroke("+base+","+ sat+","+bri+");";
      clip("stroke("+base+","+ sat+","+bri+");");
    }
    else if (btn == 39) {
      fillString = "background("+base+","+ sat+","+bri+");";
      clip("background("+base+","+ sat+","+bri+");");
    }
  }
}
void mouseDragged() {
  if (mouseY <40) {
    base = (int)map(mouseX, 0, width, 0, res-1);
    if (btn == 37) {
      fillString = "stroke("+base+","+ sat+","+bri+");";
      clip("stroke("+base+","+ sat+","+bri+");");
    }
    else if (btn == 39) {
      fillString = "background("+base+","+ sat+","+bri+");";
      clip("background("+base+","+ sat+","+bri+");");
    }
  }
}

void clip(String cliptext) {
  //Get the toolkit
  Toolkit toolkit = Toolkit.getDefaultToolkit();
  //Get the clipboard
  Clipboard clipboard = toolkit.getSystemClipboard();
  //The setContents method of the Clipboard instance takes a Transferable
  //as first parameter. The StringSelection class implements the Transferable
  //interface.
  StringSelection stringSel = new StringSelection(cliptext);
  //We specify null as the clipboard owner
  clipboard.setContents(stringSel, null);
}
