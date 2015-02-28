
ArrayList<Block> blocks;
Color colors; 
Generate generate;

float friction = .8;
float blockMovement = 20;
String[] nameArray = {"Toru Watanabe", 
                      "Habitats",
                      "Body",
                      "Default"
                      
                      
                      };
String[][] branchArray = {{"Relationships", "Habitats", "Body", "Desires"},
                          {"Toru Watanabe", "Record Store", "Bookstore"},
                          {"Habitats"},
                          {"Default", "Default", "Default"}
                        
                      
                         };

boolean showTextBoolean = false;

boolean mouseBoolean = false;
boolean mouseOverBoolean = false;
int mouseTimer = 0;

boolean firstBoolean = true;

int lastOrder;
int mouseOrder;

float cameraX = 0;
float cameraY = 0;
int cameraElementNum = 0;

void setup() {
  size(1000, 1000);
  frameRate(30);
  strokeWeight(.5);
  textAlign(CENTER);
  textSize(9);
  ellipseMode(CENTER);
  restart();
}


void restart() {
  blocks = new ArrayList<Block>();
  colors = new Color();
  generate = new Generate();
  blocks.add(new Block(width/2, height/6, 0, 0, 90, 0, "Default", width/2, height/6));
  println(blocks);
  lastOrder = 0;
  firstBoolean = true;
}


void draw() {
  //mouseTimer += 1;
  mouseOverBoolean = false;
  generate.drawBackground();
  generate.generateBlocks();
  //generate.mouseOver();
  if(showTextBoolean) {
    for(int i = 0; i < blocks.size(); i++) {
      Block block = blocks.get(i);
      pushMatrix();
      translate(width/2 - cameraX, height/2 - cameraY);
      block.showText();
      popMatrix();
    }
  }
  
}




void keyPressed() {
  if(key == ' ') {
    restart();
  }
  if(key == 's') {
    if(showTextBoolean) showTextBoolean = false;
    else showTextBoolean = true;
  }
  if(key == 'a') {
    int[] tempHolder = new int[0];
    for (int i = 0; i < blocks.size(); i++) {
      Block block = blocks.get(i);
      if(block.orderTracker == lastOrder) {
        tempHolder = append(tempHolder, i);
      }
    }
    Block b = blocks.get(tempHolder[floor(random(tempHolder.length))]);
    b.keyNewBlock();
  }
}



void mousePressed() {
  
  mouseBoolean = true;
  
  for(int i = 0; i < blocks.size(); i++) {
    Block block = blocks.get(i);
    
  }
}
class Block {
  float bX;
  float bY;
  float bDX;
  float bDY;
  float prevAngle;
  float size = 10;
  float parentX;
  float parentY;
  String name;
  int orderTracker; 
  boolean hover;
  boolean active;
  
  Block (float X, float Y, float DX, float DY, float A, int O, String N, float pX, float pY) {
    /*
    bDX and bDY should be dependent on the location of the previous block, 
    because you don't want them to overlap. should this be decided in this function,
    or in the greater function in the new blocks function? maybe the greater one?
    and you just input the variables here? 
    */
    bX = X;
    bY = Y;
    bDX = DX;
    bDY = DY;
    orderTracker = O;
    name = N;
    active = true;
    prevAngle = A; //this is the angle(?) or distance from the previous line, lets you figure
    //out what angle the bubbles should go 
    parentX = pX;
    parentY = pY;
  }
  
  void modifyPosition() {
    bDX *= friction;
    bDY *= friction; 
    if(bDX < .01 && bDX > -.01) bDX = 0;
    if(bDY < .01 && bDY > -.01) bDY = 0;
    bX += bDX;
    bY += bDY;
    
  }
  
  void calculateCamera() {
    if(orderTracker == lastOrder) {
      cameraX += bX;
      cameraY += bY;
      cameraElementNum += 1;
    }
  }
  
  
  void colorBlock() {
    int L = colors.blockArrayG.length - 1;
    int temp = abs(lastOrder-orderTracker);
    if(temp > colors.blockArrayG.length - 1) {
      temp = colors.blockArrayG.length - 1;
    }
    fill(colors.blockArrayG[L-temp]);
    stroke(colors.blockArrayG[L-temp]);
    //fill(color.blockArray[abs(currentSelection - orderTracker)];
    //fill(color.blockArray[];
    /*
    when the mouse isn't over one, it follows its ordertracker, where the current highest
    tracker becomes the lightest color 
    
    */
    //(lastOrder)
    
  }
  
  
  void drawBlock() {
    strokeWeight(.5);
    line(parentX, parentY, bX, bY);
    //noStroke();
    ellipse(bX, bY, size, size);
  }
  
  void mouseOver() {
    if(dist(bX + (width/2 - cameraX), bY + (height/2 - cameraY), mouseX, mouseY) < size/2) {
      showText();
      //fill(colors.hover);
      if(mouseBoolean && active) {
        println("pressed " + name + " angle: " + prevAngle);
        generate.newBlocks(bX, bY, prevAngle, orderTracker, name);
        active = false;
        mouseBoolean = false;
      }
      mouseOverBoolean = true;
      mouseOrder = orderTracker;
    }
  }
  
  void modifyMouseOver() {
    int L = colors.blockArrayG.length - 1;
    int temp = abs(mouseOrder-orderTracker);
    if(temp > colors.blockArrayG.length - 1) {
      temp = colors.blockArrayG.length - 1;
    }
    fill(colors.blockArrayG[L-temp]);
    stroke(colors.blockArrayG[L-temp]);
    
  }
  
  void showText() {
    //fill(colors.Text);
    text(name, bX, bY - (size/2 + 6));
  }
  
  void keyNewBlock() {
    generate.newBlocks(bX, bY, prevAngle, orderTracker, name);
    active = false;
  }
}
class Color {
  color bg = #000000;
  color Text = #FFFFFF;
  color[] blockArray = new color[10];
  color[] blockArrayG = new color[8];
  color hover = #FFFFFF;
  
  Color() {
    for(int u = 0; u < blockArray.length; u++) {
      blockArray[u] = color(u * 25 + 5, 125, 125);
      //blockArrayG[u] = color(u * 25 + 5);
    }
    for(int w = 0; w < blockArrayG.length; w++) {
      blockArrayG[w] = color(w * 31 + 7);
    }
      
  }
    
}
class Generate {


  Generate() {
  }


  void drawBackground() {
    background(colors.bg);
  }

  void generateBlocks() {
    cameraX = 0;
    cameraY = 0;
    cameraElementNum = 0;
    for (int i = 0; i < blocks.size(); i++) {
      Block block = blocks.get(i);
      block.modifyPosition();
      block.calculateCamera();
    }
    cameraX /= cameraElementNum;
    cameraY /= cameraElementNum;
    pushMatrix();
    translate(width/2 - cameraX, height/2 - cameraY);
    println("cX: " + cameraX + " cY: " + cameraY);
    for (int k = 0; k < blocks.size(); k++) {
      Block block = blocks.get(k);
      block.mouseOver();
    }
    for (int j = 0; j < blocks.size(); j++) {
      Block block = blocks.get(j);
      block.colorBlock();
      if(mouseOverBoolean) {
        block.modifyMouseOver();
      }
      block.drawBlock();
    }
    popMatrix();
  }

  void newBlocks(float X, float Y, float A, int O, String N) {
    float tempAngle;
    float tempDX;
    float tempDY;
    float breadth = 140;
    float buffer = 0;
    
    lastOrder = O + 1;
    for (int k = 0; k < nameArray.length; k++) {
      if (nameArray[k] == N) {
        for (int i = 0; i < branchArray[k].length; i++) {
          if(firstBoolean) {
            breadth = 360;
            firstBoolean = false;
          }
          tempAngle = (random(A + (360-breadth)/2 + breadth*(i/branchArray[k].length) + buffer, A + (360-breadth)/2 + breadth - breadth*((branchArray[k].length-1-i)/branchArray[k].length) - buffer) + 180) % 360;
          tempDX = cos(radians(tempAngle))*blockMovement;
          tempDY = sin(radians(tempAngle))*blockMovement;
          //println(tempAngle + " " + tempDX + " " + tempDY);
          blocks.add(new Block(X, Y, tempDX, tempDY, tempAngle, O+1, branchArray[k][i], X, Y));
        }
      }
    }

    //
  }
}



/*
for(int i = 0; i < blockArray[].length; i++) {
 generate a new child, add it to the array, each child should divide up the 180
 degree spectrum extending from the object 
 
 is 180 too much 
 
 }
 */


