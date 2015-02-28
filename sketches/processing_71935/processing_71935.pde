
//In consideration of the integration of this class, there was no intent to steal the origninal concept of changing the background every 5000 milliseconds.
//This "Timer" class was borrowed from the original source and adapted to fit with the goals of the project.
//"Timer" class is included with this file and can be referenced to <http://www.learningprocessing.com/examples/chapter-10/example-10-5/>

class Timer { //makes a class known as "Timer"

  int savedTime; // When timer is started
  int totalTime; // How long the timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Start the timer
  void start() {
    // Upon timer start, time is stored in seconds.
    savedTime = millis();
  }

  // Function finished and set time of milliseconds have occured.
  boolean isCompleted() {
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}


