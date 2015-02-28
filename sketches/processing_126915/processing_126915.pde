
int bgx = 100; //Balloon Guy Initial XPos
int bgy = 0; //Balloon Guy Initial YPos
int ax = 400; //Initial Dart XPos
int speed = -2; //Starting Speed
int score = 0; //Score
float ay = 200; //Initial Dart YPos
float rand = random(0, 175); //rand Calls a Random Number

void setup() {
  size(400, 400); //Window Size
}

void draw() {
  background(0, 50, 250); //Background Color
  fill(30, 255, 0); //Grass Color
  stroke(100, 100, 200); //Grass Outline Color
  rect(0, 322, 400, 100); //Draws Ground 
  fill(0, 200, 255); //Score Box Color
  stroke(0, 200, 255); //Score Box Outline Color
  rect(0, 0, 400, 32); //Draws Score Box
  drawDart(20, 20); //Draws Dart
  drawBalloon(200, 200); //Draws BlobGuy
  bgy = mouseY; //Balloon Follows Mouse
  
  if(ax <= 70 && ax >50 && ay >= bgy - 100 && ay <= bgy){ //End Game
  ax = 400;
  speed = -2;
  score = 0;
  bgx = 100;
  bgy = 0;
  ay = 200;
  rand = random(0, 175);
  }
  
  fill(0);
  text("Score = " + score , 20, 20); //Score Box
  score = -speed -2; //Keeps Score

  if (bgy >= 251) { //Ground Boundary
    bgy = 250;
  }

  if (bgy <=24) { //Top Screen Boundary
    bgy = 25;
  }

  if (ax < -200) { //Resets The Dart
    ax = 400;
    ay = rand;
    rand = random(0, 175);        
    speed = speed-1; //Speeds Up Dart 
  }

  
}

void drawDart(float x, float y) { //Dart Code
  ax = ax+speed;
  fill(200, 150, 100); //Dart Color
  stroke(200, 150, 100); //Dart Outline Color
  rect(ax+100, ay+90, 30, 20); //Square of Dart
  triangle(ax+100, ay+80, ax+100, ay+120, ax+80, ay+100); //Triangle of Dart
}

void drawBalloon(int x, int y ) { //Balloon Code
  fill(0, 200, 255); //Balloon Color
  stroke(0); //Balloon Outline Color
  ellipse(bgx+20, bgy+40, 40, 40); 
  ellipse(bgx+40, bgy+30, 10, 10);
  ellipse(bgx+0, bgy+30, 10, 10);
  ellipse(bgx+0, bgy+60, 20, 20);
  ellipse(bgx+40, bgy+60, 20, 20);
  ellipse (bgx+20, bgy+20, 20, 20);
  rect(bgx+25, bgy+10, 5, 5);
  rect(bgx+10, bgy+10, 5, 5);
}




