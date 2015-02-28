
ArrayList<Block> blocks;
Color colors; 
Generate generate;

float friction = .95;
float blockMovement = 20;
float minMovement = 2;
int blockNumber;

boolean mouseBoolean = false;

//if(sq(bDX) + sq(bDY) > sq(minMovement)) 



void setup() {
  size(800, 800);
  frameRate(30);
  ellipseMode(CENTER);
  strokeWeight(.5);
  stroke(#FFFFFF);
  restart();
}

void restart() {
  blocks = new ArrayList<Block>();
  colors = new Color();
  generate = new Generate();
  blockNumber = -1;
  blocks.add(new Block(width/2, height/2, 0, 0, 200, colors.purple));
}

void draw() {
  generate.drawBackground();
  generate.generateBlocks();
  
}

void mousePressed() {
  mouseBoolean = true;
}


void keyPressed() {
  if(key == ' ') {
    restart();
  }
}
class Block {
  float bX;
  float bY;
  float bDX;
  float bDY;
  float size;
  color Color; 
  int Num;
  int frame;
  boolean active;
  
  Block(float X, float Y, float DX, float DY, float S, color C) {
    //they absorb each others sizes 
    size = S;
    bX = X;
    bY = Y;
    bDX = DX;
    bDY = DY;
    Color = C; 
    blockNumber++;
    Num = blockNumber;
    frame = 100;
    active = true;
  }
  
  void mouseOver() {
    if(dist(bX, bY, mouseX, mouseY) < size/2) {
      if(mouseBoolean) {
        generate.newBlocks(bX, bY, size, Color);
        active = false;
        //blocks.remove(this);
        mouseBoolean = false;
      }
    }
  }
  
  void checkCollision() {
    
    if(frame < 0) {
      int i = 0;
      boolean collided = false;
      while(i < blocks.size() && collided == false) { //(int i = 0; i < blocks.size(); i++) {
        Block block = blocks.get(i);
        if(dist(bX, bY, block.bX, block.bY) < 10 && block != this) {
          if(block.active && block.frame < 0) {
            print("collide, ");
            float tempDX = bDX - block.bDX; //it makes it go faster, which isn't what you want
            float tempDY = bDY - block.bDY;
            float tempSize = size + block.size;
            generate.absorbBlocks(Num, block.Num, bX, bY, tempDX, tempDY, tempSize, Color, block.Color);
            active = false;
            block.active = false;
            collided = true;
          }
        }
        i++;
      }
    }
    
  }
  
  void modifyPosition() {
    //the problem with friction is that if you have a minimum speed for both x and y, then objects will tend to travel at 45 degrees no matter what
    //maybe once one variable reaches that minimum speed the other doesn't change? the problem is that what if it begins almost horizontal or vertical?
    
    bX += bDX;
    bY += bDY;
    if(bX >= width + size/2) bX = -size/2;
    else if(bX <= -size/2) bX = width + size/2;
    if(bY >= height + size/2) bY = -size/2;
    else if(bY <= -size/2) bY = height + size/2;
  }
  
  void drawBlock() {
    fill(Color);
    ellipse(bX, bY, size, size);
  }
  
  
  
}
class Color {
  color bg = #FFFFFF;
  color red = #d63952;
  color yellow = #ffff7b;
  color blue = #32beef;
  color orange = #ed6352;
  color purple = #5b3aa5;
  color green = #4aad42;
  
  /*
  color[] productArray = {red, yellow, blue, orange, purple, green};
  color[][] elementArray = {{purple, orange},{orange, green},{green, purple},{red, yellow},{red, blue},{yellow,blue}};
  
  when two colors collide, how does it check if they form something new? maybe it searches
  an array for the first component, once it finds it, it checks a 2d branch array for its
  combinations, and then once it finds the branch it makes the product in a third 2d array
  
  product should probably be the 1d array, and the element arrays 2d 
  
  */
  color[] mainElementArray = {red, yellow, blue, orange, purple, green};
  color[][] subElementArray = {{yellow, blue}, {red, blue}, {red, yellow}, {green, purple}, {green, orange}, {orange, purple}};
  color[][] productArray = {{orange, purple}, {orange, green}, {purple, green}, {yellow, red}, {blue, red}, {yellow, blue}};
  
  
  Color() {
    
  }
}
class Generate {


  Generate() {
  }
  
  void drawBackground() {
    background(colors.bg);
  }
  
  void generateBlocks() {
    for (int i = 0; i < blocks.size(); i++) {
      Block block = blocks.get(i);
      if(block.active) {
        block.frame -= 1;
        block.mouseOver();
        block.checkCollision();
        block.modifyPosition();
        block.drawBlock();
      }
    }
  }
  
  void newBlocks(float X, float Y, float S, color C) {
    println("new" + C);
    int i = 0;
    int j = 0; 
    color new1 = colors.green;
    color new2 = colors.green; 
    float DXmax = 5;
    float DYmax = 5;
    float tempDX;
    float tempDY;
    boolean match = false;
    while(match == false && i < colors.productArray.length) {
      for(j = 0; j < colors.productArray[i].length;j++) {
        if(colors.productArray[i][j] == C) {
          new1 = colors.mainElementArray[i];
          new2 = colors.subElementArray[i][j];
          match = true;
        }
        //print("j:"+j+" ");
      } 
      i++;
      //print("i:"+i+" ");
    }
    //dx and dy
    //maybe just use random variables for now, replace later with deltas based on size(?)     
    tempDX = random(-DXmax, DXmax) * (40/S);
    tempDY = random(-DYmax, DYmax) * (40/S);
    blocks.add(new Block(X, Y, tempDX, tempDY, S*3/4, new1));
    tempDX = random(-DXmax, DXmax) * (40/S);
    tempDY = random(-DYmax, DYmax) * (40/S);
    blocks.add(new Block(X, Y, tempDX, tempDY, S*3/4, new2));
    
  }
  void absorbBlocks(int N1, int N2, float X, float Y, float DX, float DY, float S, color C1, color C2) {
    println("absorb " + N1 + " " + N2);
    int i = 0;
    int j = 0; 
    color tempProduct = colors.green;
    boolean match = false;
    
    while(match == false && i < colors.mainElementArray.length) {
      if(colors.mainElementArray[i] == C1) {
        for(j = 0; j < colors.subElementArray[i].length; j++) {
          if(colors.subElementArray[i][j] == C2) {
            tempProduct = colors.productArray[i][j];
          }
        }
      }
      i++;
    }
    
    blocks.add(new Block(X, Y, DX, DY, S, tempProduct));
    //blockNumber -= 2;
  }
  
}


