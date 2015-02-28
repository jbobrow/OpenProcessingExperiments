
/***************************************
 * A simple randomized scene selector. Does not use delay, but instead, a timer
 * that makes use of the current millis() reading and compares it to the last backup.
 * At scene 4, there is a pause in the flow of the program, where you can click a simple 
 * button. 
 * These two strategies could be reconfigured to the needs of your individual project. 
 * If, for ex, you want to go forward by 1 secene, simply change the random scene selector to
 * selector++, etc.
 *
 * M. Kontopoulos. 2012. ACCD ID2
 ***************************************/

int selector = 1; //A selector for which scene to display.
float startTime; //Needed for timing calculations
boolean pause;   //A boolean that pauses the selection process.

void setup() {
  size(640, 480);
  smooth();
}
void draw() {
  background(50);
  fill(255);

  //Which scene to currently display.
  if (selector == 1) {
    scene01();
  } 
  else if (selector == 2) {
    scene02();
  } 
  else if (selector == 3) {
    scene03();
  } 
  else if (selector == 4) {
    pause = true;
    scene04();
  }

  //Timing Controls. See GSwP ch. 7, "Timers"
  if (pause == false) { //Of course, only do any of this is pause is false.
    if (millis() - startTime >= 1500) {
      selector = 1 + floor(random(4)); //random btwn 1 and 4. Why am I using "floor"?
      startTime = millis(); //reset timer
      println("Picking a new scene");
    }
  }
}


void scene01() {
  text("Scene 01", 100, 100);
}
void scene02() {
  text("Scene 02", 200, 200);
}
void scene03() {
  text("Scene 03", 300, 300);
}
void scene04() {
  text("Scene 04", 400, 400);
  //Throw a button into the mix.
  if (mouseX > 400 && mouseX<500 && mouseY>410 && mouseY<440) {
    fill(255, 0, 0);
    if (mousePressed) {
      //On press, Do the same stuff that's done in the timer. Also, unpause.
      //This will "break" us out of scene 4.
      selector = 1 + floor(random(4)); //random btwn 1 and 4 
      startTime = millis(); //reset timer
      pause = false;
    }
  }
  //The actual button drawing.
  rect(400, 410, 100, 30);
  fill(0);
  text("Continue?", 420, 430);
}



