
CheckBox cbs[] = new CheckBox[3];
Icons icons;
Button button;
Sketch sketch;
Shape curShape;
int gx=50, gy=50, gw=400, gh=300, scaler=2; // grid xy and wh
/* TODO:
 wait until a shape gets selected to start drawing
 swap numbers for 'height' and 'width' when displaying code
 update "show labels" to use scaled values for height/width
 scale the rest of the app to 2x, 3x? (making lines/points thicker)
 bigger text at the top
 draw to a PGraphics (no need to clean up outside)
 scale println'd sketch so gen'd sketch matches current display
 "print" button to write out code (wait until code is requested)
*/

void setup() {
  size(700, 400);
  background(255);
  smooth();
  cbs[0] = new CheckBox(gx+gw+20, gy+5, "one at a time", true);
  cbs[1] = new CheckBox(gx+gw+20, gy+25, "label corners", false);
  cbs[2] = new CheckBox(gx+gw+20, gy+45, "use 'height' and 'width'", false);
  icons = new Icons(gx+gw+20, gy+75);
  button = new Button(gx+gw+20, gy+gh-30, "clear");
  sketch = new Sketch();
  startShape();
}

void draw() {
  background(255);
  if (mouseX >= gx && mouseX <= (gx + gw) && mouseY >= gy && mouseY <= (gy + gh))
    curShape.update();
  image(sketch.g, gx, gy);
  curShape.draw();
  drawGrid();
  for (CheckBox cb : cbs) 
    cb.draw();
  icons.draw();
  button.draw();
  if (curShape.done)
    startShape();
}

void mouseClicked() {
  for (CheckBox cb : cbs) 
    cb.mouseClicked();
  icons.mouseClicked();
  if (mouseX >= gx - 2 && mouseX <= (gx + gw + 2) && mouseY >= gy-2 && mouseY <= (gy + gh + 2))
    curShape.mouseClicked();
  if (mouseX > button.x && mouseX < (button.x+button.w) && mouseY > button.y && mouseY < (button.y+button.h)) {
    sketch = new Sketch();
    startShape();
  }
}

void mousePressed() {
  button.mousePressed();
}
void mouseReleased() {
  button.mouseReleased();
}

void drawGrid() {  
  pushMatrix();
  translate(gx, gy);
  stroke(0);
  noFill();
  rect(0, 0, gw, gh);
  textSize(15);
  fill(0);
  text("X \u2192", gw/2-textWidth("X \u2192")/2+1, 15);
  text("Y", 5, gh/2-1);
  text("\u2193", 5, gh/2+13);
  if (cbs[1].checked) { // use 'height' and 'width'?
    String s;
    text("(0,0)", 5, 15);
    s = "(0," + (cbs[2].checked ? "height" : gh) + ")";
    text(s, 5, gh-5);
    s = "(" + (cbs[2].checked ? "width" : gw) + ",0)";
    text(s, gw-textWidth(s)-5, 15);
    s= "(" + (cbs[2].checked ? "width" : gw) + "," + (cbs[2].checked ? "height" : gh) + ")";
    text(s, gw-textWidth(s)-5, gh-5);
    s= "(" + (cbs[2].checked ? "width/2" : gw/2) + "," + (cbs[2].checked ? "height/2" : gh/2) + ")";
    text(s, gw/2-textWidth(s)/2-1, gh/2+5);
  }
  popMatrix();
}

void startShape() {
  if (icons.selected == 0)
    curShape =  new MyLine();
  else if (icons.selected == 1)
    curShape = new MyTriangle();
  else if (icons.selected == 2)
    curShape = new MyRectangle();
  else if (icons.selected == 3)
    curShape = new MyEllipse();
}

abstract class Shape {
  String syntax, code;
  float curx=0, cury=0, codex=0;
  int guides; // guides: 0,1,2,3 (none, x-moving, x-anchored/y-moving, x&y-moving)
  boolean done=false, added=false, showGuide=true;

  abstract void mouseClicked();

  Shape(String syntax, String code) {
    this.syntax = syntax;
    this.code = code;
  }

  void update() {
    if (mouseX >= gx && mouseX <= (gx + gw) && mouseY >= gy && mouseY <= (gy + gh)) {
      if (guides == 1 || guides == 3) // x only, or both
        curx = mouseX - gx;
      if (guides == 2 || guides == 3) // y only, or both
        cury = mouseY - gy;
    }
  }

  void draw() {    
    fill(0);
    stroke(0);
    pushMatrix();
    translate(gx+1, gy+1);
    text(syntax, gw/2-textWidth(syntax)/2, -27);
    text(code, constrain(codex, -gx + 5, gx + gw - textWidth(code)), -8);
    if (showGuide) {
      if (guides > 0)
        line(curx, 0, curx, gh-1);
      if (guides > 1)
        line(0, cury, gw-1, cury);
    }
    popMatrix();
  }
}

class MyLine extends Shape {
  int numClicks = 0;
  String [] c = new String[] { 
    "", "", "", "", ""
  }; // coordinates x1, y1, x2, y2

  MyLine() {
    super("syntax: line(x1, y1, x2, y2);", "");
    super.guides = cbs[0].checked ? 1 : 3;
  }

  void mouseClicked() {
    done = numClicks == 4;
    //print(int(curx) + " " + int(cury) + " " + int(numClicks) + " " + int(guides));
    if (numClicks < 4)
      numClicks += (cbs[0].checked) ? 1 : 2;
    if (cbs[0].checked && numClicks % 2 == 1) // one-at-a-time, x anchored
      super.guides = 2; // anchor x and show/move y
    if (cbs[0].checked && numClicks % 2 == 0)
      super.guides = 1; // show/move x
    if (numClicks >= 4)
      super.guides = 0;
    if (numClicks == 4 && !added)
      added = sketch.add(super.code);
    //println(":  " + int(curx) + " " + int(cury) + " " + int(numClicks) + " " + int(guides));
  }

  void update() {
    super.update();
    c[numClicks] =  "" + ((numClicks % 2 == 0) ? int(curx/2) : int(cury/2));
    if (cbs[0].checked == false && numClicks < 4) // two parameters per click?
      c[numClicks+1] =  "" + int(cury/2);
    super.code = "line(" + c[0] + ", " + c[1] + ", " + c[2] + ", " + c[3] + ");";
    if (numClicks > 3)
      super.codex = gw/2-textWidth(syntax)/2 + textWidth("syntax: ");
    else
      super.codex = curx - textWidth(super.code) + 50;
  }

  void draw() {
    super.draw();
    pushMatrix();
    translate(gx+1, gy+1);
    scale(scaler);
    fill(0);
    if (numClicks >= 2)
      ellipse(int(c[0]), int(c[1]), 2, 2);
    if (numClicks >= 4) {
      ellipse(int(c[2]), int(c[3]), 2, 2);
      line(int(c[0]), int(c[1]), int(c[2]), int(c[3]));
    }      
    popMatrix();
  }
}

class MyTriangle extends Shape {
  int numClicks = 0;
  String [] c = new String[] { 
    "", "", "", "", "", "", ""
  }; // coordinates x1, y1, x2, y2, x3, y3

  MyTriangle() {
    super("syntax: triangle(x1, y1, x2, y2, x3, y3);", "");
    super.guides = cbs[0].checked ? 1 : 3;
  }

  void mouseClicked() {
    done = numClicks == 6;
    if (numClicks < 6)
      numClicks += (cbs[0].checked) ? 1 : 2;
    if (cbs[0].checked && numClicks % 2 == 1) // one-at-a-time, x anchored
      super.guides = 2; // anchor x and show/move y
    if (cbs[0].checked && numClicks % 2 == 0)
      super.guides = 1; // show/move x
    if (numClicks >= 6)
      super.guides = 0;
    if (numClicks == 6 && !added)
      added = sketch.add(super.code);
  }

  void update() {
    super.update();
    c[numClicks] =  "" + ((numClicks % 2 == 0) ? int(curx/2) : int(cury/2));
    if (cbs[0].checked == false && numClicks < 6) // two parameters per click?
      c[numClicks+1] =  "" + int(cury/2);
    super.code = "triangle(" + c[0] + ", " + c[1] + ", " + c[2] + ", " + c[3] + ", " + c[4] + ", " + c[5] + ");";
    if (numClicks > 5)
      super.codex = gw/2-textWidth(syntax)/2 + textWidth("syntax: ");
    else
      super.codex = curx - textWidth(super.code) + 50;
  }

  void draw() {
    super.draw();
    pushMatrix();
    translate(gx+1, gy+1);
    scale(scaler);
    fill(0);
    if (numClicks >= 2)
      ellipse(int(c[0]), int(c[1]), 2, 2);
    if (numClicks >= 4)
      ellipse(int(c[2]), int(c[3]), 2, 2);
    if (numClicks >= 6) {
      ellipse(int(c[4]), int(c[5]), 2, 2);
      noFill();
      triangle(int(c[0]), int(c[1]), int(c[2]), int(c[3]), int(c[4]), int(c[5]));
    }      
    popMatrix();
  }
}

class MyRectangle extends Shape {
  int numClicks = 0;
  String [] c = new String[] { 
    "", "", "", "", ""
  }; // coordinates x, y, w, h

  MyRectangle() {
    super("syntax: rect(x, y, w, h);", "");
    super.guides = cbs[0].checked ? 1 : 3;
  }

  void mouseClicked() {
    done = numClicks == 4;
    if (numClicks < 4)
      numClicks += (cbs[0].checked) ? 1 : 2;
    if (cbs[0].checked && numClicks % 2 == 1) // one-at-a-time, x anchored
      super.guides = 2; // anchor x and show/move y
    if (cbs[0].checked && numClicks % 2 == 0)
      super.guides = 1; // show/move x
    if (numClicks >= 2)
      super.showGuide = false;
    if (numClicks == 4 && !added)
      added = sketch.add(super.code);
  }

  void update() {
    super.update();
    int curxx = (numClicks < 2) ? int(curx) : int(curx-int(c[0])*2);
    int curyy = (numClicks < 2) ? int(cury) : int(cury-int(c[1])*2);
    c[numClicks] =  "" + ((numClicks % 2 == 0) ? int(curxx/2) : int(curyy/2));
    if (cbs[0].checked == false && numClicks < 4) // two parameters per click?
      c[numClicks+1] =  "" + int(curyy/2);
    super.code = "rect(" + c[0] + ", " + c[1] + ", " + c[2] + ", " + c[3] + ");";
    if (numClicks > 1)
      super.codex = gw/2-textWidth(syntax)/2 + textWidth("syntax: ");
    else
      super.codex = curx - textWidth(super.code) + 50;
  }

  void draw() {
    super.draw();
    pushMatrix();
    translate(gx+1, gy+1);
    scale(scaler);
    stroke(0);
    fill(0);
    if (numClicks > 1) {
      ellipse(int(c[0]), int(c[1]), 2, 2);
      noFill();
      rect(int(c[0]), int(c[1]), int(c[2]), int(c[3]));
    }      
    popMatrix();
  }
}

class MyEllipse extends Shape {
  int numClicks = 0;
  String [] c = new String[] { 
    "", "", "", "", ""
  }; // coordinates x, y, w, h

  MyEllipse() {
    super("syntax: ellipse(x, y, w, h);", "");
    super.guides = cbs[0].checked ? 1 : 3;
  }

  void mouseClicked() {
    done = numClicks == 4;
    if (numClicks < 4)
      numClicks += (cbs[0].checked) ? 1 : 2;
    if (cbs[0].checked && numClicks % 2 == 1) // one-at-a-time, x anchored
      super.guides = 2; // anchor x and show/move y
    if (cbs[0].checked && numClicks % 2 == 0)
      super.guides = 1; // show/move x
    if (numClicks >= 2)
      super.showGuide = false;
    if (numClicks == 4 && !added)
      added = sketch.add(super.code);
  }

  void update() {
    super.update();
    int curxx = (numClicks < 2) ? int(curx) : int(curx-int(c[0])*2)*2;
    int curyy = (numClicks < 2) ? int(cury) : int(cury-int(c[1])*2)*2;
    c[numClicks] =  "" + ((numClicks % 2 == 0) ? int(curxx/2) : int(curyy/2));
    if (cbs[0].checked == false && numClicks < 4) // two parameters per click?
      c[numClicks+1] =  "" + int(curyy/2);
    super.code = "ellipse(" + c[0] + ", " + c[1] + ", " + c[2] + ", " + c[3] + ");";
    if (numClicks > 1)
      super.codex = gw/2-textWidth(syntax)/2 + textWidth("syntax: ");
    else
      super.codex = curx - textWidth(super.code) + 50;
  }

  void draw() {
    pushMatrix();
    translate(gx+1, gy+1);
    scale(scaler);
    stroke(0);
    fill(0);
    if (numClicks > 2 || (numClicks > 1 && !cbs[0].checked)) {
      ellipse(int(c[0]), int(c[1]), 2, 2);
      noFill();
      ellipse(int(c[0]), int(c[1]), int(c[2]), int(c[3]));
    }
    if (numClicks == 2 && cbs[0].checked) {
      line(curx/2, int(c[1]) - 10, curx/2, int(c[1]) + 10);
      line(curx/2-int(c[2]), int(c[1])-10, curx/2-int(c[2]), int(c[1])+10);
    }
    popMatrix();
    // below: cleanup any lines outside the grid
    fill(255);
    noStroke();
    rect(0, 0, width, gy);
    rect(0, 0, gx, height);
    rect(gx+gw+1, 0, width, height);
    rect(gx, gy+gh+1, width, height);
    super.draw();
  }
}

class Sketch {
  boolean first=true;
  PGraphics g;

  Sketch() {
    g = createGraphics(400, 300, P2D);
    g.background(255);
  }
    
  boolean add(String s) {
    if (first) {
      println("size(200, 150);");
      first = false;
    }
    println(s);
    g.beginDraw();
    g.pushMatrix();
    g.scale(scaler);
    g.noFill();
    String [] a = s.split("\\(");
    a = a[1].split("[,\\)]");
    if (s.startsWith("line"))
      g.line(int(a[0]), int(a[1].trim()), int(a[2].trim()), int(a[3].trim()));
    else if (s.startsWith("triangle"))
      g.triangle(int(a[0]), int(a[1].trim()), int(a[2].trim()), int(a[3].trim()), int(a[4].trim()), int(a[5].trim()));
    else if (s.startsWith("rect"))
      g.rect(int(a[0]), int(a[1].trim()), int(a[2].trim()), int(a[3].trim()));
    else if (s.startsWith("ellipse"))
      g.ellipse(int(a[0]), int(a[1].trim()), int(a[2].trim()), int(a[3].trim()));
    g.popMatrix();
    g.endDraw();
    return true;
  }
}

class CheckBox {
  float x, y, w=10, h=10;
  String s;
  Boolean checked;

  CheckBox(int x, int y, String s, boolean checked) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.checked = checked;
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    fill(255);
    stroke(0);
    strokeWeight(1);
    rect(0, 0, w, h);
    if (checked) {
      line(w*0.25, h*0.5, w/2, h*0.8);
      strokeWeight(2);
      line(w/2, h*0.8, w*0.8, h*0.2);
    }
    fill(0);
    textSize(15);
    text(s, w*1.8, h);
    popMatrix();
  }

  void mouseClicked() {
    if (mouseX > x && mouseX < (x+w+textWidth(s)) && mouseY > y && mouseY < (y+h)) {
      checked = !checked;
      if (this == cbs[0])
        startShape();
    }
  }
}

class Button {
  float x, y, w, h=30;
  String s;
  boolean pressed=false;

  Button(int x, int y, String s) {
    this.x = x;
    this.y = y;
    this.s = s;
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    stroke(0);
    strokeWeight(1);
    fill(pressed ? 200 : 255);
    textSize(15);
    rect(0, 0, w=textWidth(s)+15, h);
    fill(0);
    textSize(15);
    text(s, 8, 20);
    popMatrix();
  }

  void mouseReleased() {
    if (mouseX > x && mouseX < (x+w) && mouseY > y && mouseY < (y+h)) {
      //frame.setSize(900, 700); //pressed = false;
      //noLoop();
    }
  }
  
  void mousePressed() { // pressed or released
    if (mouseX > x && mouseX < (x+w) && mouseY > y && mouseY < (y+h))
      pressed = true;
  }  
}

class Icons {
  float x, y, w=40, h=30;
  float selected=0;

  Icons(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    fill(255);
    stroke(0);
    strokeWeight(1);
    rect(0, 0, w, (h+5)*4+5); // containing rect
    /*rect(5, 5, 30, 30);
     rect(5, 40, 30, 30);
     rect(5, 75, 30, 30);
     rect(5, 110, 30, 30);*/
    fill(200);
    noStroke();
    rect(5, selected*(h+5)+5, 32, 30);
    noFill();
    stroke(0);
    line(10, 10, 30, 30);
    triangle(20, 45, 10, 65, 30, 65);
    rect(10, 80, 20, 20);
    ellipse(20, 125, 20, 20);
    popMatrix();
  }

  void mouseClicked() {
    float fh=(h+5)*4+5; // full height
    if (mouseX > x && mouseX < (x+w) && mouseY > y && mouseY < (y+fh)) {
      selected = int((mouseY - y)/fh*4);
      startShape();
    }
  }
}
