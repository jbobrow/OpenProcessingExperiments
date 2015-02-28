
// puffs disappear at accelerating rates 


int arraySize = 100;
int puffsAlive = 0;
puff[] puffArray = new puff[50];
int puffIndex = 0;


void setup() {
  size(640,640);
  background(0);
  fill(180, 80);
  noStroke();
  frameRate(60);
}

void draw() {
  background(0);
  if(puffsAlive > 0) {
    for (int i = puffsAlive; i > 0 ; i--) {
      int pos = (puffIndex-i);
      puffArray[pos].displayAndFade();
      puffArray[pos].timer--;
 
    }
    for(int i = puffsAlive; i > 0; i--) {
      int pos = (puffIndex-i);
      if(puffArray[pos].timer < 1) {
        
        puffsAlive--;
        puffIndex--;
        }
    }
  }
  // create puff of smoke
  if(mousePressed) {
    puff temp;
    temp = new puff(mouseX, mouseY);
    puffArray[puffIndex] = temp;
    puffArray[puffIndex].displayAndFade();
    puffsAlive++;
    puffIndex = (puffIndex+1)%50;
  }
//  println("puffsAlive: " + puffsAlive);
}

//-------------------------------------------------

class puff {
  float x;
  float y;
  float[] randomX = new float[arraySize];
  float[] randomY = new float[arraySize];
  int timer = arraySize;
  int radius = 80;
  
  // Constructor
  puff(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    for(int i = 0; i < arraySize; i++) {
      randomX[i] = random(-50,50);
      randomY[i] = random(-50,50);
    }
  }
  
  void displayAndFade() {
    for(int i = 0; i < timer; i++) {
      ellipse(x+randomX[i],y+randomY[i],radius,radius);
    }
  //  this.timer--;
  //  println("timer: " + this.timer);
  }
    
}



