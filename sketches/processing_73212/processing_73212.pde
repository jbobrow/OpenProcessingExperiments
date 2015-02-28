
//Megan Gabel
//Program 6
//This program allows you to make your own toast by 
//clicking the little black knob.
//You can pick up the toast by clicking on it.
//Be wary about the time you let your toast sit,
//or else it will burn!

//Amount of time until toast will burn
final float SECONDS_UNTIL_BURNT_TOAST = 6;

//Sets up toast not being present initially
boolean toast = false;

//Sets initial time to 0
float timeOfPickup = 0;

//Sets up general background/size
void setup() {
  size(600, 600);
  rectMode(CENTER);
  smooth();
  background(255);
}

//Draws the parts of the scene which don't change
void draw() {
  fill(255);
  rect(300, 300, 600, 600);
  if (toast == true) {
    if (timeInToaster()>SECONDS_UNTIL_BURNT_TOAST) {
      drawBurntToast();
    }
    else {
      drawToast();
    }
  }
  drawToaster();
  drawCounter();
}

//Draws the toaster and cord
void drawToaster() {
  stroke(125);
  fill(125);
  rect(300, 300, 150, 100);
  stroke(0);
  fill(0);
  rect(380, 332, 10, 5);
  line(0, 340, 225, 340);
}

//Draws the counter and drawers below
void drawCounter() {
  fill(170, 100, 0);
  rect(300, 370, 600, 40);
  rect(300, 500, 600, 260);
  rect(120, 420, 130, 60);
  rect(300, 420, 130, 60);
  rect(480, 420, 130, 60);
  ellipse(120, 420, 10, 10);
  ellipse(300, 420, 10, 10);
  ellipse(480, 420, 10, 10);
  rect(150, 600, 250, 200);
  rect(450, 600, 250, 200);
}

//Draws the toast
void drawToast() {
  stroke(100, 50, 0);
  fill(100, 50, 0);
  rect(265, 235, 50, 30);
  ellipse(250, 220, 30, 30);
  ellipse(280, 220, 30, 30);
  rect(335, 235, 50, 30);
  ellipse(320, 220, 30, 30);
  ellipse(350, 220, 30, 30);
  stroke(230, 170, 100);
  fill(230, 170, 100);
  rect(265, 235, 40, 30);
  ellipse(250, 220, 25, 25);
  ellipse(280, 220, 25, 25);
  rect(335, 235, 40, 30);
  ellipse(320, 220, 25, 25);
  ellipse(350, 220, 25, 25);
}

//Draws the burnt toast
void drawBurntToast() {
  stroke(0);
  fill(0);
  rect(265, 235, 50, 30);
  ellipse(250, 220, 30, 30);
  ellipse(280, 220, 30, 30);
  rect(335, 235, 50, 30);
  ellipse(320, 220, 30, 30);
  ellipse(350, 220, 30, 30);
}

//Allows the toast to pop out of the toaster
//If toast is clicked on, it will disappear
//Be careful to grab the toast quickly,
//or else it will burn!
void mousePressed() {
  if (mouseX < 390 && mouseX > 370 
    && mouseY < 337 && mouseY > 327) {
    toast=true;
  }
  else {
    if (mouseX < 375 && mouseX > 225 
      && mouseY < 250 && mouseY > 220) {
      toast = false;
      timeOfPickup = millis();
    }
  }
}

//Calculates the time that the toast has been in the toaster
//After the toast is grabbed, resets toaster's timer
float timeInToaster() {
  float millisecondsInToaster = millis()-timeOfPickup;
  float result = millisecondsInToaster/1000;
  return result;
}


