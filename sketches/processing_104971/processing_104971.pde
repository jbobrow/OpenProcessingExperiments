
Block redSquare;
Block redRect;
Block yelRect1;
Block yelRect2;
Block yelRect3;
Block blkSquare;
Block blkRect;
Block bluRect;

void setup(){
  size(599,599);
  frameRate(30);
  
  redSquare = new Block(74,74,300,300,  228,53,36);
  redRect = new Block(565,449,35,150,  228,53,36);
  yelRect1 = new Block(0,444,80,154,  237,199,100);
  yelRect2 = new Block(369,0,207,74,  237,199,100);
  yelRect3 = new Block(370,74,206,150,  237,199,100);
  blkSquare = new Block(74,374,150,150,  0,0,0);
  blkRect = new Block(224,524,150,46,  0,0,0);
  bluRect = new Block(374,449,196,121,  47,26,157);
}

void draw(){
  background(230,227,210);
  noStroke();  

  redSquare.display();
  redSquare.move();
  redRect.display();
  redRect.move();
  yelRect1.display();
  yelRect1.move();
  yelRect2.display();
  yelRect2.move();
  yelRect3.display();
  yelRect3.move();
  blkSquare.display();
  blkSquare.move();
  blkRect.display();
  blkRect.move();
  bluRect.display();
  bluRect.move();
  
  stroke(0);
  strokeCap(SQUARE);
  strokeWeight(10);
  
  line(74,74,74,580); //vertical lines, L->R
  line(149,12,149,74);
  line(224,374,224,589);
  line(374,7,374,574);
  line(472,224,472,374);
  line(570,17,570,589);
  
  line(7,74,570,74); //horizontal lines, T->B
  line(15,224,74,224);
  line(374,224,570,224);
  line(74,374,570,374);
  line(10,449,74,449);
  line(224,449,599,449);
  line(74,524,375,524);
  line(224,570,570,570);
  
}
class Block {
  int r;
  int g;
  int b;
  int xPos;
  int yPos;
  int wide;
  int tall;
  int xC;
  int yC;
  float xDist;
  float yDist;
  int minDist;
  boolean moose;
  
  Block(int x, int y, int wid, int tal, int red, int green, int blue) {
    xPos = x;
    yPos = y;
    wide = wid;
    tall = tal;
    r = red;
    g = green;
    b = blue;
  }
  
  void display() {
    noStroke();  
    fill(r, g, b);
    rect(xPos,yPos,wide,tall);
  }
  
  void move() {
    xC = xPos + (wide/2);
    yC = yPos + (tall/2);
    xDist = dist(mouseX,0,xC,0);
    yDist = dist(0,mouseY,0,yC);
    
    if((mouseX < (xC + (wide/2)))
      && (mouseX > (xC - (wide/2)))
      && (mouseY < (yC + (tall/2)))
      && (mouseY > (yC - (wide/2)))) {
        if(mouseX < xC) {
          xPos = xPos + 1;
        } else if(mouseX > xC) {
          xPos = xPos - 1;
        }
        if(mouseY < yC) {
          yPos = yPos + 1;
        } else if(mouseY > yC) {
          yPos = yPos - 1;
        }
    }
   
  }
  
}


