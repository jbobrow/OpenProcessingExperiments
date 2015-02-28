
// BRIAN CHRISTIE
//FOR ISTA301 SPRING 2013
// ASSIGNMENT #1


int startTime; // how long to pause
int speedChange; // offset from last run time
int speedChangeFactor; // how quickly to change speed
int runCount;

void setup () {
  size(800, 800); //canvas size
  background (030);
  startTime = millis();
  speedChange = 2000;
  speedChangeFactor = 70;
  runCount = 0;
  
}
 
void draw() {
    if(millis() >= startTime + speedChange){
      for (int i=0; i<8; i++) {
        float random_x = random(0, width);
        float random_y = random(0, height);
        fill(mouseX, mouseY, random(0, 255), random(80, 155));
        ellipse (random_x, random_y, 8, 80);
        startTime = millis();
      }
      if (speedChange >= 100) {
        speedChange = speedChange - speedChangeFactor;
        println("speedChange is" + speedChange); //debugging
      }
      runCount = runCount + 1;
       println("runCount is" + runCount); //debugging
      if (runCount >= 200) {
        float random_x = random(0, width);
        float random_y = random(0, height);
        fill(mouseX, mouseY, random(0, 255), random(150, 200));
        ellipse (random_x, random_y, random(200, 300), random(200, 300));
        runCount = 0;
      }
    }
}



