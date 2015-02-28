
import guicomponents.*;

final float DOMAIN_SIZE = 640;
final float MIN_COL_RAD = 2.0f;
final float MAX_COL_RAD = 5.0f;

final int NBR_OBJECTS = 50;
final int MAX_OBJECTS_IN_PARTITION = 2;

final int MAX_LEVEL = 4;
final int MAX_LEVEL_AVAILABLE = 6;

QuadPartition abox;
Quadtree qt;
GameObject anObject;

LinkedList<QuadPartition> partitions = new LinkedList<QuadPartition>();

int[] levelColor, levelBlack, useColor;

boolean displayPartitions = true;
boolean displayStats = true;

long currTime, lastTime, elapsedTime;
long startTimeFPS, frameNo;
float eTimeSeconds;
float avgFPS;

boolean statLock = false;

PFont font1, font2;

GWindow controller;
GCheckbox showParts, showStats;
GWSlider sdrMinCR, sdrMaxCR, sdrMaxLevel, sdrMaxOcc;
GButton btnResetFPS, btnNewTree;
GTextField txfNbrObjects;
GLabel lblNbrObjs, lblMinCR, lblMaxCR, lblMaxOcc1, lblMaxOcc2, lblMaxLevel;

 
void setup() {
  size(680,680, JAVA2D);
  if(frame != null) {
    frame.setTitle("Quadtree demonstrator                         (c) Peter Lager 2011");
    frame.setLocation(500, 20);
  }
  font1 = loadFont("CourierNewPSMT-48.vlw");
  font2 = loadFont("ArialMT-48.vlw");
  calcLevelColors();
  smooth();

  // Create the initial Quadtree
  qt = Quadtree.makeQuadtree(0.0f, 0.0f, DOMAIN_SIZE, MAX_OBJECTS_IN_PARTITION, MAX_LEVEL, NBR_OBJECTS, MIN_COL_RAD, MAX_COL_RAD);

  G4P.setColorScheme(this, GCScheme.BLUE_SCHEME);
  G4P.setFont(this, "Arial", 16);

  controller = new GWindow(this,"Quadtree controller", 10, 10, 400, 700, false, JAVA2D);
  controller.addDrawHandler(this, "ctrlDraw");
  controller.papplet.frameRate(15);
  controller.papplet.cursor(HAND);
  controller.papplet.smooth();

  showParts = new GCheckbox(this, "Show Partitions", 150, 138, 100);
  showParts.setSelected(displayPartitions);
  showParts.localFont = GFont.getFont(this, "Arial", 14);
  controller.add(showParts);
  showStats = new GCheckbox(this, "Show Graph", 280, 138, 100);
  showStats.setSelected(displayStats);
  showStats.localFont = GFont.getFont(this, "Arial", 14);
  controller.add(showStats);

  btnResetFPS = new GButton(this, "Reset FPS", 20, 134, 110, 22);
  controller.add(btnResetFPS);

  // Number of objects
  txfNbrObjects = new GTextField(this, "" + NBR_OBJECTS, 280, 340, 60,20);
  controller.add(txfNbrObjects);

  lblNbrObjs = new GLabel(this, "Number of Objects (1-1000)", 70, 340, 300,20);
  controller.add(lblNbrObjs);

  // Min col radius	
  lblMinCR = new GLabel(this, "Min col radius", 20, 396, 100, 20);
  controller.add(lblMinCR);

  sdrMinCR = new GWSlider(this, 150,400, 220);
  sdrMinCR.setValueType(GSlider.DECIMAL);
  sdrMinCR.setPrecision(1);
  sdrMinCR.setLimits(MIN_COL_RAD, 2.0f, 10.0f);
  sdrMinCR.setRenderMaxMinLabel(true);
  sdrMinCR.setTickCount(16);
  sdrMinCR.setStickToTicks(true);
  controller.add(sdrMinCR);


  // Max col radius	
  lblMaxCR = new GLabel(this, "Max col radius", 20, 456, 100, 20);
  controller.add(lblMaxCR);

  sdrMaxCR = new GWSlider(this, 150,460, 220);
  sdrMaxCR.setValueType(GSlider.DECIMAL);
  sdrMaxCR.setPrecision(1);
  sdrMaxCR.setLimits(MAX_COL_RAD, 2.0f, 10.0f);
  sdrMaxCR.setRenderMaxMinLabel(true);
  sdrMaxCR.setTickCount(16);
  sdrMaxCR.setStickToTicks(true);
  controller.add(sdrMaxCR);

  // Max occupancy	
  lblMaxOcc1 = new GLabel(this, "Max nbr objects", 20, 506, 140, 20);
  controller.add(lblMaxOcc1);
  lblMaxOcc2 = new GLabel(this, "in partition", 20, 526, 100, 20);
  controller.add(lblMaxOcc2);

  sdrMaxOcc = new GWSlider(this, 150,520, 220);
  sdrMaxOcc.setValueType(GSlider.INTEGER);
  sdrMaxOcc.setLimits(MAX_OBJECTS_IN_PARTITION, 0, 10);
  sdrMaxOcc.setRenderMaxMinLabel(true);
  sdrMaxOcc.setTickCount(10);
  sdrMaxOcc.setStickToTicks(true);
  controller.add(sdrMaxOcc);

  // Max levels	
  lblMaxLevel = new GLabel(this, "Max level number", 20, 576, 130, 20);
  controller.add(lblMaxLevel);

  sdrMaxLevel = new GWSlider(this, 150,580, 220);
  sdrMaxLevel.setValueType(GSlider.INTEGER);
  sdrMaxLevel.setLimits(MAX_LEVEL, 0, 6);
  sdrMaxLevel.setRenderMaxMinLabel(true);
  sdrMaxLevel.setTickCount(6);
  sdrMaxLevel.setStickToTicks(true);
  controller.add(sdrMaxLevel);

  this.btnNewTree = new GButton(this,"New Simulation", 30,630,340,20);
  controller.add(btnNewTree);

  rectMode(CORNERS);
  ellipseMode(CENTER);
  stroke(0);
  strokeWeight(2.0f);
  startTimeFPS = currTime = lastTime = millis();
  frameNo = 0;
  frameRate(1000);
}

void draw() {
  background(160);

  currTime = millis();
  elapsedTime = currTime - lastTime;
  eTimeSeconds = elapsedTime / 1000.0f;
  frameNo++;
  avgFPS = frameNo / ((currTime - startTimeFPS) * 0.001f);
  lastTime = currTime;

  // Update positions of all nodes based on velocity and elapsed time
  for(int i = 0; i < qt.allObjects.size(); i++) {
    anObject = qt.allObjects.get(i);
    anObject.update(eTimeSeconds);
  }

  //	get statistics - only required for this demo
  if(statLock == false) {
    statLock = true;	
    qt.getStats();
    statLock = false;
  }

  // Perform collision detection
  qt.performCollisionDetection();

  // Get partitions to display if needed
  partitions.clear();
  if(this.displayPartitions) {
    qt.getListOfPartitions(qt.root, partitions);
    Collections.sort(partitions);
  }
  else {
    partitions.add(qt.root);
  }

  // Start of display code
  pushMatrix();
  this.translate(20,20);

  // Display partitions.
  for(int i = 0; i < partitions.size(); i++) {
    abox = partitions.get(i);
    fill(levelColor[abox.level]);
    rect(abox.lowX, abox.lowY, abox.highX, abox.highY);
  }

  // Set stroke and weight for displaying nodes
  strokeWeight(1.0f);
  if(displayPartitions)
    useColor = levelColor;
  else
    useColor = levelBlack;
  // Display nodes
  for(int i = 0; i < qt.allObjects.size(); i++) {
    anObject = qt.allObjects.get(i);
    fill(useColor[anObject.qp.level]);
    ellipse(anObject.pos.x, anObject.pos.y, 2*anObject.colRad, 2*anObject.colRad);
  }
  popMatrix();
}

void ctrlDraw(GWinApplet wapp, GWinData data) {
  wapp.background(128,128,255);
  wapp.fill(160,160,255);
  wapp.stroke(32,32,255);
  wapp.strokeWeight(3.0f);
  wapp.rect(10,330,380,346);
  if(statLock == false) {
    statLock = true;
    displayBasicData(wapp,10,10);
    if(displayStats) {
      displayAccupancyGraph(wapp, 36,170);
    }
    statLock = false;
  }
}

public void handleTextFieldEvents(GTextField textfield) {
  int n = 10;
  textfield.localColor.txfFont = color(0);
  try {
    n = Integer.parseInt(textfield.getText());
    if(n < 1 || n > 1000)
      textfield.localColor.txfFont = color(255,0,0);
  }
  catch(Exception excp) {
    textfield.localColor.txfFont = color(255,0,0);
  }
}

public void handleSliderEvents(GSlider slider) { 
  if(slider == sdrMinCR) {
    if(slider.isValueChanging()) {
      if(slider.getValuef() > sdrMaxCR.getValuef())
        sdrMaxCR.setValue(slider.getValuef());
    }
  }
  if(slider == sdrMaxCR) {
    if(slider.isValueChanging()) {
      if(slider.getValuef() < sdrMinCR.getValuef())
        sdrMinCR.setValue(slider.getValuef());
    }
  }
}

void handleButtonEvents(GButton button) { 
  if(button == btnResetFPS) {
    currTime = lastTime = millis();
    startTimeFPS = currTime - 1;
    frameNo = 0;
  }
  if(button == this.btnNewTree) {
    noLoop();
    int newNbrNodes = 10;
    try {
      newNbrNodes = Integer.parseInt(txfNbrObjects.getText());
    }
    catch(Exception excp) {
      newNbrNodes = 10;
    }
    newNbrNodes = PApplet.constrain(newNbrNodes, 10, 1000);
    txfNbrObjects.setText("" + newNbrNodes);
    txfNbrObjects.localColor.txfFont = color(0);
    float newMinColRad = fixRadius(sdrMinCR.getValuef());
    float newMaxColRad = fixRadius(sdrMaxCR.getValuef());
    int newMaxLevel = sdrMaxLevel.getValue();
    int newMaxOcc = sdrMaxOcc.getValue();
    Math.round(4.9f);
    Quadtree nextTree = Quadtree.makeQuadtree(0.0f, 0.0f, DOMAIN_SIZE, newMaxOcc, newMaxLevel, newNbrNodes, newMinColRad, newMaxColRad);
    qt = nextTree;
    loop();
  }
}

float fixRadius(float radius) {
  return ((int)(radius * 10 + 0.5f)) / 10.0f;
}

void displayBasicData(GWinApplet wapp, int px, int py) {
  wapp.pushMatrix();
  wapp.translate(px,py);
  wapp.fill(0,0,32);
  wapp.stroke(255);
  wapp.rect(0,0,380,110);
  wapp.fill(220,220,255);
  wapp.textFont(font2, 14);
  wapp.text("Nbr objects", 4, 20 );
  wapp.text("Size", 200, 20 );
  wapp.text("Nbr collision tests", 4, 40 );
  wapp.text("% of worst case", 200, 40 );
  wapp.text("X * f(n)            X =", 200, 60 );
  wapp.text("Nbr collisions", 4, 60 );
  wapp.text("Max occupancy", 4, 80 );
  wapp.text("Nbr partitions", 200, 80 );
  wapp.text("Average FPS", 4, 100 );
  wapp.text("Min size", 200, 100 );

  wapp.fill(255);
  wapp.text(qt.nbrObjects, 130,20);
  wapp.text(nf(qt.minColRad,1,1) + "  >  " +nf(qt.maxColRad,1,1), 260,20);

  wapp.text(qt.nbrTests, 130,40);
  wapp.text(nf(qt.pcWorstCase,3,1), 310,40);
  wapp.text(nf( ((float)qt.nbrTests) / qt.nbrObjects,5,2), 310,60);
  wapp.text(qt.nbrCollisions, 130, 60);
  wapp.text(qt.maxOccupancy + "  ("+qt.maxObjects+")", 130, 80);
  wapp.text(qt.nbrPartitions, 310,80);
  wapp.text(nfs(avgFPS,3,1), 130, 100);
  wapp.text(nf((int)qt.minSize,3), 310, 100);
  wapp.popMatrix();
}

void displayAccupancyGraph(GWinApplet wapp, int px, int py) {
  wapp.textFont(font1,16);
  wapp.pushMatrix();
  wapp.translate(px,py);
  wapp.fill(255,255,255);
  wapp.noStroke();
  wapp.rect(20,0,300, 20 * MAX_LEVEL_AVAILABLE + 20);
  int[] barCols = levelBlack;
  if(displayPartitions)
    barCols = levelColor ;
  for(int i = 0; i <= MAX_LEVEL_AVAILABLE; i++ ) {
    if(i <= qt.maxLevel) {
      wapp.fill(barCols[i]);
      wapp.rect(20, 20 * i, 3f * qt.occupancyByLevel[i], 20);
    }
    else {
      wapp.fill(128,0,0);
      wapp.rect(20, 20 * i, 300, 20);
    }
  }
  wapp.fill(0);
  for(int i = 0; i <= MAX_LEVEL_AVAILABLE; i++ ) {
    wapp.text("" + i, 6, i* 20 + 16);
  }
  wapp.stroke(0);
  wapp.strokeWeight(1.0f);
  wapp.noFill();
  for(int i = 0; i <= qt.maxLevel; i++ ) {
    wapp.rect(20, 20 * i, 300, 20);
  }
  wapp.popMatrix();
}

void handleCheckboxEvents(GCheckbox checkbox) {
  if(checkbox == showParts) {
    this.displayPartitions = checkbox.isSelected();
  }
  if(checkbox == showStats) {
    this.displayStats = checkbox.isSelected();
  }
}

void calcLevelColors() {
  levelColor = new int[10];
  levelBlack = new int[10];
  colorMode(HSB,1,1,1);
  for(int i = 0; i <= MAX_LEVEL_AVAILABLE; i++)
    levelColor[i] = color(0.02f + 0.12f * i,0.6f,1.0f);
  for(int i = 0; i <= MAX_LEVEL_AVAILABLE; i++)
    levelBlack[i] = levelColor[0];
  colorMode(RGB,255,255,255);
}


