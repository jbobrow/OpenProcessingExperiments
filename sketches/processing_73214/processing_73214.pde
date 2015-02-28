
//////////////////////////////////////////////////////////////////////
//Fishing
//by Nick Contini
//Use the left and right arrow keys to move boat
//Catch the fish by moving the mouse and intersecting the fish with the end of the string
//String is limited to less than or equal to 250 pixels long
//Press the "s" key to switch from day to night
//Oct. 2nd, 2012
//////////////////////////////////////////////////////////////////////

void setup() {
  size(800, 800);
}
//intial fish x and y coordinates
int fish1X = -50;
int fish2X = 850;
int fish3X = -50;
int fish1Y = 475;
int fish2Y = 510;
int fish3Y = 550;

int boatX = 400;

//end of fishing rod string coordinates
int stringEndX, stringEndY;

//controls max length of fishing rod
final int STRING_LENGTH = 250;

//controls whether it is day or night
boolean daytime = true;

void draw() {
  
  //top fish behavior
  fish1();
  //middle fish behavior
  fish2();
  //bottom fish behavior
  fish3();
  
  background(0, 255, 255);
  
  //boolean relation that controls time of day
  if (daytime == true) {
    daytime();
  }
  if (daytime == false) {
    night();
  }
  
  //moves boat left and right
  if (keyPressed) {
    if (keyCode == LEFT) {
      boatX = boatX-5;
    }
    if (keyCode == RIGHT) {
      boatX = boatX+5;
    }
  }
  
  //draws boat
  fill(103, 15, 15);
  arc(boatX, 400, 200, 100, 0, PI);
  fill(255);
  triangle(boatX, 250, boatX-100, 390, boatX+100, 390);
  line(boatX, 400, boatX, 250);
  
  //creates water
  fill(0, 25, 25, 100);
  rectMode(CORNER);
  rect(-1, 425, 802, 375);
  
  //top fish
  fishRight(fish1X, fish1Y);
  //middle fish
  fishLeft(fish2X, fish2Y);
  //bottom fish
  fishRight(fish3X, fish3Y);
  
  fishingRod();

}

void daytime() {
  background(0, 255, 255);
  fill(255, 255, 0);
  ellipse(800, 0, 250, 250);
}

void night() {
  background(0, 0, 100);
  stroke(255);
  stars(30, 30);
  stars(310, 30);
  stars(590, 30);
  stars(30, 100);
  stars(310, 100);
  stars(590, 100);
  stars(30, 170);
  stars(310, 170);
  stars(590, 170);
  stars(30, 240);
  stars(310, 240);
  stars(590, 240);
  stars(30, 310);
  stars(310, 310);
  stars(590, 310);
  stars(65, 345);
  stars(345, 345);
  stars(625, 345);
}

//draws a 8 stars
void stars(int starX, int starY) {
  noStroke();
  fill(255);

  triangle(starX, starY, starX+6, starY+10, starX-6, starY+10);
  triangle(starX+6, starY+3, starX-6, starY+3, starX, starY+13);

  triangle(starX+35, starY+35, starX+41, starY+45, starX+29, starY+45);
  triangle(starX+41, starY+38, starX+29, starY+38, starX+35, starY+48);

  triangle(starX+70, starY, starX+76, starY+10, starX+64, starY+10);
  triangle(starX+76, starY+3, starX+64, starY+3, starX+70, starY+13);

  triangle(starX+105, starY+35, starX+111, starY+45, starX+99, starY+45);
  triangle(starX+111, starY+38, starX+99, starY+38, starX+105, starY+48);

  triangle(starX+140, starY, starX+146, starY+10, starX+134, starY+10);
  triangle(starX+146, starY+3, starX+134, starY+3, starX+140, starY+13);

  triangle(starX+175, starY+35, starX+181, starY+45, starX+169, starY+45);
  triangle(starX+181, starY+38, starX+169, starY+38, starX+175, starY+48);

  triangle(starX+210, starY, starX+216, starY+10, starX+204, starY+10);
  triangle(starX+216, starY+3, starX+204, starY+3, starX+210, starY+13);

  triangle(starX+245, starY+35, starX+251, starY+45, starX+239, starY+45);
  triangle(starX+251, starY+38, starX+239, starY+38, starX+245, starY+48);

  stroke(0);
}

//controls day/night switch
void keyPressed() {
  if (key == 's' || key == 'S') {
    daytime=!daytime;
  }
}

void fishingRod() {
  fill(100, 15, 15);
  triangle(boatX-20, 400, boatX-30, 400, boatX-50, 300);
  //limits length of string when mouse travels too far from boat
  if (hypDistance()>STRING_LENGTH) {
    stringEndX = stringEndX();
    stringEndY = stringEndY();
  }
  else {
    stringEndX = mouseX;
    stringEndY = mouseY;
  }
  line(boatX-50, 300, stringEndX, stringEndY);
}

//draws fish facing left
void fishLeft(int fishX, int fishY) {
  //fish when on string
  if (fishX < stringEndX+37 && fishX > stringEndX-62 && fishY < stringEndY + 25 && fishY > stringEndY - 25) {
    arc(stringEndX, stringEndY+37, 25, 75, PI/2, 3*PI/2);
    arc(stringEndX, stringEndY+37, 25, 75, -PI/2, PI/2);
    triangle(stringEndX, stringEndY+75, stringEndX+15, stringEndY+100, stringEndX-15, stringEndY+100);
  }
  //fish swimming
  else {
    arc(fishX, fishY, 75, 25, 0, PI);
    arc(fishX, fishY, 75, 25, PI, 2*PI);
    triangle(fishX+37, fishY, fishX+62, fishY+15, fishX+62, fishY-15);
    point(fishX-25, fishY-5);
  }
}

//draws fish facing right
void fishRight(int fishX, int fishY) {
  //fish when on string
  if (fishX < stringEndX+37 && fishX > stringEndX-62 && fishY < stringEndY + 25 && fishY > stringEndY - 25) {
    arc(stringEndX, stringEndY+37, 25, 75, PI/2, 3*PI/2);
    arc(stringEndX, stringEndY+37, 25, 75, -PI/2, PI/2);
    triangle(stringEndX, stringEndY+75, stringEndX+15, stringEndY+100, stringEndX-15, stringEndY+100);
  }
//fish when swimming
  else {
    arc(fishX, fishY, 75, 25, 0, PI);
    arc(fishX, fishY, 75, 25, PI, 2*PI);
    triangle(fishX-37, fishY, fishX-62, fishY+15, fishX-62, fishY-15);
    point(fishX+25, fishY-5);
  }
}

//top fish
void fish1() {
  //allows fish to be caught
  if (fish1X < stringEndX+37 && fish1X > stringEndX-62 && fish1Y < stringEndY + 25 && fish1Y > stringEndY - 25) { 
    fish1X = stringEndX;
    fish1Y = stringEndY;
  }
  //normal fish behavior
  else {
    fish1X = fish1X+2;
    if (fish1X == 862) {
      fish1X = -50;
      fish1X = fish1X + 2;
    }
  }
  //allows fish to be put in boat
  if (fish1X == stringEndX && fish1X < boatX+50 && fish1X > boatX-50 && fish1Y < 450 && fish1Y > 400) {
    fish1X = -50;
    fish1X = fish1X + 2;
    fish1Y = 475;
  }
}

//middle fish
void fish2() {
  //allows fish to be caught
  if (fish2X < stringEndX+62 && fish2X > stringEndX-37 && fish2Y < stringEndY + 25 && fish2Y > stringEndY - 25) { 
    fish2X = stringEndX;
    fish2Y = stringEndY;
  }
  //normal fish behavior
  else {
    fish2X = fish2X-1;
    if (fish2X == -62) {
      fish2X = 850;
      fish2X = fish2X - 1;
    }
  }
  //allows fish to be put in boat
  if (fish2X == stringEndX && fish2X < boatX+50 && fish2X > boatX-50 && fish2Y < 450 && fish2Y > 400) {
    fish2X = 850;
    fish2X = fish2X - 1;
    fish2Y = 510;
  }
}

//bottom fish
void fish3() {
  //allows fish to be caught
  if (fish3X < stringEndX+37 && fish3X > stringEndX-62 && fish3Y < stringEndY + 25 && fish3Y > stringEndY - 25) { 
    fish3X = stringEndX;
    fish3Y = stringEndY;
  }
  //normal fish behavior
  else {
    fish3X = fish3X+3;
    if (fish3X == 862) {
      fish3X = -50;
      fish3X = fish3X + 3;
    }
  }
  //allows fish to be put in boat
  if (fish3X == stringEndX && fish3X < boatX+50 && fish3X > boatX-50 && fish3Y < 450 && fish3Y > 400) {
    fish3X = -50;
    fish3X = fish3X + 3;
    fish3Y = 550;
  }
}

//functions to calculate string end coordinates
int stringEndX() {
  int x = (int)(boatX + STRING_LENGTH*(mouseX-(boatX))/hypDistance());
  return (x);
}
int stringEndY() {
  int y = (int)(300+STRING_LENGTH*(mouseY-300)/hypDistance());
  return (y);
}

//calculates the distance between the mouse and the end of fishing rod
float hypDistance() {
  float hypDistance = sqrt((mouseX-(boatX))*(mouseX-(boatX))+(mouseY-300)*(mouseY-300));
  return hypDistance;
}

