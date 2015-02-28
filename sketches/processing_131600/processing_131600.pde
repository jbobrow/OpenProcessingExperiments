
import controlP5.*;
ControlP5 controlP5;
MyControlListener myListener;
Button b;
Rounds[] rounds = new Rounds[6]; 
Turns[][] grid; 
int subX;
int num;
int newX;
int cols = 6;
int rows = 3;
int turnCount;
boolean p2 = true;
boolean p3, p4 = false; 
boolean t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18 = false; 
boolean r1, r2, r3, r4, r5, r6 = false;
boolean startGame = false;
String instructions;
boolean noGame = true;
float flashColor;

//grid bgnd
float[][] distances;
float maxDistance;
int spacer; 

void setup() {
  size(640, 475);
  colorMode(RGB);
  textFont(createFont("Georgia", 24));
  turnCount=0;
  flashColor=0;
  instructions = "SELECT # OF PLAYERS AND PRESS START";
  //gui
  controlP5 = new ControlP5(this);
  //slider (name, minValue, maxValue, defaultValue, x, y, width, height)  
  controlP5.addSlider("PLAYERS", 2, 4, 0, 40, 360, 100, 20);
  Slider s1 = (Slider)controlP5.controller("PLAYERS");
  s1.setNumberOfTickMarks(3);
  s1.setColorCaptionLabel(0);
  s1.setSliderMode(Slider.FLEXIBLE);
  myListener = new MyControlListener();
  controlP5.controller("PLAYERS").addListener(myListener);
  //button
  controlP5.addButton("START", 50, 225, 360, 30, 20);
  controlP5.addButton("TURN", 50, 300, 360, 300, 20);

  // Initialize Rounds
  for (int i = 0; i < rounds.length; i ++ ) {
    subX += 100;
    rounds[i] = new Rounds(width-subX, 50);
  }
  // Initialize Turns
  grid = new Turns[cols][rows];

  // The counter variables i and j are also the column and row numbers
  // In this example, they are used as arguments to the constructor for each object in the grid.
  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      // Initialize each object
      grid[i][j] = new Turns(i*100, j*70, 0);
    }
  }

  //grid bgnd
  maxDistance = dist(width/2, height/2, width, height);
  distances = new float[width][height];
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float distance = dist(width/2, height/2, x, y);
      distances[x][y] = distance/maxDistance * 255;
    }
  }
  spacer = 10;
}

void draw() {
  background(#D3E2E5);  

  //grid bgnd
  for (int y = 0; y < height; y += spacer) {
    for (int x = 0; x < width; x += spacer) {
      stroke(distances[x][y]);
      point(x + spacer/2, y + spacer/2);
    }
  }

  //rectangles and lines
  stroke(0);
  fill(150);
  rect(0, 340, width, 60);
  line(0, 5, width, 5);
  line(0, 55, width, 55);
  line(0, 340, width, 340);
  line(0, 400, width, 400);
  line(18, 340, 18, 400);
  line(211, 340, 211, 400);
  line(271, 340, 271, 400);
  line(width-18, 340, width-18, 400);
  fill(25);
  rect(0, 400, width, height);

  //dynamic instructions
  if (noGame = true) {
    fill(#D3E2E5);
    textFont(createFont("Monospaced-18", 18));    
    text(instructions, width/2, 445);
  }


  //static title
  textAlign(CENTER);
  fill(51);
  textFont(createFont("Georgia", 24));
  text("Clash of Cultures Digital TURN TRACKER", width/2, 40);

  // Display Rounds
  for (int i = 0; i < rounds.length; i ++ ) {
    rounds[i].display();
  }

  //Display Turns
  for (int i = 0; i < cols; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {
      grid[i][j].display();
      grid[i][j].titles();
    }
  }

  //Display Titles I couldn't figure out how to display in arrays
  roundTitles();

  //Start Everything
  if (startGame == true) {
    gamePlay();
  }
}

void gamePlay() {
  if (p2 == true) {
    twoPlayerMode();
  }
  if (p3 == true) {
    threePlayerMode();
  }
  if (p4 == true) {
    fourPlayerMode();
  }
}

void roundTitles() {
  fill(255);

  //rounds
  textFont(createFont("Georgia", 18));
  text("I", 65, 97);
  text("II", 165, 97);
  text("III", 265, 97);
  text("IV", 365, 97);
  text("V", 465, 97);
  text("VI", 565, 97);

  //turns
  textFont(createFont("Georgia", 12));
  text("I", 65, 160);
  text("I", 165, 160);
  text("I", 265, 160);
  text("I", 365, 160);
  text("I", 465, 160);
  text("I", 565, 160);

  text("II", 65, 230);
  text("II", 165, 230);
  text("II", 265, 230);
  text("II", 365, 230);
  text("II", 465, 230);
  text("II", 565, 230);

  text("III", 65, 300);
  text("III", 165, 300);
  text("III", 265, 300);
  text("III", 365, 300);
  text("III", 465, 300);
  text("III", 565, 300);
}

public void START() {
  //reset some stuff
  turnCount=0;
  for (int i = 0; i < rounds.length; i ++ ) {
    rounds[i].restart();
  }  
  for (int i = 0; i < cols; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {
      grid[i][j].turnRestart();
    }
  }

  //lets get started
  startGame=true;
}

public void TURN() {
  turnCount++;
  println("turn"+turnCount);
}

class MyControlListener implements ControlListener {
  int col;
  public void controlEvent(ControlEvent theEvent) {
    //    println("player count" +
    //      theEvent.controller().value());
    col = (int)theEvent.controller().value();
    if (col == 2) {
      p2 = true;
      p3 = false;
      p4 = false;
    }
    if (col == 3) {
      p2 = false;
      p3 = true;
      p4 = false;
    }
    if (col == 4) {
      p2 = false;
      p3 = false;
      p4 = true;
    }
  }
}

void twoPlayerMode() {

  //rounds
  if (turnCount <= 5) {
    rounds[5].roundStart();
    instructions="Round 1 In Progress";
  } 
  else if (turnCount == 6) {
    rounds[5].roundOver();
    rounds[4].flash();
    instructions="Before Round 2 Begins Complete STATUS PHASE";
  } 
  else if ((turnCount > 6) && (turnCount <= 11)) {
    rounds[4].roundStart();
    instructions="Round 2 In Progress";
  }
  else if (turnCount == 12) {
    rounds[3].flash();
    rounds[4].roundOver();
    instructions="Before Round 3 Begins Complete STATUS PHASE";
  }
  else if ((turnCount >= 11) && (turnCount <= 17)) {
    rounds[3].roundStart();
    instructions="Round 3 In Progress";
  } 
  else if (turnCount == 18) {
    rounds[2].flash();
    rounds[3].roundOver();
    instructions="Before Round 4 Begins Complete STATUS PHASE";
  }
  else if ((turnCount >= 17) && (turnCount <= 23)) {
    instructions="Round 4 In Progress";
    rounds[2].roundStart();
  } 
  else if (turnCount==24) {
    rounds[1].flash();
    rounds[2].roundOver();
    instructions="Before Round 5 Begins Complete STATUS PHASE";
  }
  else if ((turnCount >= 23) && (turnCount <= 29)) {
    rounds[1].roundStart();
    instructions="Round 5 In Progress";
  }
  else if (turnCount==30) {
    rounds[0].flash();
    rounds[1].roundOver();
    instructions="Before Round 6 Begins Complete STATUS PHASE";
  } 
  else if ((turnCount >= 29) && (turnCount < 36)) {
    rounds[0].roundStart();
    rounds[1].roundOver();
    instructions="Round 6 In Progress";
  }
  else if ((turnCount == 36)) {
    rounds[0].roundOver();
    instructions = "SELECT # OF PLAYERS AND PRESS START";
  }

  //turns
  if (turnCount < 2) {
    grid[0][0].turnStart();
  } 
  else if ((turnCount >= 2) && (turnCount < 4)) { 
    grid[0][0].turnOver();
    grid[0][1].turnStart();
  } 
  else if ((turnCount >= 4) && (turnCount < 6)) { 
    grid[0][1].turnOver();
    grid[0][2].turnStart();
  } 
  else if ((turnCount == 6)) { 
    grid[0][2].turnOver();
  } 
  else if ((turnCount >= 6) && (turnCount < 8)) { 
    grid[0][2].turnOver();
    grid[1][0].turnStart();
  } 
  else if ((turnCount >= 8) && (turnCount < 10)) { 
    grid[1][0].turnOver();
    grid[1][1].turnStart();
  } 
  else if ((turnCount >= 10) && (turnCount < 12)) { 
    grid[1][1].turnOver();
    grid[1][2].turnStart();
  } 
  else if ((turnCount == 12)) { 
    grid[1][2].turnOver();
  } 
  else if ((turnCount >= 12) && (turnCount < 14)) { 
    grid[1][2].turnOver();
    grid[2][0].turnStart();
  } 
  else if ((turnCount >= 14) && (turnCount < 16)) { 
    grid[2][0].turnOver();
    grid[2][1].turnStart();
  } 
  else if ((turnCount >= 16) && (turnCount < 18)) { 
    grid[2][1].turnOver();
    grid[2][2].turnStart();
  } 
  else if ((turnCount == 18)) { 
    grid[2][2].turnOver();
  } 
  else if ((turnCount >= 18) && (turnCount < 20)) { 
    grid[2][2].turnOver();
    grid[3][0].turnStart();
  } 
  else if ((turnCount >= 20) && (turnCount < 22)) { 
    grid[3][0].turnOver();
    grid[3][1].turnStart();
  } 
  else if ((turnCount >= 22) && (turnCount < 24)) { 
    grid[3][1].turnOver();
    grid[3][2].turnStart();
  } 
  else if ((turnCount == 24)) { 
    grid[3][2].turnOver();
  } 
  else if ((turnCount >= 24) && (turnCount < 26)) { 
    grid[3][2].turnOver();
    grid[4][0].turnStart();
  } 
  else if ((turnCount >= 26) && (turnCount < 28)) { 
    grid[4][0].turnOver();
    grid[4][1].turnStart();
  } 
  else if ((turnCount >= 28) && (turnCount < 30)) { 
    grid[4][1].turnOver();
    grid[4][2].turnStart();
  } 
  else if ((turnCount == 30)) { 
    grid[4][2].turnOver();
  } 
  else if ((turnCount >= 30) && (turnCount < 32)) { 
    grid[4][2].turnOver();
    grid[5][0].turnStart();
  } 
  else if ((turnCount >= 32) && (turnCount < 34)) { 
    grid[5][0].turnOver();
    grid[5][1].turnStart();
  } 
  else if ((turnCount >= 34) && (turnCount < 35)) { 
    grid[5][1].turnOver();
    grid[5][2].turnStart();
  } 
  else if (turnCount > 35) { 
    grid[5][2].turnOver();
  }
}


void threePlayerMode() {

  //rounds
  if (turnCount <= 8) {
    rounds[5].roundStart();
    instructions="Round 1 In Progress";
  } 
  else if (turnCount == 9) {
    rounds[5].roundOver();
    rounds[4].flash();
    instructions="Before Round 2 Begins Complete STATUS PHASE";
  } 
  else if ((turnCount > 9) && (turnCount <= 17)) {
    rounds[4].roundStart();
    instructions="Round 2 In Progress";
  }
  else if (turnCount == 18) {
    rounds[3].flash();
    rounds[4].roundOver();
    instructions="Before Round 3 Begins Complete STATUS PHASE";
  }
  else if ((turnCount >= 18) && (turnCount <= 26)) {
    rounds[3].roundStart();
    instructions="Round 3 In Progress";
  } 
  else if (turnCount == 27) {
    rounds[2].flash();
    rounds[3].roundOver();
    instructions="Before Round 4 Begins Complete STATUS PHASE";
  }
  else if ((turnCount >= 27) && (turnCount <= 35)) {
    instructions="Round 4 In Progress";
    rounds[2].roundStart();
  } 
  else if (turnCount==36) {
    rounds[1].flash();
    rounds[2].roundOver();
    instructions="Before Round 5 Begins Complete STATUS PHASE";
  }
  else if ((turnCount >= 36) && (turnCount <= 44)) {
    rounds[1].roundStart();
    instructions="Round 5 In Progress";
  }
  else if (turnCount==45) {
    rounds[0].flash();
    rounds[1].roundOver();
    instructions="Before Round 6 Begins Complete STATUS PHASE";
  } 
  else if ((turnCount >= 45) && (turnCount < 53)) {
    rounds[0].roundStart();
    rounds[1].roundOver();
    instructions="Round 6 In Progress";
  }
  else if ((turnCount == 54)) {
    rounds[0].roundOver();
    instructions = "SELECT # OF PLAYERS AND PRESS START";
  }  


  //turns
  if (turnCount < 3) {
    grid[0][0].turnStart();
  } 
  else if ((turnCount >= 3) && (turnCount < 6)) { 
    grid[0][0].turnOver();
    grid[0][1].turnStart();
  } 
  else if ((turnCount >= 6) && (turnCount < 9)) { 
    grid[0][1].turnOver();
    grid[0][2].turnStart();
  } 
  else if ((turnCount == 9)) { 
    grid[0][2].turnOver();
  } 
  else if ((turnCount >= 9) && (turnCount < 12)) { 
    grid[0][2].turnOver();
    grid[1][0].turnStart();
  } 
  else if ((turnCount >= 12) && (turnCount < 15)) { 
    grid[1][0].turnOver();
    grid[1][1].turnStart();
  } 
  else if ((turnCount >= 15) && (turnCount < 18)) { 
    grid[1][1].turnOver();
    grid[1][2].turnStart();
  } 
  else if ((turnCount == 18)) { 
    grid[1][2].turnOver();
  } 
  else if ((turnCount >= 18) && (turnCount < 21)) { 
    grid[1][2].turnOver();
    grid[2][0].turnStart();
  } 
  else if ((turnCount >= 21) && (turnCount < 24)) { 
    grid[2][0].turnOver();
    grid[2][1].turnStart();
  } 
  else if ((turnCount >= 24) && (turnCount < 27)) { 
    grid[2][1].turnOver();
    grid[2][2].turnStart();
  } 
  else if ((turnCount == 27)) { 
    grid[2][2].turnOver();
  } 
  else if ((turnCount >= 27) && (turnCount < 30)) { 
    grid[2][2].turnOver();
    grid[3][0].turnStart();
  } 
  else if ((turnCount >= 30) && (turnCount < 33)) { 
    grid[3][0].turnOver();
    grid[3][1].turnStart();
  } 
  else if ((turnCount >= 33) && (turnCount < 36)) { 
    grid[3][1].turnOver();
    grid[3][2].turnStart();
  } 
  else if ((turnCount == 36)) { 
    grid[3][2].turnOver();
  } 
  else if ((turnCount >= 36) && (turnCount < 39)) { 
    grid[3][2].turnOver();
    grid[4][0].turnStart();
  } 
  else if ((turnCount >= 39) && (turnCount < 42)) { 
    grid[4][0].turnOver();
    grid[4][1].turnStart();
  } 
  else if ((turnCount >= 42) && (turnCount < 45)) { 
    grid[4][1].turnOver();
    grid[4][2].turnStart();
  } 
  else if ((turnCount == 45)) { 
    grid[4][2].turnOver();
  } 
  else if ((turnCount >= 45) && (turnCount < 48)) { 
    grid[4][2].turnOver();
    grid[5][0].turnStart();
  } 
  else if ((turnCount >= 48) && (turnCount < 51)) { 
    grid[5][0].turnOver();
    grid[5][1].turnStart();
  } 
  else if ((turnCount >= 51) && (turnCount < 54)) { 
    grid[5][1].turnOver();
    grid[5][2].turnStart();
  } 
  else if (turnCount >= 54) { 
    grid[5][2].turnOver();
    instructions = "SELECT # OF PLAYERS AND PRESS START";
  }
}

void fourPlayerMode() {
  //rounds
  if (turnCount <= 11) {
    rounds[5].roundStart();
    instructions="Round 1 In Progress";
  } 
  else if (turnCount == 12) {
    rounds[5].roundOver();
    rounds[4].flash();
    instructions="Before Round 2 Begins Complete STATUS PHASE";
  } 
  else if ((turnCount > 12) && (turnCount <= 23)) {
    rounds[4].roundStart();
    instructions="Round 2 In Progress";
  }
  else if (turnCount == 24) {
    rounds[3].flash();
    rounds[4].roundOver();
    instructions="Before Round 3 Begins Complete STATUS PHASE";
  }
  else if ((turnCount >= 24) && (turnCount <= 35)) {
    rounds[3].roundStart();
    instructions="Round 3 In Progress";
  } 
  else if (turnCount == 36) {
    rounds[2].flash();
    rounds[3].roundOver();
    instructions="Before Round 4 Begins Complete STATUS PHASE";
  }
  else if ((turnCount >= 36) && (turnCount <= 47)) {
    instructions="Round 4 In Progress";
    rounds[2].roundStart();
  } 
  else if (turnCount==48) {
    rounds[1].flash();
    rounds[2].roundOver();
    instructions="Before Round 5 Begins Complete STATUS PHASE";
  }
  else if ((turnCount >= 48) && (turnCount <= 59)) {
    rounds[1].roundStart();
    instructions="Round 5 In Progress";
  }
  else if (turnCount==60) {
    rounds[0].flash();
    rounds[1].roundOver();
    instructions="Before Round 6 Begins Complete STATUS PHASE";
  } 
  else if ((turnCount >= 60) && (turnCount < 71)) {
    rounds[0].roundStart();
    rounds[1].roundOver();
    instructions="Round 6 In Progress";
  }
  else if ((turnCount == 72)) {
    rounds[0].roundOver();
    instructions = "SELECT # OF PLAYERS AND PRESS START";
  }  


  //turns
  if (turnCount < 4) {
    grid[0][0].turnStart();
  } 
  else if ((turnCount >= 4) && (turnCount < 8)) { 
    grid[0][0].turnOver();
    grid[0][1].turnStart();
  } 
  else if ((turnCount >= 8) && (turnCount < 12)) { 
    grid[0][1].turnOver();
    grid[0][2].turnStart();
  } 
  else if ((turnCount == 12)) { 
    grid[0][2].turnOver();
  } 
  else if ((turnCount >= 12) && (turnCount < 16)) { 
    grid[0][2].turnOver();
    grid[1][0].turnStart();
  } 
  else if ((turnCount >= 16) && (turnCount < 20)) { 
    grid[1][0].turnOver();
    grid[1][1].turnStart();
  } 
  else if ((turnCount >= 20) && (turnCount < 24)) { 
    grid[1][1].turnOver();
    grid[1][2].turnStart();
  } 
  else if ((turnCount == 24)) { 
    grid[1][2].turnOver();
  } 
  else if ((turnCount >= 24) && (turnCount < 28)) { 
    grid[1][2].turnOver();
    grid[2][0].turnStart();
  } 
  else if ((turnCount >= 28) && (turnCount < 32)) { 
    grid[2][0].turnOver();
    grid[2][1].turnStart();
  } 
  else if ((turnCount >= 32) && (turnCount < 36)) { 
    grid[2][1].turnOver();
    grid[2][2].turnStart();
  } 
  else if ((turnCount == 36)) { 
    grid[2][2].turnOver();
  } 
  else if ((turnCount >= 36) && (turnCount < 40)) { 
    grid[2][2].turnOver();
    grid[3][0].turnStart();
  } 
  else if ((turnCount >= 40) && (turnCount < 44)) { 
    grid[3][0].turnOver();
    grid[3][1].turnStart();
  } 
  else if ((turnCount >= 44) && (turnCount < 48)) { 
    grid[3][1].turnOver();
    grid[3][2].turnStart();
  } 
  else if ((turnCount == 48)) { 
    grid[3][2].turnOver();
  } 
  else if ((turnCount >= 48) && (turnCount < 52)) { 
    grid[3][2].turnOver();
    grid[4][0].turnStart();
  } 
  else if ((turnCount >= 52) && (turnCount < 56)) { 
    grid[4][0].turnOver();
    grid[4][1].turnStart();
  } 
  else if ((turnCount >= 56) && (turnCount < 60)) { 
    grid[4][1].turnOver();
    grid[4][2].turnStart();
  } 
  else if ((turnCount == 60)) { 
    grid[4][2].turnOver();
  } 
  else if ((turnCount >= 60) && (turnCount < 64)) { 
    grid[4][2].turnOver();
    grid[5][0].turnStart();
  } 
  else if ((turnCount >= 64) && (turnCount < 68)) { 
    grid[5][0].turnOver();
    grid[5][1].turnStart();
  } 
  else if ((turnCount >= 68) && (turnCount < 72)) { 
    grid[5][1].turnOver();
    grid[5][2].turnStart();
  } 
  else if (turnCount >= 72) { 
    grid[5][2].turnOver();
    instructions = "SELECT # OF PLAYERS AND PRESS START";
  }
}

class Turns {
  float x, y; 
  color fill;

  Turns(float tempX, float tempY, color fill1) {
    x = tempX;
    y = tempY;
    fill = fill1;
    num=1;
  }


  void display() {
    fill(fill);
    rect(40+x, 120+y, 50, 50);
  }

  void titles() {  
    textFont(createFont("Georgia", 14));
    fill(255);
    text("TURN", 65+x, 145+y);
  }

  void turnStart() {
      fill=#426A2C;
  }
  void turnOver() {
      fill=#CE1515;
  }
  void turnRestart() {
      fill=0;
  }

}

class Rounds {
  float x;
  color fill;

  Rounds(float posX, color fill1) {
    x = posX;
    fill = fill1;
  }

  void display() {
    fill(fill);
    rect(x, 75, 50, 30);
  }

  // round color changes
  void roundStart() {
    fill=#426A2C;
  }

  void roundOver() {
    fill=#CE1515;
  }

  void restart() {
    fill=0;
  }

  void flash() {
  if (flashColor >= 255) {
    flashColor=0;  
  } else {
    flashColor+=10;
  }

  int c = int(flashColor);
  fill = (c);
  }

}




