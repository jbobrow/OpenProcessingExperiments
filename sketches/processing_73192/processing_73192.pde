
///////////////////////////////////////////////////////////////////////////////////////////
//Daniel Kellett
//CSE 174H
//Program6
//Oct 3, 2012
//Animation of a guy running (technically skating, didn't quite 
//get around to animating the guy.)
//USE ARROW KEYS TO CHANGE GRADE OF PATH (UP/DOWN)
//AND WIND (LEFT/RIGHT)
//***NOTE*** Wind and Grade do not affect final overall speed.
// I did not have the time to figure out what the calculations 
//needed to be. Hopefully will be able to go back and do that later.
///////////////////////////////////////////////////////////////////////////////////////
//Default speed
final float USAIN_SPEED = 1.5;
//variables that will influence speed (TODO: Write equations)
float wind = 25;
float grade = 75;
//variables for drawing the landscape
float treeX = 400;
float flagX = 100;

boolean checkTime = false;



void setup() {
  size(500, 300);
}

void draw() {
  background(255);
  changeGrade();
  changeWind();
  drawLandscape();
  updateLandscape();
  drawUsainNut();
}

void drawUsainNut() {
  fill(0);

  //head
  ellipse(250, 150, 30, 30);

  strokeWeight(5);

  //left arm
  line(250, 170, 263, 185);
  line(265, 185, 275, 175);

  //body
  line(250, 150, 250, 200);

  //right arm
  line(250, 170, 242, 185);
  line(242, 185, 255, 190);

  //left leg
  line(250, 200, 237, 215);
  line(237, 215, 230, 215);

  //right leg
  line(250, 200, 260, 210);
  line(260, 210, 265, 225);
}

//Method for drawing the background
void drawLandscape() {

  int treeWidth = 25;
  int treeHeight = 100;

  //grass
  fill(14, 155, 29);
  quad(0, 225, 0, 305, width, 305, width, height-grade);


  //Is it day or night?
  strokeWeight(1);
  timeCheck();
  if (checkTime == false) {
    fill(143, 230, 232);
    quad(0, 0, 0, 220, 500, height-grade-5, 500, 0);
    fill(234, 223, 2);
    ellipse(25, 25, 25, 25);
  } 
  else {
    fill(6, 9, 62);
    quad(0, 0, 0, 220, 500, height-grade-5, 500, 0);
    fill(255);
    ellipse(25, 25, 25, 25);
  }

  strokeWeight(1);
  //Tree
  fill(106, 68, 36);
  rect(treeX, 120, treeWidth, treeHeight);
  fill(38, 126, 40, 191);
  noStroke();
  ellipse(treeX-10, 120, 80, 80);
  ellipse(treeX+10, 100, 90, 90);
  ellipse(treeX+35, 115, 80, 80);

  //Flag (use this to check strength and direction of wind)
  stroke(121);
  strokeWeight(12);
  line(flagX, 115, flagX, 215);
  strokeWeight(1);
  stroke(0);
  quad(flagX, 115, flagX, 145, 
  flagX-wind, 145, flagX-wind, 115); 

  //Path
  line(0, height-75, width, height-grade);
}


//Updating the background to make it appear as though
//Usain is moving
void updateLandscape() {
  //preferably I would like this to be a function of grade, wind,
  //and USAIN_SPEED but I am not sure how to make it work so that
  //Usain is always moving forward.
  treeX = treeX-(USAIN_SPEED);
  if (treeX < -75) 
    treeX = 650;
  flagX = flagX-(USAIN_SPEED);
  if (flagX < -25) 
    flagX = 650;
}

//Controls for changing wind.
//TODO: This will also affect total speed
float changeWind() {  
  if (keyPressed) {
    if (keyCode == LEFT) {
      wind = wind+1;
    } 
    else 
      if (keyCode == RIGHT) {
      wind = wind-1;
    }
  }
  return wind;
}

//Controls for changing the grade of the path being run
//TODO: This will also affect the total speed
float changeGrade() {
  if (keyPressed) {
    if (keyCode == UP) {
      grade = grade+0.1;
    } 
    else 
      if (keyCode == DOWN) {
      grade = grade-0.1;
    }
  }
  return grade;
}

boolean timeCheck() {
  if (treeX == 500)
    checkTime = !checkTime;
  return checkTime;
}


