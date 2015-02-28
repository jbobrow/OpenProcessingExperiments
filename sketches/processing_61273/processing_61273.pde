
lsystem tester;
PGraphics renderFrame;

void setup() {

  size(960, 540, JAVA2D);

  tester = new lsystem();

  NewTester();

  renderFrame = createGraphics(960, 540, JAVA2D);

  gui = new ArrayList();
  gui.clear();

  //gui.add(new guiElement(ELEMENT_BUTTON, "Reset All", 0.0, 1.0, 0.0, 10, 10, 100, 100, 0, 0, 255));

  gui.add(new guiElement(ELEMENT_SLIDER, "system size", 1024, 4096, 2048, width-102, 0, 100, 20, 132, 242, 0));  
  gui.add(new guiElement(ELEMENT_SLIDER, "rule length", 16, 384, 96, width-102, 22, 100, 20, 132, 242, 0));
  gui.add(new guiElement(ELEMENT_SLIDER, "# colors", 4.0, 32.0, 6.0, width-102, 44, 100, 20, 0, 242, 0));  

  gui.add(new guiElement(ELEMENT_SLIDER, "rotate display", 0.0, 360.0, 33.0, 0, height-44, 100, 20, 132, 242, 0));  
    
  gui.add(new guiElement(ELEMENT_SLIDER, "scale", 0.0, 50.0, 28.0, 0, height-22, 318, 20, 255, 255, 0));
  gui.add(new guiElement(ELEMENT_SLIDER, "alpha", 0.0, 256.0, 196.0, 320, height-22, 318, 20, 255, 255, 255));    
  gui.add(new guiElement(ELEMENT_SLIDER, "angle", 0.0, 360.0, 90.0, 640, height-22, 318, 20, 0, 242, 132));
  
  gui.add(new guiElement(ELEMENT_BUTTON, " 90", 0.0, 1.0, 0.0, width-42, height-66, 40, 20, 232, 33, 0));  
  gui.add(new guiElement(ELEMENT_BUTTON, "120", 0.0, 1.0, 0.0, width-42, height-44, 40, 20, 232, 33, 0));    

  gui.add(new guiElement(ELEMENT_BUTTON, "new colors", 0.0, 1.0, 0.0, 0, 44, 100, 20, 33, 33, 255));  
  gui.add(new guiElement(ELEMENT_BUTTON, "new system", 0.0, 1.0, 0.0, 0, 22, 100, 20, 33, 33, 255));  
  gui.add(new guiElement(ELEMENT_BUTTON, "new both", 0.0, 1.0, 0.0, 0, 0, 100, 20, 33, 33, 255));
  

  //gui.add(new guiElement(ELEMENT_BUTTON, "Save!", 0.0, 1.0, 0.0, 350, 100, 40, 40, 232, 33, 0));  

  // activate all buttons
  for (int i = 0; i < gui.size(); i++) {
    guiElement thisElement = (guiElement) gui.get(i);
    thisElement.ACTIVATE = true;    
  }  

  //println(gui.size());

  tester.FillVertexList();
  tester.DrawFractal(tester.displayScale, renderFrame);
}
void draw() {

  background(0);
  // button actions
  buttonActions();

  image(renderFrame, 0, 0, 960, 540);

  for (int i = 0; i < gui.size(); i++) {
    guiElement thisElement = (guiElement) gui.get(i);
    thisElement.Tick();
    thisElement.Display();
  }
}

void keyPressed() {
  if (key == 's') {
    renderFrame.save(nf(frameCount, 6)+".tga");
  }

  if (key == '1') {
    tester.CreateInitialColors(tester.numberOfColors);
    tester.FillVertexList();
    tester.DrawFractal(tester.displayScale, renderFrame);
  }
}

void mouseDragged() {

  // safely move the system's offset
  boolean notButton = true;
  for (int i = 0; i < gui.size(); i++) {
    guiElement thisElement = (guiElement) gui.get(i);
    if (thisElement.isMouseOver) notButton = false;
  }

  if (notButton) {    
    tester.drawOffsetX = mouseX;
    tester.drawOffsetY = mouseY;
    tester.DrawFractal(tester.displayScale, renderFrame);
  }
}


void mousePressed() {
  
  // safely move the system's offset
  boolean notButton = true;
  for (int i = 0; i < gui.size(); i++) {
    guiElement thisElement = (guiElement) gui.get(i);
    if (thisElement.isMouseOver) notButton = false;
  }

  if (notButton) {    
    tester.drawOffsetX = mouseX;
    tester.drawOffsetY = mouseY;
    tester.DrawFractal(tester.displayScale, renderFrame);
  }  
  
}

void mouseReleased() {
  for (int i = 0; i < gui.size(); i++) {
    guiElement thisElement = (guiElement) gui.get(i);
    if (thisElement.elementType!=ELEMENT_SLIDER) {
      thisElement.DEBOUNCE = false;
    }
  }
}

void NewTester() {
  tester.RandomSetup();
}

class lsystem {

  // GUI controlled Variables

  int ruleSize;

  int numberOfColors;
  float alphaLevel;
  float masterRotate;
    
  float displayScale;
  float angleChange;  

  int LIMIT_stringSize;  // performance related
  int LIMIT_vertexSize;

  int drawOffsetX, drawOffsetY;

  /////////////////////////////////////////////////////////      
  String original;  // starting rule string
  String subRule;   // substitution string
  String subTarget; // token that initiates substitution
  String processed; // final string

  ArrayList allColors;  // (PVector) master stack of colors
  ArrayList vertexList;  // created from the processed string  
  ArrayList colorList;   // paired with vertex list
  ArrayList stateStack;  // list of PVector()'s in the form of .xy = xy, .z = angle
  ArrayList colorStack;

  PGraphics exportBuffer;
  int exportMultiplier;

  /*
  
   F - forward, move turtle
   - - left
   +- right
   [ - push
   ] - pop
   
   */

  lsystem() {

    drawOffsetX = width/2;
    drawOffsetY = height/2;
    
    ruleSize = 96;
    numberOfColors = 6;
    alphaLevel = 128;
    masterRotate = 33.0;
    
    LIMIT_stringSize = 1024;
    LIMIT_vertexSize = 1024;

    angleChange = 90;
    displayScale = 10.0;

    original = "";
    processed = "";

    subRule = "";
    subTarget = "F";

    vertexList = new ArrayList();
    colorList = new ArrayList();

    stateStack = new ArrayList();
    colorStack = new ArrayList();
  }

  void CreateInitialColors(int _numberOfColors) {

    allColors = new ArrayList();

    for (int i = 0; i < _numberOfColors; i++) {
      allColors.add(new PVector(random(255), random(255), random(255)));
    }
  }

  void RandomSetup() {

    CreateInitialColors(numberOfColors);
    CreateRandomRule(ruleSize);    
    ApplyRules();
    
  }


  void CreateRandomRule(int _length) {

    original = "";

    for (int i = 0 ; i < _length; i++) {

      int picker = (int)random(9);
      switch(picker) {
      case 0: 
        original+=("F");
        break;
      case 1: 
        original+=("L");
        break;
      case 2: 
        original+=("R");
        break;
      case 3: 
        original+=("[");
        break;
      case 4: 
        original+=("]");
        break;
      case 5: 
        original+=("N");
        break;
      case 6: 
        original+=("C");
        break;
      case 7: 
        original+=("c");
        break;
      default:
        original+=("F");
        break;
      }
    }

    //println(original);
  }
  void CreateRandomSub(int _length) {

    subRule = "";

    for (int i = 0 ; i < _length; i++) {

      int picker = (int)random(9);
      switch(picker) {
      case 0: 
        subRule+=("F");
        break;
      case 1: 
        subRule+=("L");
        break;
      case 2: 
        subRule+=("R");
        break;
      case 3: 
        subRule+=("[");
        break;
      case 4: 
        subRule+=("]");
        break;
      case 5: 
        subRule+=("N");
        break;
      case 6: 
        subRule+=("C");
        break;
      case 7: 
        subRule+=("c");
        break;
      }
    }
  }

  void ApplyRules() {

    int vertexCount = 0;

    processed = original;
    subRule = original;

    int escapeCount = 0;

    while (processed.length () < LIMIT_stringSize && vertexCount < LIMIT_vertexSize) {
      vertexCount = 0;
      for (int i = 0; i < processed.length(); i++) {
        if (processed.substring(i, i+1).equals("F")) vertexCount++;
      }

      String[] buffer = new String[processed.length()];
      for (int i = 0; i < processed.length(); i++) {
        if (processed.charAt(i) == subTarget.charAt(0)) {
          buffer[i] = subRule;
        }
        else {
          buffer[i] = processed.substring(i, i+1);
        }
      }
      processed = join(buffer, "");
      
      
      escapeCount++;
      if(escapeCount > LIMIT_vertexSize * 10){ break; }
    }

    // count vertexes
    //println(vertexCount);
  }

  void FillVertexList() {

    vertexList.clear();
    stateStack.clear();

    colorList.clear();
    colorStack.clear();

    PVector currentState = new PVector(0.0, 0.0, 0.0);  // position

    int currentColorIndex = 0;    
    PVector currentColor = (PVector) allColors.get(currentColorIndex);  // color

    float distance = 1.0;    

    for (int i = 0; i < processed.length(); i++) {

      if (processed.substring(i, i+1).equals("F")) {        
        // move the position
        currentState.x += cos(radians(currentState.z))*distance;
        currentState.y += sin(radians(currentState.z))*distance;

        // add a new vertex at this new position
        vertexList.add(new PVector(currentState.x, currentState.y, 0.0));        
        colorList.add(new PVector(currentColor.x, currentColor.y, currentColor.z));
      }      
      if (processed.substring(i, i+1).equals("L")) {        
        currentState.z += angleChange;
      }
      if (processed.substring(i, i+1).equals("R")) {        
        currentState.z -= angleChange;
      }

      // position state stack
      if (processed.substring(i, i+1).equals("[")) {
        stateStack.add(new PVector(currentState.x, currentState.y, currentState.z));
      }
      if (processed.substring(i, i+1).equals("]")) {
        if (stateStack.size() > 1) {
          stateStack.remove(stateStack.size()-1);
          if (stateStack.size() > 0) {
            PVector thisState = (PVector) stateStack.get(stateStack.size()-1);

            currentState.x = thisState.x;
            currentState.y = thisState.y;
            currentState.z = thisState.z;
          }
        }
      }

      // color state stack
      if (processed.substring(i, i+1).equals("N")) {
        currentColorIndex++;
        if (currentColorIndex >= allColors.size()) {
          currentColorIndex = 0;
        }
        PVector thisColor = (PVector) allColors.get(currentColorIndex);
        currentColor.set(thisColor.x, thisColor.y, thisColor.z);
      }
      if (processed.substring(i, i+1).equals("C")) {
        colorStack.add(new PVector(currentColor.x, currentColor.y, currentColor.z));
      }
      if (processed.substring(i, i+1).equals("c")) {
        if (colorStack.size() > 1) {
          colorStack.remove(colorStack.size()-1);
          if (colorStack.size() > 0) {
            PVector thisColor = (PVector) colorStack.get(colorStack.size()-1);
            currentColor.x = thisColor.x;
            currentColor.y = thisColor.y;
            currentColor.z = thisColor.z;
          }
        }
      }
    }
  }

  void DrawFractal(float _scale, PGraphics target) {
    target.beginDraw();

    target.background(0);
    target.noStroke();
    target.smooth();

    target.pushMatrix();
    
    target.translate(drawOffsetX, drawOffsetY);
    target.rotate(radians(masterRotate));
    
    target.beginShape(TRIANGLE_STRIP);    
    for (int i = 0; i < vertexList.size(); i++) {

      PVector thisVertex = (PVector) vertexList.get(i);
      PVector thisColor = (PVector) colorList.get(i);
      target.fill(thisColor.x, thisColor.y, thisColor.z, alphaLevel);      
      target.vertex(thisVertex.x*_scale, thisVertex.y*_scale);
    }

    target.endShape();
    target.popMatrix();
    target.endDraw();
  }  // end DrawFractal()
}

void buttonActions() {
  // wayyyyy ugly
  // where the buttons act on the global variables in 
 
  boolean bActivity = false; 
 
  for (int i = 0; i < gui.size(); i++) {
    guiElement thisElement = (guiElement) gui.get(i);
    if (thisElement.ACTIVATE) {
      bActivity = true;
      // BUTTONS
      if (thisElement.label.equals("Reset All")) {
        //println(thisElement.label+" fired.");
        if (thisElement.actualValue > 0.0) { 
          NewTester(); 
          thisElement.actualValue = 0.0;
        }
      }
      if (thisElement.label.equals(" 90")) {
        if (thisElement.actualValue > 0.0) { 
          tester.angleChange = 90.0;
          thisElement.actualValue = 0.0;        
          //println(thisElement.label+" fired.");
        }
      }
      if (thisElement.label.equals("120")) {
        if (thisElement.actualValue > 0.0) { 
          tester.angleChange = 120.0;
          thisElement.actualValue = 0.0;        
          //println(thisElement.label+" fired.");
        }
      }
      if (thisElement.label.equals("new colors")) {
        if (thisElement.actualValue > 0.0) {
          tester.CreateInitialColors(tester.numberOfColors); 
          thisElement.actualValue = 0.0;        
          //println(thisElement.label+" fired.");
        }
      }
      if (thisElement.label.equals("new system")) {
        if (thisElement.actualValue > 0.0) {
          tester.CreateRandomRule(tester.ruleSize);    
          tester.ApplyRules(); 
          thisElement.actualValue = 0.0;        
          //println(thisElement.label+" fired.");
        }
      }
      if (thisElement.label.equals("new both")) {
        if (thisElement.actualValue > 0.0) {
          tester.RandomSetup();
          thisElement.actualValue = 0.0;        
          //println(thisElement.label+" fired.");
        }
      }
      
      // SLIDERS
      if (thisElement.label.equals("scale")) {
        tester.displayScale = thisElement.actualValue;
      }
      if (thisElement.label.equals("angle")) {
        tester.angleChange = thisElement.actualValue;
      }
      if (thisElement.label.equals("rotate display")) {
        tester.masterRotate = thisElement.actualValue;
      }
      if (thisElement.label.equals("alpha")) {
        tester.alphaLevel = thisElement.actualValue;
      }
      if (thisElement.label.equals("system size")) {
        tester.LIMIT_stringSize = int(thisElement.actualValue);
        tester.LIMIT_vertexSize = int(thisElement.actualValue);
      }
      if (thisElement.label.equals("rule length")) {
        tester.ruleSize = int(thisElement.actualValue);
      }
      if (thisElement.label.equals("# colors")) {
        tester.numberOfColors = int(thisElement.actualValue);
        //println(int(thisElement.actualValue));
        tester.CreateInitialColors(tester.numberOfColors);
      }               
      thisElement.ACTIVATE = false;
    }
    else {                     
    }
  }
  
  if(bActivity){
    tester.FillVertexList();
    tester.DrawFractal(tester.displayScale, renderFrame);
  }  
  
}
final int ELEMENT_BUTTON = 1;
final int ELEMENT_TOGGLE = 2;
final int ELEMENT_SLIDER = 3;

ArrayList gui;

class guiElement {
  
  int elementType; 
  String label;
  
  int posX, posY, sizeX, sizeY;
  
  int colorR, colorG, colorB;

  float valueMin, valueMax, valueDefault;
  float actualValue;

  boolean isMouseOver;
  boolean ACTIVATE;
  boolean DEBOUNCE;

  guiElement(int _type, String _label, float _min, float _max, float _default, int _posX, int _posY, int _sizeX, int _sizeY, int r, int g, int b){    
    elementType = _type;
    label = _label;    
    SetDimensions(_posX,_posY,_sizeX,_sizeY);
    SetValueRanges(_min,_max,_default);    
    colorR = r;
    colorG = g;
    colorB = b;
    actualValue = _default;
  }
  
  void Tick(){
    isMouseOver = (mouseX > posX && mouseX < (posX+sizeX) && mouseY > posY && mouseY <(posY+sizeY));
    if(isMouseOver && (mousePressed) && !DEBOUNCE && elementType != 3){
      // mouseX determines value
      ACTIVATE = true;
      DEBOUNCE = true;
      float percentageFull = map(mouseX, posX, posX+sizeX, 0.0, 1.0);
      
      if(elementType != ELEMENT_SLIDER){
        percentageFull = 1.0;
      }
      actualValue = percentageFull * valueMax;
      if(actualValue < valueMin){
        actualValue = valueMin;
      }
    }
    else if(isMouseOver && (mousePressed) && !DEBOUNCE && elementType == 3){
      // mouseX determines value
      ACTIVATE = true;
      float percentageFull = map(mouseX, posX, posX+sizeX, 0.0, 1.0);
      
      if(elementType != ELEMENT_SLIDER){
        percentageFull = 1.0;
      }
      actualValue = percentageFull * valueMax;
      if(actualValue < valueMin){
        actualValue = valueMin;
      }      
    }
  }
  
    
  void SetDimensions(int _posX, int _posY, int _sizeX, int _sizeY){
    posX = _posX;
    posY = _posY;
    sizeX = _sizeX;
    sizeY = _sizeY;
  }
  
  void SetValueRanges(float _min, float _max, float _default){
    valueMin = _min;
    valueMax = _max;
    valueDefault = _default;  
  }

  void Display(){
    
    pushMatrix();
    strokeWeight(1.0);
    translate(posX, posY);

    noStroke();       
    fill(255,32);    
    rect(0,0,sizeX,sizeY);
        
    // value itself 

    fill(colorR, colorG, colorB,32);        
    rect(0,0,sizeX*map(actualValue, valueMin, valueMax, 0.0, 1.0), sizeY);
    
    // outline

    if(isMouseOver){ 
      strokeWeight(2.0);
    }
    stroke(255,32);
    noFill();    
    rect(0,0,sizeX, sizeY);
    
    fill(255,255,255);
    text(label,10,15);        
    popMatrix();
    
  }
      
}

