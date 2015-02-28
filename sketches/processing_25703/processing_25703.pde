
Timer timer;

//////////////////////////////////////////////////////////
void setup() {
  timer = new Timer(5000); // 5 seconds or 5000 milliseconds  
}

//////////////////////////////////////////////////////////
void draw() {
  if (timer.finished()) {
    background(255);
  }  
  else {
    background(0);  
  }
}

//////////////////////////////////////////////////////////
void mousePressed() {
  //timer.reset();
  timer.reset( int(random(1000, 4000)) );  
  println("New timer: " + timer.timeout + " ms");
}

//////////////////////////////////////////////////////////
// Lets put the concept of a "timer" into a class!
class Timer {
  long startTime;
  int timeout; // in milliseconds

  Timer(int timeout) {
    this.timeout = timeout;
    this.startTime = millis();  
  }
  
  // Returns the time elapsed since the timer started
  long elapsed() {
    return millis() - startTime;
  }
  
  // Return true if the timer is finished
  boolean finished() {
    if (elapsed() > timeout) return true;
    return false;
  }
  
  // Reset the timer
  void reset() {
    this.startTime = millis();  
  }
  
  // Reset the timer and provide a new timeout 
  // Note: we can have two functions with the same name within a class
  // as long as they have different parameters...
  void reset(int newTimeout) {
    this.reset();  // call the vanilla reset() without any parameter
    timeout = newTimeout;  // update the timeout
  }
}
