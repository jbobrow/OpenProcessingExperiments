
PGraphics buffer1, buffer2, bezierBuffer1, bezierBuffer2; //the geometric construction is drawn above buffers
int imgHeight, imgWidth;
color c, bkgrColor;             //pen color and background color
PVector center;      //center of the circle of inversion
float radius;        //radius of circle of inversion
PVector pen;         //coordinates of pen
int penRadius;
Menu menu;
boolean drawing;     //if currently drawing a stroke or not
ArrayList <PVector> path;

void setup() {
  size(1200, 900, P2D);
  imgHeight = round(0.82*height);
  imgWidth = round(width/2);
  radius = imgWidth*0.3;
  smooth();
  center = new PVector(width/4, imgHeight/2);
  ellipseMode(RADIUS);
  penRadius = 6; 
  c = color(254, 254, 246);
  bkgrColor = color(160);
  pen = new PVector(200, 100);
  buffer1 = createBufferImage();
  buffer2 = createBufferImage();
  bezierBuffer1 = createBufferImage();
  bezierBuffer2 = createBufferImage();
  drawGeometricConstruction();
  menu = new Menu(0, imgHeight, width, height-imgHeight);
}

void draw() {
  if (mouseX>0 && mouseY>0 && mouseX<imgWidth && mouseY<imgHeight) {
    pen.x = mouseX;
    pen.y = mouseY;
    if (mousePressed) {
      if (!drawing) {
        path = new ArrayList<PVector>();
        path.add(new PVector(mouseX, mouseY));
        drawing = true;
      } else {
        drawBufferImages();
        if (dist(path.get(path.size()-1).x, path.get(path.size()-1).y, mouseX, mouseY)>penRadius/2) {
          path.add(new PVector(mouseX, mouseY));
        }
      }
    }
  }
  updateHalf(buffer1);
  pushMatrix();
  translate(imgWidth, 0);
  updateHalf(buffer2);
  popMatrix();
  menu.update();
  c = menu.getColor(c);
  penRadius = menu.getSize(penRadius);
  if (menu.clear()) {
    clearBuffers();
  }
  if (menu.saveAndQuit()) {
    saveAndQuit();
  }
}

void mouseReleased() {  //replace rough drawing with smooth Bezier curves
  if (drawing) {
    drawing = false;
    FatCurve fc = new FatCurve(path, 2*penRadius);
    fc.drawCurve(c, 1, c, bezierBuffer1);
    ArrayList<PVector> invertedCurve = new ArrayList<PVector>();    
    for (int i=0; i<fc.getCurve().size(); i++) {
      invertedCurve.add(new PVector(getInvertedPoint(fc.getCurve().get(i)).x, 
                                 getInvertedPoint(fc.getCurve().get(i)).y));
    }
    BezierSpline spline = new BezierSpline(invertedCurve, true);
    spline.drawStrokeAndFill(c, 1, c, bezierBuffer2);
    copyBuffers();
  }
}

PGraphics createBufferImage() {
  PGraphics pg;
  pg = createGraphics(imgWidth, imgHeight, P2D);
  pg.beginDraw();
  pg.background(bkgrColor);
  pg.endDraw();
  return pg;
}

void drawBufferImages() {
  PVector invertedPen = getInvertedPoint(pen);
  PVector pinvertedPen = getInvertedPoint(new PVector(pmouseX, pmouseY));
  float d = center.dist(pen);
  float invertedPenRadius = penRadius*radius*radius/(d*d+1);
  buffer1.beginDraw();
  buffer1.stroke(c);
  buffer1.strokeWeight(2*penRadius);
  buffer1.line(pmouseX, pmouseY, mouseX, mouseY);
  buffer1.endDraw();
  buffer2.beginDraw();
  buffer2.stroke(c);
  buffer2.strokeWeight(2*invertedPenRadius);
  buffer2.line(pinvertedPen.x, pinvertedPen.y, invertedPen.x, invertedPen.y);
  buffer2.endDraw();
}

void updateHalf(PGraphics pg) {
  noStroke();
  fill(bkgrColor);
  rect(0,0,imgWidth, imgHeight);
  image(pg, 0, 0);
  drawGeometricConstruction();
}

void clearBuffers() {
  bezierBuffer1.beginDraw();
  bezierBuffer1.background(bkgrColor);
  bezierBuffer1.endDraw();
  bezierBuffer2.beginDraw();
  bezierBuffer2.background(bkgrColor);
  bezierBuffer2.endDraw();
  copyBuffers();
}

void copyBuffers() {
  buffer1.beginDraw();
  buffer1.image(bezierBuffer1, 0, 0);
  buffer1.endDraw();
  buffer2.beginDraw();
  buffer2.image(bezierBuffer2, 0, 0);
  buffer2.endDraw();
}

void saveAndQuit() {
  background(bkgrColor);
  image(buffer1, 0, 0);
  image(buffer2, imgWidth, 0);
  menu.update();
  noLoop();
  bezierBuffer1.save("Mondrian.png");
  bezierBuffer2.save("CircleInvertedMondrian.png");
}

void drawGeometricConstruction() {
  PVector p1, p2;              //intersection points
  float mx, my;                //midpoint of large circle
  PVector outer, inner;  
  PVector invertedPen = getInvertedPoint(pen);
  float di = center.dist(pen);  
  float invertedPenRadius = penRadius*radius*radius/(di*di+1);  
  if (center.dist(pen)>=radius) {
    outer = pen;
    inner = invertedPen;
  } else {
    outer = invertedPen;
    inner = pen;
  }
  noFill();
  stroke(72, 72, 113, 100);
  strokeWeight(5);
  ellipse(center.x, center.y, radius, radius); //draw circle of inversion
  mx = (center.x+outer.x)/2;
  my = (center.y+outer.y)/2;
  float bRadius = center.dist(outer)/2;
  stroke(63, 180, 40);
  ellipse(mx, my, bRadius, bRadius);          //draw large circle
  line(center.x, center.y, outer.x, outer.y); //draw lines
  p1 = getIntersectionPoint(inner, outer, 1);
  p2 = getIntersectionPoint(inner, outer, -1);
  line(p1.x, p1.y, p2.x, p2.y);
  strokeWeight(1);
  stroke(127, 211, 111);
  fill(32, 126, 14);
  ellipse(center.x, center.y, 6, 6);  //draw points
  ellipse(p1.x, p1.y, 4, 4);
  ellipse(p2.x, p2.y, 4, 4);
  strokeWeight(2);
  stroke(127, 211, 111);
  fill(c);
  ellipse(pen.x, pen.y, penRadius, penRadius);  //draw pen
  if (invertedPen.x>0 && invertedPen.y>0 && invertedPen.x<imgWidth && invertedPen.y<imgHeight) {
    ellipse(invertedPen.x, invertedPen.y, invertedPenRadius, invertedPenRadius); //draw inverted pen  
  }
}

PVector getIntersectionPoint(PVector inner, PVector outer, int sign) {
  float dx = outer.x-inner.x;
  float dy = outer.y-inner.y;
  float d = inner.dist(outer);
  float length = sqrt(radius*radius-inner.dist(center)*inner.dist(center));
  return new PVector(inner.x+sign*dy/d*length, inner.y-sign*dx/d*length);
}

PVector getInvertedPoint(PVector p) {
  float invX, invY;
  float d = center.dist(p);
  invX = center.x+radius*radius*(p.x-center.x)/(d*d);
  invY = center.y+radius*radius*(p.y-center.y)/(d*d);
  return new PVector(invX, invY);
}
/*********************************************************************************/
/* Class to draw an open or closed BÃ©zier-curve defined by the points in "path". */ 
/*********************************************************************************/

class BezierSpline {
  PVector[] ctr;  //control points
  PVector[] anch; //anchor points
  boolean closed;
  boolean emptyPath;
  
  BezierSpline(ArrayList<PVector> path, boolean closed) {
    this.closed = closed;
    if (path.size()>0) {
      emptyPath = false;
      makeControlPoints(path);
      makeAnchorPoints(path);
    } else {
      emptyPath = true;
    }
  }
  
  //Draw on screen
  void drawSpline() {
    if (emptyPath) { return; }
    beginShape();
    vertex(anch[0].x, anch[0].y);
    int j = 0;
    for (int i = 1; i<anch.length; i++) {
      bezierVertex(ctr[j].x, ctr[j].y, ctr[j+1].x, ctr[j+1].y, anch[i].x, anch[i].y);
      j += 2;
    }
    endShape();
  }
  
  //Draw on buffer pg without fill (preferably for open curves)
  void drawStroke(color sColor, int sWeight, PGraphics pg) {
    if (emptyPath) { return; }
    pg.beginDraw();
    pg.beginShape();
    pg.noFill();
    pg.stroke(sColor);
    pg.strokeWeight(sWeight);
    pg.vertex(anch[0].x, anch[0].y);
    int j = 0;
    for (int i = 1; i<anch.length; i++) {
      pg.bezierVertex(ctr[j].x, ctr[j].y, ctr[j+1].x, ctr[j+1].y, 
                      anch[i].x, anch[i].y);
      j += 2;
    }
    pg.endShape();
    pg.endDraw();
  }
  
  //Draw on buffer pg with fill (preferably for closed curves)
  void drawStrokeAndFill(color sColor, int sWeight, color fColor, PGraphics pg) {
    if (emptyPath) { return; }
    pg.beginDraw();
    pg.beginShape();
    pg.stroke(sColor);
    pg.fill(fColor);
    pg.strokeWeight(sWeight);
    pg.vertex(anch[0].x, anch[0].y);
    int j = 0;
    for (int i = 1; i<anch.length; i++) {
      pg.bezierVertex(ctr[j].x, ctr[j].y, ctr[j+1].x, ctr[j+1].y, 
                      anch[i].x, anch[i].y);
      j += 2;
    }
    pg.endShape();
    pg.endDraw();
  }

  /*******************************************/
  /* Methods for making the BÃ©zier curve.    */
  /*******************************************/
  
  void makeControlPoints(ArrayList<PVector> p) {
    if (emptyPath) { return; }
    if (closed) {
      ctr = new PVector[p.size()*2];
    } else {
      ctr = new PVector[(p.size()-1)*2];
    }
    int j = 0;
    for (int i=0; i<(p.size()-1); i++) {
      float dx = p.get(i+1).x-p.get(i).x;
      float dy = p.get(i+1).y-p.get(i).y;
      ctr[j] = new PVector(p.get(i).x+dx/3, p.get(i).y+dy/3);
      ctr[j+1] = new PVector(p.get(i).x+2*dx/3, p.get(i).y+2*dy/3);
      j += 2;
    }
    if (closed) {
      PVector last = p.get(p.size()-1);
      float dx = p.get(0).x-last.x;
      float dy = p.get(0).y-last.y;
      ctr[j] = new PVector(last.x+dx/3, last.y+dy/3);
      ctr[j+1] = new PVector(last.x+2*dx/3, last.y+2*dy/3);
    } 
  }
  
  void makeAnchorPoints(ArrayList<PVector> p) {
    if (emptyPath) { return; }
    if (closed) {
      anch = new PVector[p.size()+1];
      anch[0] = new PVector((ctr[0].x+ctr[ctr.length-1].x)/2, 
                            (ctr[0].y+ctr[ctr.length-1].y)/2);
      anch[anch.length-1] = new PVector(anch[0].x, anch[0].y);
    } else {
      anch = new PVector[p.size()];
      anch[0] = new PVector(p.get(0).x, p.get(0).y);
      anch[anch.length-1] = new PVector(p.get(p.size()-1).x, p.get(p.size()-1).y);
    }
    int j = 1;
    for (int i = 1; i<(anch.length-1); i++) {
      anch[i] = new PVector((ctr[j].x+ctr[j+1].x)/2, (ctr[j].y+ctr[j+1].y)/2);
      j += 2;
    }
  }
  
}
class Button {
  float x, y, w, h;
  boolean isSelected;
  
  Button(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.isSelected = false;
  }
  
  void update() {
    fill(230);
    stroke(190);
    rect(x, y, w, h);
    if (isSelected) {
      noFill();
      stroke(140);
      strokeWeight(3);
      rect(x, y, w, h);
    }
  }
  
  void setSelected(boolean b) {
    isSelected = b;
  }
  
  boolean isHovered() {
    if (mouseX>x && mouseX<(x+w) && mouseY>y && mouseY<(y+h)) {
      stroke(10,50);
      fill(100, 50);
      rect(x, y, w, h);
      return true;
    } else {
      return false;
    }
 }
  
}

class ColorButton extends Button {
  color c;
  
  ColorButton(float x, float y, float w, float h, color c) {
    super(x, y, w, h);
    this.c = c;
  }
  
  void update() {
    super.update();
    noStroke();
    fill(c);
    rect(x+0.2*w, y+0.2*h, 0.6*w+1, 0.6*h+1);
  }
  
  color getColor() {
    return c;
  }
}

class SizeButton extends Button {
  int size;
  
  SizeButton(float x, float y, float w, float h, int size) {
    super(x, y, w, h);
    this.size = size;
  }
  
  void update() {
    super.update();
    fill(c);
    ellipseMode(RADIUS);
    stroke(120, 90, 90, 100);
    strokeWeight(2);
    ellipse(x+w/2+1, y+h/2+1, size, size);
  }
  
  int getSize() {
    return size;
  }
}

class TextButton extends Button {
  String txt;
  
  TextButton(float x, float y, float w, float h, String txt) {
    super(x, y, w, h);
    this.txt = txt;
  }
  
  void update() {
    super.update();
    PFont pf = createFont("Helvetica", 12);
    textFont(pf);
    fill(50);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(txt, round(x+w/2), round(y+h/2));
  }
}
/***********************************************************************/
/* Class to create a curve with width from the curve in "path".        */
/* This is needed to get a smooth BÃ©zier curve from the inverted path. */
/***********************************************************************/

class FatCurve {
  float radius;
  ArrayList<PVector> curve;
  
  FatCurve(ArrayList<PVector> path, float curveWidth) {
    curve = new ArrayList<PVector>();
    if (path.size() == 0) {
      return;
    }
    radius = curveWidth/2;
    if (path.size() == 1) {
      //make a blob
      radius = radius*1.5;
      curve.add(new PVector(path.get(0).x + radius, path.get(0).y));
      curve.add(new PVector(path.get(0).x, path.get(0).y + radius));
      curve.add(new PVector(path.get(0).x - radius, path.get(0).y));
      curve.add(new PVector(path.get(0).x, path.get(0).y - radius));
    } else {
      makeSemiCircle(path, path.get(0), path.get(1));
      makeFirstHalf(path);
      makeSemiCircle(path, path.get(path.size()-1), path.get(path.size()-2));
      makeSecondHalf(path);
    }
  }
  
  //Draw on screen
  void drawCurve() {
    BezierSpline b = new BezierSpline(curve, true);
    b.drawSpline();
  }
  
  //Draw on graphics buffer pg
  void drawCurve(color strokeC, int sWeight, color fillC, PGraphics pg) {
    BezierSpline b = new BezierSpline(curve, true);
    b.drawStrokeAndFill(strokeC, sWeight, fillC, pg);
  }
  
  ArrayList<PVector> getCurve() {
    return curve;
  }
  
  /****************************************/
  /* Methods for making the fat curve     */
  /****************************************/
  
  void makeSemiCircle(ArrayList<PVector> p, PVector first, PVector second) {
    float d = first.dist(second);
    float dx = (second.x-first.x)/d;
    float dy = (second.y-first.y)/d;
    curve.add(new PVector(first.x +dy*radius, first.y-dx*radius));
    curve.add(new PVector(first.x +(-0.87*dx+0.5*dy)*radius, first.y+(-0.5*dx-0.87*dy)*radius));
    curve.add(new PVector(first.x +(-0.87*dx-0.5*dy)*radius, first.y+(0.5*dx-0.87*dy)*radius));
    curve.add(new PVector(first.x -dy*radius, first.y+dx*radius));
  }
  
   void makeFirstHalf(ArrayList<PVector> p) {
    for (int i = 0; i<(p.size()-1); i++) {
      PVector p0, p1;
      p0 = p.get(i);
      p1 = p.get(i+1);
      float d = p0.dist(p1);
      float dx = (p1.x-p0.x)/d;
      float dy = (p1.y-p0.y)/d;
      PVector mid = new PVector((p0.x+p1.x)/2, (p0.y+p1.y)/2);
      curve.add(new PVector(mid.x-dy*radius, mid.y+dx*radius));
     }
  }
  
  void makeSecondHalf(ArrayList<PVector> p) {
    for (int i = (p.size()-1); i>0; i--) {
      PVector p0, p1;
      p0 = p.get(i);
      p1 = p.get(i-1);
      float d = p0.dist(p1);
      float dx = (p1.x-p0.x)/d;
      float dy = (p1.y-p0.y)/d;
      PVector mid = new PVector((p0.x+p1.x)/2, (p0.y+p1.y)/2);
      curve.add(new PVector(mid.x-dy*radius, mid.y+dx*radius));
     }
  }
  
}
class Menu {
  float buttonSize;
  float inbetween;
  Button[] buttons;
  int x, y, w, h;
  
  Menu(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.buttonSize = 0.5*w/5*0.55;
    this.inbetween = 0.5*w/6*0.45;
    buttons = new Button[10];
    color[] colors = {color(186, 45, 50), color(7, 39, 136), 
                      color(247, 220, 89), color(254, 254, 246), color(2, 4, 8)};
    for (int i=0; i<5; i++) {
      buttons[i]=new ColorButton(x+inbetween*(i+1)+i*buttonSize, 
                                 y+(h-buttonSize)/2, buttonSize, buttonSize, colors[i]);
    }
    int[] sizes = {2, 6, 16};
    for (int i=5; i<8; i++) {
      buttons[i]=new SizeButton(x+2*inbetween+i*(buttonSize+inbetween),
                                y+(h-buttonSize)/2, buttonSize, buttonSize, sizes[i-5]);
    }
    buttons[8]=new TextButton(x+8*(buttonSize+inbetween)+3*inbetween, y+h/2-1-buttonSize, 
                              2*buttonSize, buttonSize, "clear");
    buttons[9]=new TextButton(x+8*(buttonSize+inbetween)+3*inbetween, y+h/2+1, 
                              2*buttonSize, buttonSize, "save & quit");
    
    buttons[3].setSelected(true);
    buttons[6].setSelected(true);
  }
  
  void update() {
    fill(154, 171, 193);
    strokeWeight(2);
    stroke(204);
    line(w/2, 0, w/2, height-h);
    stroke(93, 103, 131);
    rect(x+1, y, w-2, h-1);
    line(w/2, y, w/2, y+h);
    line(x+10*inbetween+8*buttonSize, y, x+10*inbetween+8*buttonSize, y+h);
    for (int i=0; i<buttons.length; i++) {
      buttons[i].update();
    }
  }
  
  int getClicked(int start, int stop) {
    int clicked = -1;
    for (int i=start; i<stop; i++) {
      if (buttons[i].isHovered()) {
        if (mousePressed) {
          clicked = i;
        }
      }
    }
    if (clicked>-1) {
      for (int i=start; i<stop; i++) {
        buttons[i].setSelected(false);
      }
      buttons[clicked].setSelected(true);
    }
    return clicked;
  }
  
  color getColor(color c) {
    int clicked = getClicked(0, 5);
    if (clicked>-1) {
      return ((ColorButton) buttons[clicked]).getColor();
    }
    return c;
  }
  
  color getSize(int s) {
    int clicked = getClicked(5, 8);
    if (clicked >-1) {
      return ((SizeButton) buttons[clicked]).getSize();
    }
    return s;
  }
  
  boolean clear() {
    if (buttons[8].isHovered()) {
      if (mousePressed) {
        return true;
      }
    }
    return false;
  }
  
  boolean saveAndQuit() {
    if (buttons[9].isHovered()) {
      if (mousePressed) {
        return true;
      }
    }
    return false;
  }
  
}


