
//HW 6 - Sarah Lesnikoski

BlueSquare test;

void setup() {
  size(550,600);
  test = new BlueSquare(3000);
  test.start();
  background(255);
 
  
 
}
void draw() {
  
  if (test.isFinished()) {
    background(random(255), random(255), random(255), random(255));
    test.start();
    noStroke();
    fill(51,161,201); //mgb
    rect(100,100,50,50);
    fill(99,184,255); //mbb
    rect(200,100,50,50);
    fill(100,149,237);
    rect(300,100,50,50);
    fill(28,134,238);
    rect(400,100,50,50);
    
    fill(111,131,255);
    rect(100,200,50,50);
    fill(135,206,235);
    rect(200,200,50,50);
    fill(141,182,205);
    rect(300,200,50,50);
    fill(122,197,205);
    rect(400,200,50,50);
    
    fill(0,178,238);
    rect(100,300,50,50);
    fill(51,161,201); //mgb
    rect(200,300,50,50);
    fill(28,134,238); //mbb
    rect(300,300,50,50);
    fill(100,149,237);
    rect(400,300,50,50);
    
    fill(99,184,255);
    rect(100,400,50,50);
    fill(141,182,205);
    rect(200,400,50,50);
    fill(131,111,255);
    rect(300,400,50,50);
    fill(135,206,235);
    rect(400,400,50,50);
    
    
  }
}

class BlueSquare {
  
  int savedTime; //timer started
  int totalTime; //timer should last
  
  BlueSquare (int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
void start() {
  savedTime = millis();
}

boolean isFinished() {
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    return true;
  } else {
    return false;
  }
}
}

/* The class structure I understood from example we learned in uh, ...class. 
The timer code and millis () info I got from Learning Processing by Daniel Shiffman.
I am working on making each square draggable by setting up extended classes 
which I am learning about now in the same book. */


