
ArrayList<Block> blocks;
Color colors; 
Derivative derivatives;

float tileSize;
int maxComplexity; 
int tileNumWidth;
int tileNumHeight;


void setup() {
  size(640, 664);
  frameRate(30);
  noStroke();
  restart();
}

void restart() {
  maxComplexity = 7;
  tileNumWidth = int(pow(2, maxComplexity));
  tileNumHeight = int(pow(2, maxComplexity));
  println(tileNumWidth + " " + tileNumHeight);
  tileSize = width/tileNumWidth; 
  derivatives = new Derivative();
  blocks = new ArrayList<Block>();
  colors = new Color();
  blocks.add(new Block(0, 0, 7, "Adam"));
  println(blocks);
}


void draw() {
  drawBackground();
  drawBlocks();
  mouseOver();
}

void drawBackground() {
  background(colors.bg);
  
}


void drawBlocks() {
  for(int i = 0; i < blocks.size(); i++) {
    Block block = blocks.get(i);
    block.colorBlock();
    block.drawBlock();
  }
}

void mouseOver() {
  drawText("");
  for(int i = 0; i < blocks.size(); i++) {
    Block block = blocks.get(i);
    if(mouseX > block.horDistance && mouseX < block.horDistance + block.sizeDistance && mouseY > block.verDistance && mouseY < block.verDistance + block.sizeDistance) {
        block.hover = true;
        drawText(block.name);
    }
    else {
      block.hover = false;
    }
  }
}

void drawText(String Name) {
  textAlign(CENTER);
  fill(colors.text);
  textSize(12);
  String period;
  if(Name == "") {
    period = "";
  }
  else {
    period = "."; 
  }
  text(Name + period, width/2, height - 8);
}




void keyPressed() {
  if(key == ' ') {
    restart();
  }
}
  
void mousePressed() {
  for(int i = 0; i < blocks.size(); i++) {
    Block block = blocks.get(i);
    if(mouseX > block.horDistance && mouseX < block.horDistance + block.sizeDistance && mouseY > block.verDistance && mouseY < block.verDistance + block.sizeDistance) {
      if(block.size > 1) {
        blocks.add(new Block(block.hor, block.ver, block.size - 1, derivatives.derive(block.name, 1)));
        blocks.add(new Block(int(block.hor + pow(2, block.size-1)), block.ver, block.size - 1, derivatives.derive(block.name, 2)));
        blocks.add(new Block(block.hor, int(block.ver + pow(2, block.size-1)), block.size - 1, derivatives.derive(block.name, 3)));
        blocks.add(new Block(int(block.hor + pow(2, block.size-1)), int(block.ver + pow(2, block.size-1)), block.size - 1, derivatives.derive(block.name, 4)));
        blocks.remove(i);
      }
    }
  }
}
class Block {
  
  int hor; //
  int ver;
  int size; //this is the 'block' size, goes from 5-1, 5 is largest 
  float sizeDistance;
  float horDistance;
  float verDistance;
  color Color;
  boolean active;
  boolean hover;
  String name;
  
  
  Block (int X, int Y, int L, String N) {
    hor = X;
    ver = Y;
    size = L;
    horDistance = X * tileSize;
    verDistance = Y * tileSize;
    sizeDistance = pow(2, size) * tileSize;
    active = true;
    hover = false;
    int colorVal = floor(random(colors.blocks.length/maxComplexity * (size-1), colors.blocks.length/maxComplexity * size));
    Color = colors.blocks[colorVal];
    name = N;
    
    
  }
  
  void drawBlock() {
    rect(horDistance, verDistance, sizeDistance, sizeDistance);
  }
  
  void colorBlock() {
    if(hover) {
      fill(colors.highlight);
    }
    else {
      fill(Color);
    }
  }
  
}
class Color {
  
  
  
  color[] blocks = new color[40];
  color bg = #2E3433;
  color text = #FFFFFF;
  color highlight = #FCCB17;
  
  
  Color() {
    
    for(int u = 0; u < blocks.length; u++) {
      blocks[u] = color(floor(u*(255/blocks.length)), 125, 125);
    }
  }
}
class Derivative {
  
  String[] name = {"Adam", "Body"};
  String[][] nameDerivative = {{"Body", "Mind", "Soul", "Time"}, {"Leg", "Arm", "Arm", "Head"}};
  
  
  Derivative() {
    
  }
  
  String derive(String Name, int Number) {
    String string = "";
    for(int i = 0; i < name.length; i++) {
      if(name[i] == Name) {
        string = nameDerivative[i][Number-1];
      }
    }
    return string;
  }
  
}


