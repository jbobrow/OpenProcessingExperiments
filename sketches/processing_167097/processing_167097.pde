
//declare virus object
Virus virus;
RedBloodCell[] red = new RedBloodCell[100];
WhiteBloodCell[] white = new WhiteBloodCell[10];
//declare an ArrayList for the red blood cells
//ArrayList<Red> Reds;

  boolean upPressed;
  boolean downPressed;
  boolean leftPressed;
  boolean rightPressed;

void setup() {
size(600,400);
virus = new Virus();
virus.prime();
for(int i = 0; i<red.length; i++) {
    red[i] = new RedBloodCell();
    red[i].prime();

}

for(int i = 0; i<white.length; i++) {
    white[i] = new WhiteBloodCell();
    white[i].prime();

}

}



void draw() {
 background(0);
 virus.update();
 virus.collision();
 
 for (int j = 0; j<red.length; j++) {
    red[j].update();
    red[j].collision();
  }
  
   for (int j = 0; j<white.length; j++) {
    white[j].update();
    white[j].collision();
  }
 
// for (int i = Reds.size ()-1; i >=0; i--) {
//}
 
  
}
    //Create movement logic
    void keyPressed() {
      if (keyCode == 'W') {
        upPressed=true;
      }    
      if (keyCode == 'S') {
        downPressed = true;
      }
      if (keyCode == 'A') {
        leftPressed = true;
      }

      if (keyCode == 'D') {
        rightPressed = true;
      }
    }
  
    void keyReleased() {

      if (keyCode == 'W') {
        upPressed = false;
      }
      if (keyCode == 'S') {
        downPressed = false;
      }
      if (keyCode == 'A') {
        leftPressed = false;
      }
      if (keyCode == 'D') {
        rightPressed = false;
      }
    }
class RedBloodCell {
   
  PVector velocity = new PVector(2,4);
  PVector location = new PVector(random(50,200),random(50,200));
  float bigness;
  
  void prime() {
  bigness = 1;
    
  }
  
  
  void update() {
    noStroke();
    fill(255,0,0);
    ellipse(location.x,location.y,bigness*25,bigness*25);
    location.x -= velocity.x;
    location.y += velocity.y;
    
  
  }
  
  void collision() {
    
    //wall boundaries
      if (location.x < 0) {
      velocity.x *=-1;
    }
    if (location.x > width) {
      velocity.x *=-1;
    }
    if (location.y < 0) {
      velocity.y *=-1;
    }
    if (location.y > height) {
      velocity.y *=-1;
    }
    
    
  }
    
    
  }
  
  
  
 
  

class Virus {

  int bigness;
  float xPos;
  float yPos;
  float speed;
  float direction;




  void prime() {

    xPos = width/2;
    yPos = height/2;
    bigness = 1;
    speed = 1;
  }

  void update() {
    //virus body
    noStroke();
    fill(0, 255, 0);
    ellipse(xPos, yPos, bigness*50, bigness*50);
    
    //virus spikes
    stroke(0,255,0);
    strokeWeight(2);
    line(xPos-(bigness*30),yPos-(bigness*30),xPos+(bigness*30),yPos+(bigness*30));
    line(xPos,yPos,xPos+(bigness*30),yPos-(bigness*30));
    line(xPos-(bigness*30),yPos+(bigness*30),xPos,yPos);

    //movement logic
    if (upPressed == true) {
      yPos -= speed;
    }
    if (downPressed == true) {
      yPos += speed;
    } 
    if (leftPressed == true) {
      xPos -= speed;
    } 
    if (rightPressed == true) {
      xPos += speed;
    }
}

void collision() {
}

}

class WhiteBloodCell {
   
  PVector velocity = new PVector(1,3);
  PVector location = new PVector(random(50,200),random(50,200));
  float bigness;
  
  void prime() {
  bigness = 1;
    
  }
  
  
  void update() {
    noStroke();
    fill(255);
    ellipse(location.x,location.y,bigness*40,bigness*40);
    location.x -= velocity.x;
    location.y += velocity.y;
    
  
  }
  
  void collision() {
    
    //wall boundaries
      if (location.x < 0) {
      velocity.x *=-1;
    }
    if (location.x > width) {
      velocity.x *=-1;
    }
    if (location.y < 0) {
      velocity.y *=-1;
    }
    if (location.y > height) {
      velocity.y *=-1;
    }
    
    
  }
    
    
  }
  
  
  
 
  



