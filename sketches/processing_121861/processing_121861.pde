
ArrayList<Block> blocks;
Color colors; 
Generate generate;

PFont tekton14;

float friction = .8;
float blockMovement = 50;

float versionTracker = 1;
float moveTracker = 0;

float cameraX = 0;
float cameraY = 0;
float newCameraX = 0;
float newCameraY = 0;

boolean mouseBoolean = false;
boolean mouseOverBoolean = false;
boolean showTextBoolean = true;

String[] titles = {"Default", "Self"};
String[] texts = {"Contains Default", "Non-Default"};
String[][] branches = {{"Default", "Default", "Self"}, {"Self", "Default", "Default", "Default"}};



void setup() {
  size(800, 800);
  tekton14 = loadFont("TektonPro-Bold-14.vlw");
  frameRate(30);
  strokeCap(SQUARE);
  ellipseMode(CENTER);
  rectMode(CENTER);
  restart();
}

void restart() {
  blocks = new ArrayList<Block>();
  colors = new Color();
  generate = new Generate();
  blocks.add(new Block(0, 0, 0, 0, "Default", 0, 0, 1, true));
  println(blocks);
  cameraX = 0;
  cameraY = 0;
  moveTracker = 0;
  versionTracker = 1.0;
}

void draw() {
  mouseOverBoolean = false;
  generate.drawBackground();
  generate.drawBlueprint();
  generate.moveCameraVar();
  generate.generateBlocks();
}

void keyPressed() {
  if(key == ' ') {
    restart();
  }
  if(key == 's') {
    if(showTextBoolean) showTextBoolean = false;
    else showTextBoolean = true;
  }
  if(key == '1') {
    for (int k = 0; k < blocks.size(); k++) {
      Block block = blocks.get(k);
      if(block.active & block.number == 1) {
        block.keyNewBlock(k);
      }
    }
  }
  if(key == '2') {
    for (int k = 0; k < blocks.size(); k++) {
      Block block = blocks.get(k);
      if(block.active & block.number == 2) {
        block.keyNewBlock(k);
      }
    }
  }
  if(key == '3') {
    for (int k = 0; k < blocks.size(); k++) {
      Block block = blocks.get(k);
      if(block.active & block.number == 3) {
        block.keyNewBlock(k);
      }
    }
  }
  if(key == '4') {
    for (int k = 0; k < blocks.size(); k++) {
      Block block = blocks.get(k);
      if(block.active & block.number == 4) {
        block.keyNewBlock(k);
      }
    }
  }
  if(key == '5') {
    for (int k = 0; k < blocks.size(); k++) {
      Block block = blocks.get(k);
      if(block.active & block.number == 5) {
        block.keyNewBlock(k);
      }
    }
  }
}

void mousePressed() {
  mouseBoolean = true;
}
class Block {
  float bX;
  float bY;
  float bDX;
  float bDY;
  float size = 30;
  float parentX;
  float parentY;
  String title;
  String text;
  boolean above;
  int number;
  boolean active;
  
  Block (float X, float Y, float DX, float DY, String T, float pX, float pY, int Num, boolean A) {
    bX = X;
    bY = Y;
    bDX = DX;
    bDY = DY;
    title = T;
    for (int k = 0; k < titles.length; k++) {
      if (titles[k] == title) {
        text = texts[k];
      }
    }
    parentX = pX;
    parentY = pY;
    number = Num;
    above = A;
    active = true;
  }
  
  void modifyPosition() {
    bDX *= friction;
    bDY *= friction; 
    if(bDX < .01 && bDX > -.01) bDX = 0;
    if(bDY < .01 && bDY > -.01) bDY = 0;
    bX += bDX;
    bY += bDY;
  }
  
  void drawBlock(String Type) {
    if(Type == "Offshoot") {
      stroke(colors.fore);
      strokeWeight(1);
      line(parentX, parentY, bX, bY);
      
      noStroke();
      fill(colors.fore);
      rect(bX, bY, size, size);
      int y = 1;
      fill(colors.bg);
      rect(bX, bY, size - 2*y, size - 2*y);
      fill(colors.fore);
      rect(bX, bY, size - 4*y, size - 4*y);
      //stroke(colors.bg);
      //strokeWeight(2);
      //line(bX - size/2 + y, bY - size/2 + y, 200 + size/2 - y * 2, 200 + size/2 - y * 2);
      fill(colors.bg);
      textAlign(CENTER);
      textFont(tekton14, 14);
      text(number, bX, bY + 4);
    }
    else if(Type == "Origin") {
      fill(colors.fore);
      noStroke();
      ellipse(bX, bY, size, size);
      fill(colors.bg);
      ellipse(bX, bY, size-10, size-10);
    }
  }
  
  void showText() {
    textAlign(CENTER);
    fill(colors.fore);
    textFont(tekton14, 14);
    if(above) {
      text(text, bX, bY - (size/2 + 6));
    }
    else {
      text(text, bX, bY + (size/2 + 15));
    }
  }
  
  void keyNewBlock(int arrayNum) {
    generate.newBlocks(bX, bY, title, arrayNum);
  }
}
class Color {
  color bg = #0058bc;
  color fore = #f9ffe1;
  color hover = #C02942;
  color blueprint = #4FBCED;
  
  Color() {
    
  }
}
class Generate {


  Generate() {
  }
  
  void drawBackground() {
    background(colors.bg);
  }
  
  void drawBlueprint() {
    int N = 80;
    strokeWeight(.1);
    stroke(colors.blueprint);
    pushMatrix();
    translate(width/2, height/2);
    for(int i = 0; i < N; i++) {
      line(-width/2, height/N * i - height/2, width/2, height/N * i - height/2);
      line(width/N * i - width/2, -height/2, width/N * i - width/2, height/2);
    }
    noFill();
    int buffer = 30;
    ellipse(0, 0, width - buffer * 2, height - buffer * 2);
    popMatrix();
    textFont(tekton14, 14);
    textLeading(12);
    textAlign(LEFT);
    fill(colors.fore);
    text(moveTracker + " Hours Elapsed\nOS Version " + versionTracker, 8, 18);
  }
  
  void moveCameraVar() {
    float Speed = 8;
    float snap = 8;
    if(abs(newCameraX - cameraX) < snap) {
      cameraX = newCameraX;
    }
    if(cameraX < newCameraX) {
      cameraX += Speed;
    }
    else if(cameraX > newCameraX) {
      cameraX -= Speed;
    }
    if(abs(newCameraY - cameraY) < snap) {
      cameraY = newCameraY;
    }
    if(cameraY < newCameraY) {
      cameraY += Speed;
    }
    else if(cameraY > newCameraY) {
      cameraY -= Speed;
    }
    
  }
  
  void moveCamera() {
    translate(width/2 - cameraX, height/2 - cameraY);
    //println("cX: " + cameraX + " cY: " + cameraY);
  }
  
  void generateBlocks() {
    pushMatrix();
    moveCamera();
    for (int k = 0; k < blocks.size(); k++) {
      Block block = blocks.get(k);
      block.modifyPosition();
      if(block.active) {
        block.drawBlock("Offshoot");
      }
      else {
        block.drawBlock("Origin");
      }
      if(showTextBoolean) {
        block.showText();
      }
    }
    popMatrix();
  }
  
  
  void newBlocks(float X, float Y, String T, int A) {
    float tempAngle;
    float tempDX;
    float tempDY;
    boolean Above;
    print("help");
    moveTracker += 1;
    versionTracker += .1;
    //removing other blocks in array
    for (int i = blocks.size() - 1; i > -1; i--) {
      Block block = blocks.get(i);
      if(i != A){
        blocks.remove(i);
        println(blocks);
      }
      else if(i == A) {
        block.active = false;
      }
    }
    
    //generating children 
    for (int k = 0; k < titles.length; k++) {
      if (titles[k] == T) {
        int branchNum = branches[k].length;
        float randomRotate = random(360);
        for (int j = 0; j < branches[k].length; j++) {
          tempAngle = (j * (360/branchNum) + randomRotate) % 360;
          println((j + 1) + " " + tempAngle);
          tempDX = cos(radians(tempAngle))*blockMovement;
          tempDY = sin(radians(tempAngle))*blockMovement;
          if(tempAngle < 180) {
            Above = false;
          }
          else {
            Above = true;
          }
          blocks.add(new Block(X, Y, tempDX, tempDY, branches[k][j], X, Y, j + 1, Above));
          newCameraX = X;
          newCameraY = Y;
        }
      }
    }
  }
  
  //to remove other vars, use a for loop going backwards, where you skip the right one
  
}


