
PFont myFont;

VISchedule leftLever;
VISchedule rightLever;
char lastKey;
long cumulativePausedTime;
long currentPausedTime;
long pauseStartTime;

void setup() {
  size(400, 200);
  myFont = createFont("Georgia", 32);
  textFont(myFont);
  textAlign(TOP, LEFT);
  
  leftLever = new VISchedule(new PVector(width*.25, height*.5), new PVector(width/10, height/10));
  leftLever.generateVISchedule(30000,30);
  leftLever.setSrAccessDuration(30000);
  leftLever.setDelayToSr(0);
  leftLever.addResponseKey('q');
  
  rightLever = new VISchedule(new PVector(width*.65, height*.5), new PVector(width/10, height/10));
  rightLever.generateVISchedule(30000,30);
  rightLever.setSrAccessDuration(30000);
  rightLever.setDelayToSr(0);
  rightLever.addResponseKey('w');
  
  leftLever.start();
  rightLever.start();
}

void srAccessComplete() {
  if (leftLever.paused) leftLever.unpause();
  else if (rightLever.paused) rightLever.unpause();
  
  cumulativePausedTime += currentPausedTime;
  currentPausedTime = 0;
}

long currentSessionTime_ms() {
  return (((millis() - cumulativePausedTime - currentPausedTime)));
}

void draw() {
  if (keyPressed) keyPress();
  background(0);
  
  if (leftLever.srAccessStartTime != -1 || rightLever.srAccessStartTime != -1) {
    if (leftLever.srAccessStartTime != -1) currentPausedTime = millis() - leftLever.srAccessStartTime;
    else if (rightLever.srAccessStartTime != -1) currentPausedTime = millis() - rightLever.srAccessStartTime;
  }
  leftLever.draw();
  rightLever.draw();
  
  fill(255,255,255);
  String msg = "Total Session Time: " + (floor(currentSessionTime_ms() / 1000));
  float msgWidth = textWidth(msg);
  text(msg, width/2 - msgWidth/2, height*.12);
}

void keyPress() {
  if (key == lastKey) return;
  else lastKey = key;
  
  if (key == leftLever.responseKey) {
    if (leftLever.respond()) rightLever.pause();
  } else if (key == rightLever.responseKey) {
    if (rightLever.respond()) leftLever.pause();
  } else println("no match");
}

void keyReleased() {
  lastKey = 0;
}

void mousePressed() {
  if (leftLever.click()) {
    rightLever.pause();
  } else if (rightLever.click()) {
    leftLever.pause();
  }
}
class VISchedule {
  long startTime;
  long pauseStartTime;
  long totalPausedTime;
  boolean paused;
  ArrayList<Long> sampleTimes;
  long srAvailableTime;
  long srAccessDuration;
  long srAccessStartTime;
  long delayToSr;
  PVector position;
  PVector size;
  char responseKey;
  
  VISchedule(PVector position_, PVector size_) {
    position = position_;
    size = size_;
    sampleTimes = new ArrayList<Long>();
    totalPausedTime = 0;
    srAvailableTime = -1;
    startTime = -1;
    srAccessStartTime = -1;
    responseKey = 0;
  }
  
  float calc_vi(float mean, int N, int n) { 
    //taken from Fleschler & Hoffman (1962)
    if (N == n) {
      return ( mean * (1 + log(N)));
    } else {
      return ( mean * (1 + log(N) + (N - n) * log(N - n) - (N - n + 1) * log(N - n + 1)) );
    }
  }
  
  void generateVISchedule(float avg, int N) {
    for (int i=1;i<=N;i++) {
      addSampleTime(floor(calc_vi(avg,N,i)));
    }
  }
  
  void addResponseKey(char responseKey_) {
    responseKey = responseKey_;
  }
  
  void addSampleTime(long s) {
    sampleTimes.add(s);
  }
  
  void setSrAccessDuration(long s) {
    srAccessDuration = s;
  }
  
  void setDelayToSr(long d) {
    delayToSr = d;
  }
  
  void start() {
    totalPausedTime = 0;
    srAvailableTime = -1;
    startTime = -1;
    srAccessStartTime = -1;
    
    startTime = millis();
    paused = false;
    
    int sampleIndex = floor(random(0,sampleTimes.size()));
    srAvailableTime = sampleTimes.get(sampleIndex);
    println("started clock, srAvailableTime=" + srAvailableTime);
  }
  
  void restart() {
    start();
  }
  
  void pause() {
    pauseStartTime = millis();
    paused = true;
  }
  
  void unpause() {
    if (paused) {
      totalPausedTime += millis() - pauseStartTime;
      paused = false;
    }
  }
  
  boolean srAvailable() {
    if (paused) return false;
    if (startTime == -1) return false;
    
    if (millis() - startTime - totalPausedTime > srAvailableTime) return true;
    else return false;
  }
  
  void draw() {
    if (srAccessStartTime != -1) {
      fill(255,255,255);
      String msg = "Sr Access";
      float msgWidth = textWidth(msg);
      text(msg, position.x+size.x/2-msgWidth/2, position.y - height*.1);
      
      
      if (millis() - srAccessStartTime >= srAccessDuration) {
        //If you wanted to stay in the access period until confirming that the Sr had been removed
        //msg = "Press Space to Continue";
        //msgWidth = textWidth(msg);
        //text(msg, width/2 - msgWidth/2, height*.8);
        println("reinforcer access period over. restarting");
        restart();
        srAccessComplete();
      } else {
        msg = "Time Remaining: " + (int(floor(srAccessDuration - (millis() - srAccessStartTime))/1000+1));
        msgWidth = textWidth(msg);
        text(msg, width/2 - msgWidth/2, height*.8);
      }
      
    }
    
    if (startTime != -1 && !paused && !srAvailable()) {
      stroke(0,0,255);
      fill(0,0,255);
    }  else if (paused) {
      stroke(100,100,100);
      fill(100,100,100);
    } else if (srAccessStartTime != -1) {
      stroke(255,255,0);
      fill(255,255,0);
    } else if (srAvailable()) {
      stroke(0,255,0);
      fill(0,255,0);
    } 
    
    rect(position.x, position.y, size.x, size.y);
    
    fill(0,0,0);
    if (srAvailable()) text("+", position.x + size.x/4, position.y + size.y);// + size.y/2);
    else text("-", position.x + size.x/4 , position.y - size.y);// + size.y/2);
  }
  
  boolean respond() {
    if (srAccessStartTime != -1) return false;
    
    println("responding " + millis());
    if (srAvailable()) {
      println("\tstarting srAccess");
      srAccessStartTime = millis();
      return true;
    }
    println("\tNo Sr available");
    return false;
  }
  boolean click() {
    if (mouseX >= position.x && mouseX <= position.x + size.x &&
        mouseY >= position.y && mouseY <= position.y + size.y) {
          return respond();
        }
    return false;
  }
}


