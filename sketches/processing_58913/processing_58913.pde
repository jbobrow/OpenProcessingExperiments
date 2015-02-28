
PImage myimage;
PImage Leye;
PImage Reye;

int arraySize = 60;
int puffsAlive = 0;
puff[] puffArray = new puff[50];
int puffIndex = 0;

void setup(){
  size(1000, 500);
  myimage = loadImage("Oldman.jpg");
  fill(200, 15);
  noStroke();
  frameRate(50);
}


void draw() {
  image(myimage, 0, -250);
   tint(285, random(400), random(200), 80);
  
  
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
    puffIndex = (puffIndex+1)%90;
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
  int radius = 65;
  
    // Constructor
  puff(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    for(int i = 0; i < arraySize; i++) {
      randomX[i] = random(-80,80);
      randomY[i] = random(-80,80);
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


