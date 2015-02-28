
import java.util.ArrayList;

import controlP5.*;
import java.awt.geom.Rectangle2D;

/**
 * 
 * Explore the iterated function y = r * x * (x - 1).
 * Press and drag on the x-axis to set initial x-input.
 * Press and drag on the y-axis to set initial r value.
 * The applet will graph the first eight values of the iteration for you.
 * You can also use the control panel to set values and iterate the function.
 * 
 * As a young researcher working at Los Alamos National Laboratory in the 
 * mid-1970s, Mitchell Feigenbaum investigated this seemingly simple procedure.  
 * From it he discovered the mathematics of non-linear systems and established 
 * the Feigenbaum constant, a number which deserves as much respect as π or e
 * for its fundamental nature. 
 *
 * Can you find iterations that tend to 0? to infinity? to a constant? 
 * Can you find iterations that repeat two numbers or four numbers or more?
 * Can you find iterations that (apparently) never repeat?
 * How about three nunbers or five numbers? 
 * 
 */
float r;
float x;
float y;
float xGap;
float yGap;
float graphLeft;
float graphRight;
float graphBottom;
float graphTop;
float xStep;
float startX;
float xin;
float yout;
ArrayList<Float> feigenValues;
boolean stepping = false;
PFont displayFont;
Rectangle2D.Float horizontalClicker;
Rectangle2D.Float verticalClicker;
Rectangle2D.Float functionClicker;
// Control Panel
ControlP5 controlP5;
ControlGroup settings;
Tab settingsTab;


public void setup() {
  // size(600, 800);
  size(360, 480);    // for openProcessing
  smooth();   
  xGap = width/30;
  yGap = height/40;
  graphLeft = -0.25f;
  graphRight = 1.25f;
  graphBottom = -0.25f;
  graphTop = 1.75f;
  xStep = (graphRight - graphLeft)/width;
  displayFont = createFont("Helvetica", 12);
  feigenValues = new ArrayList<Float>();
  startX = 0.26f;
  xin = startX;
  yout = 0;
  feigenValues.add(xin);
  r = 4;
  controlP5 = new ControlP5(this);
  loadPanel();
  printHelp();
}

public void draw() {
  background(255);
  showGraph();
  checkMouseLoc();
  if (feigenValues.size() > 1) {
    float px1, py1, px2, py2, px3, py3;
    float x1 = feigenValues.get(0);
    float y1 = 0;
    float x2 = x1;
    float y2 = feigenValues.get(1);
    float x3 = y2;
    float y3 = y2;
    px1 = mapX(x1);
    py1 = mapY(y1);
    px2 = px1;
    py2 = mapY(y2);
    px3 = mapX(x3);
    py3 = mapY(y3);
    stroke(240, 60, 120);
    strokeWeight(1.0f);
    line(px1, py1, px2, py2);
    line(px2, py2, px3, py3);
    for (int i = 1; i < feigenValues.size() - 1; i++) {
      x1 = feigenValues.get(i);
      y1 = x1;
      x2 = x1;
      y2 = feigenValues.get(i + 1);
      x3 = y2;
      y3 = y2;
      px1 = mapX(x1);
      py1 = mapY(y1);
      px2 = px1;
      py2 = mapY(y2);
      px3 = mapX(x3);
      py3 = mapY(y3);
      if (((int) i / 512.0f) % 2 == 1) {
        stroke(240, 200, 30);
      }
      if (((int) i / 512.0f) % 2 == 0) {
        stroke(240, 60, 120);
      }
      line(px1, py1, px2, py2);
      line(px2, py2, px3, py3);
    }
  }
}

public void mousePressed() {
  if (horizontalClicker.contains(mouseX, mouseY)) {
    float newXin = inverseMapX(mouseX);
    Numberbox n2 = (Numberbox) controlP5.controller("setXin");
    n2.setValue(newXin);
    stepFigtree8();
  }
  if (verticalClicker.contains(mouseX, mouseY)) {
    float newR = inverseMapY(mouseY) * 4;
    Numberbox n1 = (Numberbox) controlP5.controller("setR");
    n1.setValue(newR);
  }
}

public void mouseDragged() {
  if (horizontalClicker.contains(mouseX, mouseY)) {
    float newXin = inverseMapX(mouseX);
    Numberbox n2 = (Numberbox) controlP5.controller("setXin");
    n2.setValue(newXin);
    stepFigtree8();
  }
  if (verticalClicker.contains(mouseX, mouseY)) {
    float newR = inverseMapY(mouseY) * 4;
    Numberbox n1 = (Numberbox) controlP5.controller("setR");
    n1.setValue(newR);
  }
  if (functionClicker.contains(mouseX, mouseY)) {
    float newR = inverseMapY(mouseY) * 4;
    Numberbox n1 = (Numberbox) controlP5.controller("setR");
    n1.setValue(newR);
  }
}

public void checkMouseLoc() {
  if (horizontalClicker.contains(mouseX, mouseY)) {
    cursor(HAND);
  }
  else if (verticalClicker.contains(mouseX, mouseY)) {
    cursor(HAND);
  }
  else if (functionClicker.contains(mouseX, mouseY)) {
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  } 
}

public void printHelp() {
  println("\nExplore the iterated function y = r * x * (x - 1)");
  println("Press and drag on the x-axis to set initial x-input");
  println("Press and drag on the y-axis or top of curve to set initial r value");
  println("You can also use the control panel to set values and iterate the function\n");
}

public void showGraph() {
  drawGrid();
  drawText();
  drawGraph();
}

public void drawGrid() {
  stroke(220);
  strokeWeight(1);
  float xGrid = 0;
  float yGrid = 0;
  while (xGrid < width) {
    xGrid += xGap;
    line(xGrid, 0, xGrid, height);
  }
  while (yGrid < height) {
    yGrid += yGap;
    line(0, yGrid, width, yGrid);
  }
  stroke(160);
  xGrid = 0;
  yGrid = 0;
  float bigXGap = xGap * 5;
  float bigYGap = yGap * 5;
  while (xGrid < width) {
    xGrid += bigXGap;
    line(xGrid, 0, xGrid, height);
  }
  while (yGrid < height) {
    yGrid += bigYGap;
    line(0, yGrid, width, yGrid);
  }
  line(0, height, width, height - width);
  stroke(64);
  strokeWeight(2);
  line(bigXGap, 0, bigXGap, height);
  line(0, height - bigYGap, width, height - bigYGap);
  if (null == horizontalClicker) {
    horizontalClicker = new Rectangle2D.Float(0, height - bigYGap - 8, width, 16);
  }
  if (null == verticalClicker) {
    verticalClicker = new Rectangle2D.Float(bigXGap - 8, bigYGap, 16, height - 2.5f * bigYGap);
  }
  if (null == functionClicker) {
    float ctr = mapX(0.5f);
    float top = mapY(r * 0.25f);
    println("-- ctr = "+ ctr +", top = "+ top +", r = "+ r);
    functionClicker = new Rectangle2D.Float(ctr, top, 64, 64);
  }
}

public void drawText() {
  smooth();
  float margin = 3;
  float bigXGap = xGap * 5;
  float bigYGap = yGap * 5;
  fill(0);
  textFont(displayFont, 12);
  float tw = textWidth("0");
  text("0", bigXGap - tw - margin, height - bigYGap + g.textLeading);
  tw = textWidth("0.25");
  text("0.25", 2 * bigXGap - tw - margin, height - bigYGap + g.textLeading);
  tw = textWidth("0.5");
  text("0.5", 3 * bigXGap - tw - margin, height - bigYGap + g.textLeading);
  tw = textWidth("0.75");
  text("0.75", 4 * bigXGap - tw - margin, height - bigYGap + g.textLeading);
  tw = textWidth("1.0");
  text("1.0", 5 * bigXGap - tw - margin, height - bigYGap + g.textLeading);
}

public void drawGraph() {
  smooth();
  stroke(60, 0, 240);
  strokeWeight(1.0f);
  x = graphLeft;
  y = height - r * x * (1 - x);
  float px = mapX(x);
  float py = mapY(y);
  float prevPx = px;
  float prevPy = py;
  for (int i = 0; i < width; i++) {
    x = i * xStep + graphLeft;
    y = r * x * (1 - x);
    px = mapX(x);
    py = mapY(y);
    line(prevPx, prevPy, px, py);
    point(px, py);
    prevPx = px;
    prevPy = py;
  }
}

public float mapX(float x) {
  return map(x, graphLeft, graphRight, 0, width);
}

public float inverseMapX(float x) {
  return map(x, 0, width, graphLeft, graphRight);
}

public float mapY(float y) {
  return height - map(y, graphBottom, graphTop, 0, height);
}

public float inverseMapY(float y) {
  return map(height - y, 0, height, graphBottom, graphTop);
}

/** Control Panel Methods **/

// TODO control panel
/**
 * Sets up the control panel.
 */
public void loadPanel() {
  int panelBack = color(123, 123, 144, 255);
  int settingsWidth = 270;
  int yPos = 4;
  int step = 18;
  int widgetH = 14;
  int labelW = 144;
  int panelHeight = 80;
  settings = controlP5.addGroup("Global Settings", 4, 20, settingsWidth);
  settings.setBackgroundColor(panelBack);
  settings.setBackgroundHeight(panelHeight);
  settings.setBarHeight(widgetH);
  settings.setMoveable(true);     // option-drag on bar to move menu
  // add widgets
  // r
  Numberbox n1 = controlP5.addNumberbox("setR", r, 8, yPos, 100, widgetH);
  n1.setGroup(settings);
  n1.setMultiplier(0.001f);
  n1.setDecimalPrecision(3);
  n1.setMin(0.25f);
  n1.setMax(6.0f);
  n1.setLabel("");
  // label for r number box
  Textlabel l1 = controlP5.addTextlabel("rLabel", "R ", 112, yPos + 4);
  l1.setGroup(settings);
  // xin
  yPos += step;
  Numberbox n2 = controlP5.addNumberbox("setXin", xin, 8, yPos, 100, widgetH);
  n2.setGroup(settings);
  n2.setMultiplier(0.001f);
  n2.setDecimalPrecision(3);
  n2.setMin(-0.25f);
  n2.setMax(1.0f);
  n2.setLabel("");
  // label for xinc number box
  Textlabel l2 = controlP5.addTextlabel("xinLabel", "X INPUT ", 112, yPos + 4);
  l2.setGroup(settings);
  yPos += step;
  Button b1 = controlP5.addButton("stepFigtree", 0, 8, yPos, 76, widgetH);
  b1.setGroup(settings);
  b1.setLabel("Step");
  Button b2 = controlP5.addButton("stepFigtree8", 0, settingsWidth/3 + 4, yPos, 76, widgetH);
  b2.setGroup(settings);
  b2.setLabel("Step 8");
  Button b3 = controlP5.addButton("stepFigtree64", 0, 2 * settingsWidth/3 + 4, yPos, 76, widgetH);
  b3.setGroup(settings);
  b3.setLabel("Step 64");
  // next row of buttons
  yPos += step;
  Button b4 = controlP5.addButton("clearFigtree", 0, 8, yPos, 76, widgetH);
  b4.setGroup(settings);
  b4.setLabel("Clear");
  Button b5 = controlP5.addButton("printFigtree", 0, settingsWidth/3 + 4, yPos, 76, widgetH);
  b5.setGroup(settings);
  b5.setLabel("Print");
  Button b6 = controlP5.addButton("printFigtreeLast32", 0, 2 * settingsWidth/3 + 4, yPos, 76, widgetH);
  b6.setGroup(settings);
  b6.setLabel("Print last 32");
  // finish
  settings.moveTo("global");
  settingsTab = controlP5.tab("default");
  settingsTab.activateEvent(true);
  settingsTab.setLabel("Flock Settings");
  settingsTab.setId(1);
}

public void setR(float value) {
  r = value;
  // int count = feigenValues.size();
  clearFigtree();
  //        for (int i = 0; i < count; i++) {
  //          stepFigtree();
  //        }
  stepFigtree8();
  functionClicker.setRect(mapX(0.5f) - 32, mapY(r * 0.25f) - 32, 64, 64);
}

public void setXin(float value) {
  startX = value;
  xin = startX;
  clearFigtree();
}

public void stepFigtree() {
  // set xin to the most recently added value in the list
  xin = feigenValues.get(feigenValues.size() - 1);
  // execute our parabola function f(x) = r * x * (x - 1)
  yout = r * xin * (1 - xin);
  // put the result into the list
  feigenValues.add(yout);
}

public void stepFigtree8() {
  for (int i = 0; i < 8; i++) {
    xin = feigenValues.get(feigenValues.size() - 1);
    yout = r * xin * (1 - xin);
    feigenValues.add(yout);
  }
}

public void stepFigtree64() {
  for (int i = 0; i < 64; i++) {
    xin = feigenValues.get(feigenValues.size() - 1);
    yout = r * xin * (1 - xin);
    feigenValues.add(yout);
  }
}

public void printFigtree() {
  println();
  for (Float val : feigenValues) {
    println(val);
  }
}

public void printFigtreeLast32() {
  println();
  int count = feigenValues.size();
  if (count < 32) printFigtree();
  else {
    for (int i = count - 32; i < count; i++) {
      float val = feigenValues.get(i);
      println(val);
    }
  }
}

public void clearFigtree() {
  stepping = false;
  feigenValues.clear();
  feigenValues.add(startX);
}


