
Column[] columns;
Timer timer;
StartScreen startScreen;
SelectedSet selectedBlocks;
int blockWidth;
int t;
GameState gameState;
DropBlock dropBlock;

void setup() {
  smooth();
  t = 200;
  columns = new Column[4];
  blockWidth = 50;
  size(blockWidth*6,blockWidth*9);
  for (int i = 0; i < columns.length; i++) {
    columns[i] = new Column(((i*blockWidth)+blockWidth),blockWidth,(height/blockWidth)-1);
  }
  startScreen = new StartScreen();
  timer = new Timer(t);
  timer.start();
  selectedBlocks = new SelectedSet();
  gameState = new GameState();
  dropBlock = new DropBlock();
}

void draw() {
  background(240);
  if (gameState.startGame == true) {
    startScreen.draw();
  } else if (gameState.playGame == true) {
    dropBlock.draw();
  } else if (gameState.endGame == true) {
 //   endScreen.draw();
  }
}

void mousePressed() {
  if (gameState.startGame == true) {
    startScreen.mousePressed();
  } else if (gameState.playGame == true) {
    dropBlock.mousePressed();
  } else if (gameState.endGame == true) {
 //   endScreen.mousePressed();
  }
}

int determineColumnForMouseX(float mouseX) {
  float adjustedX = mouseX-blockWidth;
  if (adjustedX < 0) {
    return -1;
  }
  return int(adjustedX/blockWidth);
}

class Column {
  Block[] blocks;
  float x;
  float w;
  int numBlocks;
  
  Column(float tempX,float tempW,int tempNumBlocks) {
    x = tempX;
    w = tempW;
    numBlocks = tempNumBlocks;
    blocks = new Block[numBlocks];
    for (int i = 0; i < numBlocks; i++) {
      blocks[i] = null;
    }
  }
  void shift (int i) {
    if (blocks[i] == null) {
      return; }
    if (blocks[i+1] == null) {
      blocks[i+1] = blocks[i];
      blocks[i] = null;
      blocks[i+1].moveTo(x,(i+1)*blockWidth);
    }
  }
  
  void move() {
    for (int j = blocks.length-2; j >= 0; j--) {
      shift(j);
    }
  }
  
  void blockSelected() {
    int locationInArray = int (mouseY/blockWidth);
    if (locationInArray >= blocks.length) {
      return;
    }
    if (blocks[locationInArray] == null) {
      return;
    }
    blocks[locationInArray].selected();
  }
  
  void display() {
    for (int i = 0; i < numBlocks; i++) {
      if (blocks[i] != null) {
        blocks[i].display();
      }
    }
  }
  
  void addBlock(Block i) {
    if(blocks[0] == null) {
      blocks[0] = i;
      blocks[0].moveTo(x,0);
    } else {
      gameState.moveToEndGame();
    }
  } 
  
  void removeBlock(Block b) {
    for (int i = 0; i < numBlocks; i++) {
      if(blocks[i] == b) {
        blocks[i] = null;
      }
    }
  }
}

class Block {
  float x;
  float y;
  float w;
  int a;
  boolean isSelected;
  int blockColor;
  int blockShape;
  int blockShade;
  
  Block() {
    x = 0;
    y = 0;
    w = blockWidth;
    
    float red_prob = .33;
    float green_prob = .33;
    float blue_prob = .34;
    float colNum = random(1);
    if (colNum < red_prob) {
      blockColor = 0;
    } else if (colNum < green_prob + red_prob) {
      blockColor = 1;
    } else {
      blockColor = 2;
    }
    
    float cir_prob = .33;
    float dia_prob = .33;
    float squ_prob = .34;
    float shapeNum = random(1);
    if (shapeNum < cir_prob) {
      blockShape = 0;
    } else if (shapeNum < cir_prob + dia_prob) {
      blockShape = 1;
    } else {
      blockShape = 2;
    }
    
    float solid_prob = .33;
    float shade_prob = .33;
    float transp_prob = .34;
    float shadNum = random(1);
    if (shadNum < solid_prob) {
      blockShade = 0;
    } else if (shadNum < shade_prob + solid_prob) {
      blockShade = 1;
    } else {
      blockShade = 2;
    }
    
    isSelected = false;
  }
  
  void display() {
    fill(255);
    noStroke();
    rect(x+1,y+1,w-2,w-2);
    strokeWeight(1);
    if(isSelected == true) {
      strokeWeight(5);
    } else {
      strokeWeight(1);
    }

    if(blockShade == 0) {
      a = 180;
    } else if (blockShade == 1) {
      a = 60;
    } else {
      a = 0;
    }
    
    if(blockColor == 0) {
      stroke(255,53,2);
      fill(255,53,2,a);
    } else if (blockColor == 1) {
      stroke(100,180,28);
      fill(100,180,28,a);
    } else {
      stroke(10,52,178);
      fill(10,52,178,a);
    }
    
    if(blockShape == 0) {
      ellipse(x+(w/2),y+(w/2),w*.75,w*.75);
    } else if (blockShape == 1) {
      quad(x+(w/2),y+(w/8),x+((7*w)/8),y+(w/2),x+(w/2),y+((7*w)/8),x+(w/8),y+(w/2));
    } else {
      rect(x+(w/6),y+(w/6),w*.66,w*.66);
    }
  }
  
  void moveTo(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  } 
  
  void selected() {
    isSelected = !isSelected;
    if (isSelected == true) {
      selectedBlocks.addBlock(this);
    } else {
      selectedBlocks.removeBlock(this);
    }
  }
  
  int getBlockColor() {
    return blockColor;
  }
  int getBlockShape() {
    return blockShape;
  }
  int getBlockShade() {
    return blockShade;
  }
}

class Timer {
  int savedTime; // when Timer started
  int totalTime; // How long Timer shoul last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // starting the timer
  void start() {
    savedTime = millis();
  }
  
  boolean isFinished() {
    // Check how much time has passed
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      return true;
    } else { 
      return false;
    }
  }
}

class SelectedSet {
  Block[] blocks;
  
  SelectedSet() {
    blocks = new Block[3];
    for (int i = 0; i < blocks.length; i++) {
      blocks[i] = null;
    }
  }
  
  void addBlock(Block b) {
    for (int i = 0; i < blocks.length; i++) {
      if (blocks[i] == null) {
        blocks[i] = b;
        break;
      }
    } 

    if (isFull()) {
      if (removalTest()) {
        for (int i = 0; i < blocks.length; i++) {
          Block blockToRemove = blocks[i];
          for (int j = 0; j < columns.length; j++) {
            columns[j].removeBlock(blockToRemove);
          }
        }
      }
      for (int i = 0; i < blocks.length; i++) {
        Block blockToRemove = blocks[i];
        blockToRemove.selected(); 
        blocks[i] = null;
      }
    }    
  }
  
  boolean removalTest() {
    int sumColor = 0;
    int sumShape = 0;
    int sumShade = 0;
    for (int i = 0; i < blocks.length; i++) {
      sumColor = sumColor + blocks[i].getBlockColor();
      sumShape = sumShape + blocks[i].getBlockShape();
      sumShade = sumShade + blocks[i].getBlockShade();
    }
    if (sumColor%3 == 0 && sumShape%3 == 0 && sumShade%3 ==0) {
      return true;
    }
    return false;
  }
  
  boolean isFull() {
    for (int i = 0; i < blocks.length; i++) {
      if (blocks[i] == null) {
        return false;
      }
    }
    return true;
  }
      
  void removeBlock(Block b) {
    for (int i = 0; i < blocks.length; i++) {
      if (blocks[i] == b) {
        blocks[i] = null;
        return;
      }
    }
  }
}

class StartScreen {
  PFont font = loadFont("Verdana-20.vlw");
  String t = "welcome to setris"; 
  String s = "The object of this game is to keep the blocks from stacking to the top of your screen. To remove blocks you choose sets of three blocks that must be all the same or all different in each of their attributes (shape, color, and shade).";
  String r = "Go!";
 
  void draw() {
    fill (255);
    rect (blockWidth, blockWidth, width-2*blockWidth, height-2*blockWidth);
    textFont(font,20);
    fill (75);
    text (t,blockWidth+5,blockWidth+5,width-(2*blockWidth)-10,blockWidth);
    textFont(font,12);
    text (s,blockWidth+5,(2*blockWidth)+5,width - (2*blockWidth)-10,3*blockWidth);
  } 
  
  void mousePressed() {
    gameState.moveToPlayingGame();
  }
}

class DropBlock {
  void draw() {
    for (int i = 0; i < columns.length; i++) {
      columns[i].display();
    }
    if (timer.isFinished()) {
      for (int i = 0; i < columns.length; i++) {
        columns[i].move();
      }
      if(random(1) < .1) {
        columns[int(random(columns.length))].addBlock(new Block());
      }
      timer.start();
      t = t-5;
    }
  }
  void mousePressed() {
     int locationInArray = determineColumnForMouseX(mouseX);
      if (locationInArray < 0 || locationInArray >= columns.length) {
        return;
      }
      if (columns[locationInArray] == null) {
      return;
      }
    columns[locationInArray].blockSelected();
  }
} 
  
class GameState {
  boolean startGame = true;
  boolean playGame = false;
  boolean endGame = false;
  
  void moveToPlayingGame() {
    startGame = false;
    playGame = true;
  }
  
  void moveToEndGame() {
    playGame = false;
    startGame = true;
  }
}

