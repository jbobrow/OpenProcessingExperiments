

Replay play;
Bubble[] bubbles;
int totalBubbles = 0;

float i;



void setup() {
  size(500,700);
  smooth();
  bubbles = new Bubble[400];
  play = new Replay(1);
  play.start();
  
}

void draw() {
  background(0);
  
  if (play.isFinished()) {
  bubbles[totalBubbles] = new Bubble();
  totalBubbles ++;
  
    if (totalBubbles >= bubbles.length) {
      totalBubbles = 0; // Start over
    }
    
  play.start();   
  
  for (int a = 0; a < totalBubbles; a++ ) {
    bubbles[a].display();  
    }
   
}
}



class Bubble {
  // bubble variables
  float x,y,i,speed;
  color c;
 
  
  // bubble constructor
  Bubble() {
    x = random(width);
    y = height + i;
    i = random(10, 60);
    speed = random(0.5,3);
    c = color(random(0,255),random(0,255),random(0,255));
  }
  
  // Display bubble
  void display() {
   i=(1/speed)*50;  //speed in proportional to size of bubble
     // draw bubble
    ellipseMode(CENTER);
    noStroke();
    fill(c);
    ellipse(x,y,i,i);
     
    //move
    y = y - speed;
    
      if(y==-20){
      y = height + 20;
    }
        
    if(speed<=1){
      for(int z = 10; z<20; z++){
        ellipse(x,y-z,i+z,i+z);
      }
    }
      
  }

  }

  
  class Replay {
    int savedPlay;
    int totalPlay;
    
    Replay(int tempTotalPlay) {
      totalPlay = tempTotalPlay;
    }
    
    void start() {
      savedPlay = millis();
    }
    
    boolean isFinished() {
      int passedPlay = millis() - savedPlay;
      if (passedPlay > totalPlay) {
        return true;
      }else{
        return false;
      }
    }
  }

