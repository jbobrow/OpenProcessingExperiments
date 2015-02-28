
// object and global variable declarations
int treeApplesNo = 15;
int applesNo = 50;
float[] treeApplesX = new float[treeApplesNo];
float[]treeApplesY = new float[treeApplesNo];
Man man = new Man();
Apple[] apples = new Apple[applesNo];
int applesGot = 0;
int applesDone = 0;
boolean menudone = false;
boolean gamedone = false;
float rotap = random(1, 49);
int rottenApple = int(rotap);
float goldap = random(1, 49);
int goldenApple = int (goldap);

void setup() {
  // this sets up the size of the window
  size(900, 600);
  //this sets up the font to be used within the game
  PFont font;
  font = loadFont("Rockwell-Bold-48.vlw");
  textFont(font, 40);
  setTreeApples();
  //this fills the apples[] array with 50 instances of class Apple
  for (int i = 0; i <50;i++) {
    apples[i] = new Apple(400);
  }
}

void draw() {
  basicSetup();
  //this displays start screen if not already done
  if (menudone == false) {
    menuSetup();
  }
  //if start screen has been passed, this carries out the rest of the game
  else {
    //this sets the rotten and golden apples
    apples[rottenApple].rotten = true;
    apples[goldenApple].golden = true;
    //if the rotten apple is not caught, this runs the main game
    if (apples[rottenApple].appleCaught == false) {
      man.display();
      //this loop runs through once for each falling apple
      for (int i = 0; i<50;i++) {
        apples[i].speedUpdate();
        apples[i].check();
        apples[i].display();
        apples[i].drop();
      }
    }
    resetCalcApples();
    messageSelection();
    // if the user catches the rotten apple, the following is run
    if (apples[rottenApple].appleCaught == true) {
      //this sets the colour of exit button to red
      fill(200, 1, 1);
      stroke(0);
      strokeWeight(2);
      //this draws the exit button
      rect((width/2)-150, (height/2)-50, 300, 100);
      fill(0);
      text("EXIT", (width/2)-50, (height/2)+10);
      //this prints the 'exit message'
      text("You caught the rotten apple! Game Over!", 70, 200);
      //the following provides a 'mouseover' effect for the button
      if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
        if (mouseY >=((height/2)-50) && mouseY <=((height/2)+50)) {
          stroke(255);
          strokeWeight(6);
          fill(200, 1, 1);
          rect((width/2)-150, (height/2)-50, 300, 100);
          fill(255);
          text("EXIT", (width/2)-50, (height/2)+10);
        }
      }
    }
  }
}


//this sets a random pattern for the apples on the tree
//to be displayed in
void setTreeApples() {
  for (int i = 0; i < 15; i++) {
    treeApplesX[i] = random(width/6, width/1.2);
    treeApplesY[i] = random(120);
  }
}

//this displays the apples on the tree
void drawTreeApples() {
  for (int i = 0; i < 15; i++) {
    ellipse(treeApplesX[i], treeApplesY[i], 25, 25);
  }
}

//this prints the current score for the player
void printScore() {
  if (gamedone == false) {
    fill(0);
    text("Score = " + applesGot + "/500", 10, 580);
  }
}

//this selects a message to give to the player depending on their
//final score
void messageSelection() {
  if (applesDone >49) {
    fill(0);
    text("Your final score was: " + applesGot + "/500", 180, 300);
    gamedone = true;
    if (applesGot < 50) {
      text("That's pretty rubbish! Get better!", random(118, 122), random(348, 352));
    }
    if (applesGot >= 50 && applesGot < 300) {
      text("That's a fairly good score, well done.", random(108, 112), random(348, 352));
    }
    if (applesGot >=300) {
      fill(random(256), random(256), random(256));
      text("Excellent score! You are now a legend!", random(108, 112), random(348, 352));
    }
  }
}


//this sets the number of apples that have been 'done' to 0 and
//then recalculates the cuurent number of apples that have
//been 'done'
void resetCalcApples() {
  applesDone = 0;
  for (int i = 0; i<50;i++) {
    applesDone = applesDone + apples[i].appleValue;
  }
}

//this stipulates what happens when  the 'START' and
//'EXIT' buttons are pressed
void mouseClicked() {
  if (menudone == false) {
    if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
      if (mouseY >=((height/2)-50) && mouseY <=((height/2)+50)) {
        menudone = true;
      }
    }
  }
  if (gamedone == true && apples[rottenApple].appleCaught == true) {
    if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
      if (mouseY >=((height/2)-50) && mouseY <=((height/2)+50)) {
        exit();
      }
    }
  }
}


//this displays the start screen before the game commences
void menuSetup() {
  fill(200, 1, 1);
  stroke(0);
  strokeWeight(2);
  rect((width/2)-150, (height/2)-50, 300, 100);
  fill(0);
  text("START", (width/2)-70, (height/2)+10);
  if (mouseX >=((width/2)-150) && mouseX <=((width/2)+150)) {
    if (mouseY >=((height/2)-50) && mouseY <=((height/2)+50)) {
      stroke(255);
      strokeWeight(6);
      fill(200, 1, 1);
      rect((width/2)-150, (height/2)-50, 300, 100);
      fill(255);
      text("START", (width/2)-70, (height/2)+10);
    }
  }
}


//this sets out the background for the game, i.e. the sky, tree,
//grass, e.t.c.
void basicSetup() {
  background(3, 182, 250);
  noStroke();
  fill(4, 198, 2);
  rect(0, 500, width, 100);
  printScore();
  fill(108, 33, 8);
  rect(350, 0, 200, 540); 
  fill(9, 77, 17);
  ellipseMode(CENTER);
  ellipse(width/2, 50, 300, 300);
  ellipse(width/3, 20, 300, 300);
  ellipse(width/1.5, 20, 300, 300);
  ellipse(width/6, 10, 300, 300);
  ellipse(width/1.2, 10, 300, 300);
  fill(211, 0, 14);
  drawTreeApples();
}



//this is the class which concerns the figure that catches
//the apples
class Man {
  int basketEdge = 400;

  Man() {
  }

  //this displays the man in the position the player's mouse
  //is pointing to
  void display() { 
    strokeWeight(10);
    stroke(255); 
    line(mouseX, 460, mouseX, 550);
    line(mouseX, 550, mouseX-20, 600);
    line(mouseX, 550, mouseX+20, 600);
    line(mouseX, 500, mouseX-20, 430);
    line(mouseX, 500, mouseX+20, 430);
    strokeWeight(1);
    stroke(0);
    fill(255);
    ellipse(mouseX, 460, 40, 40);
    strokeWeight(10);
    stroke(185, 162, 96);
    fill(185, 162, 96);
    quad(mouseX-20, 421, mouseX+20, 421, mouseX+40, basketEdge, mouseX-40, basketEdge);
  }
}



//this class relates to the apples that fall and are to be 
//caught by the player
class Apple {
  float appleX;
  float appleY;
  float speed;
  float d;
  float edge;
  boolean appleCaught;
  int appleValue;
  boolean rotten;
  boolean golden;

  Apple(int t) {
    //this randomly sets the x-position of the apple
    appleX = random(width/6, width/1.2);
    //this randomly sets the y-position of the apple, i.e.
    //it randomly chooses 'when' the apples will fall
    appleY = random(-10000);
    //this sets the default speed of the falling apple
    speed = 4;
    //this sets the diameter of the apple
    d = 40;
    //this sets the edge which will need to be touched for the
    //apple to be caught
    edge = t;
    //this sets the apple's 'value' to 0
    appleValue = 0;
    //this presets the apple to be neither rotten nor golden
    rotten = false;
    golden = false;
  }


  //this displays the apple
  void display() {
    //if the apple has not been caught, make it red
    if (appleCaught == false) {
      if (rotten == false) {
        fill(191, 10, 16);
      }
      //if the apple is rotten make it brown
      if (rotten==true) {
        fill(116, 50, 8);
      }
      //if the apple is golden, make it flash rainbow colours
      if (golden == true) {
        fill(random(256), random(256), random(256));
      }
      noStroke();
      //this draws the apple in its current position
      ellipse(appleX, appleY, d, d);
    }
  }

  //this drops the apple
  void drop() {
    //this increments the apples position by its 'speed'
    appleY += speed;
  }

  //this changes the speed depending on user input
  void speedUpdate() {
    //if the user presses Z key, then increse speed
    if (keyPressed && (key == 'z'))  
      //this makes sure the speed can be no faster than 10
      if (speed<10) {
        speed++;
      }
    //if the user presses X key, decrease speed
    if (keyPressed && (key == 'x'))  
      //this makes sure that the apple cannot go backwards
      if (speed >1) {
        speed--;
      }
  }


  //this checks the current status of the apple
  void check() {
    //this checks if the apple has been caught in the basket
    if ((appleY)+d/2 >400 && (appleY)+d/2 < 430) {
      if (appleX < mouseX+40 && appleX > mouseX-40) {
        appleCaught = true;
        //this sets the score given for each caught apple,
        //depending on whether it is golden or not
        if (golden == false) {
          applesGot ++;
        }
        if (golden == true) {
          applesGot +=5;
        }
        //this sets the apple's value to 1 when it is caught
        appleValue = 1;
        //if the caught apple is rotten, then the game is finished
        if (rotten == true) {
          gamedone = true;
        }
      }
    }
    //this sets the apple value to 1 if it falls off the screen
    if (appleY > 600) {
      appleValue = 1;
    }
  }
}


