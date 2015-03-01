
//june 1.2014
//name: NRT_0296

ArrayList theBalls;
Timer theTimer;
Mouse theMouse;

void setup() {
  size (700, 500);
  theBalls = new ArrayList();
  theMouse = new Mouse(50);
  theTimer = new Timer(200);
  theTimer.start();
}

void draw() {
  background(#02071A);
  if (theTimer.timeOver()) {
    theBalls.add(new Ball());
    theMouse.display();
    for (int i = 0; i < theBalls.size(); i++) {
      Ball b = (Ball) theBalls.get(i);
       if (b.delete()) {
        theBalls.remove(i);
      } else{
      if (theMouse.deflect(b)){
       b.deflect(); 
      }
      b.move();
      b.display();
      b.connect();
      }
    }
  }
}

void mousePressed() {
  theBalls.add(new Ball());
}

class Ball {
  float r;
  float xpos, ypos;
  float xspeed, yspeed;


  Ball() {
    r = random(5, 10);
    xpos = random(0, width);
    ypos = 0;
    yspeed = random(1, 2);
    xspeed = random(-2, 5);
  }

  void move() {
    ypos += yspeed;
  }

  void display() {
    noFill();
    noStroke();
    //strokeWeight(2);
    //stroke(255);
    //ellipse(xpos, ypos, r, r);
    point(xpos, ypos);
  }

  void connect() {
    for (int i = 0; i < theBalls.size(); i++) {
      Ball b = (Ball) theBalls.get(i);
      float distance = dist(xpos, ypos, b.xpos, b.ypos);
      if (distance < r*5) {
        stroke(#FF64EB, random(100, 200)); //salmon (FF9990) light purp(FF64EB)
        line(xpos, ypos, b.xpos, b.ypos);
      }
    }
  }

  void deflect() {
    yspeed = -yspeed;
    ypos += yspeed;
    xpos += xspeed;
  }

  boolean delete() {
    if (ypos > height) {
      return true;
    }  
    else {
      return false;
    }
  }
}

class Mouse {
  float r;
  float xpos, ypos;

  Mouse(float tempR) {
    r = tempR;
    shapeMode(CENTER);
  }

  void display() {
    noFill();
    //stroke(255);
    noStroke();
    xpos = mouseX;
    ypos = mouseY;
    ellipse(xpos, ypos, r, r);//rect(0, ypos, width, 10); 
  }
  
  boolean deflect(Ball b) {
   float distance = dist (xpos, ypos, b.xpos, b.ypos);
   if (distance < r-b.r) {
   return true;
   } 
   else
   {
   return false;
   }
   } 
}

class Timer {
  int savedTime;
  int totalTime;

  Timer(int temp_totalTime) {
    totalTime = temp_totalTime;
  }

  void start() {
    savedTime = millis();
  }

  boolean timeOver() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      return true;
    }    
    else {
      return false;
    }
  }
}

