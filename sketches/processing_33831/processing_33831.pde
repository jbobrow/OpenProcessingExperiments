
/*

 Liz Rutledge
 In-Class Example Timers
 August 12, 2011
 
 */

// variable to log the last time the timer event was triggered
int lastSavedTime;
int timeInterval;
int timer=0;

//declare font
PFont font;

//timer to see how many times timer event has been triggered
int timeCounter = 0;
int fullCycleCounter = 0;

//initial background color
int bg = 0;

void setup() {
  size(500, 400);
  smooth();
  font = createFont("Arial", 32);
  textAlign(CENTER);

  //initiating first timer marked (millis() is equal to the time elapsed since beginning of sketch)
  lastSavedTime = millis();
  timeInterval = 600;
}

void draw() {
  //  println(millis());
  background(bg);

  doStuff();
}


// custom function for all our activity
void doStuff() {
  ellipse(width/2, height/2, 100, 100);


  timer = millis() - lastSavedTime;
  if ( timer > timeInterval) {
    if (bg <= 255-20) {

      bg += 26;


      println(timeCounter);
    }
    else {
      bg = 0;
      //increment how many times full cycle has occurred
      fullCycleCounter++;
    }
    println(bg);
    //reset the timer
    timeCounter ++;

    lastSavedTime = millis();
  }

  printNumberOfCycles();
}

void printNumberOfCycles() {
  fill(0);
  textFont(font, 32);

  text((fullCycleCounter), width/2, height/2+8);
  textFont(font, 14);
  text((timeCounter), width/2, height/2+40);
  fill(255);
}


