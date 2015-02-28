
/*
 
 **************************************************************
 * How to Play                                                *
 * J. Matthew Griffis                                         *
 * November 18, 2012                                          *
 *                                                            *
 * I made a game.                                             *
 *                                                            *
 * I made it for my MFA studies in Design and Technology      *
 * at Parsons the New School for Design.                      *
 * Specifically I made some of it for my CCLab class.         *
 * Then I made more of it for Major Studio 1.                 *
 * But mostly I made it to compel and confound.               *
 *                                                            *
 * Can you reach the credits screen?                          *
 *                                                            *
 * Acknowledgments: Ramiro Corbetta, Franscisco Zamorano,     *
 * Mauricio Sanchez, Jennifer Presto, OpenProcessing.org      *
 * and others I'm likely forgetting. Thanks, all.             *
 **************************************************************
 
 // I totally jacked this sweet formatting style above from
 // Jennifer Presto.
 
 */


// Please note: protagonist notKirby is also known as "Ball" throughout. Live free of perplexity!

// Control which play style applies. Set to zero for the initial instruction set. This needs to be
// initialized outside the setup function to enable restarting the game with a new mode:
int gameMode = 0;

// Control the display of messages and how they affect game play. Set to zero to enable action:
int msg;

int currentLevel; // Control the current level (game screen).

PFont font;
PFont game;
PImage light;
boolean bounced; // Detect whether player has achieved the winning condition.
boolean direction; // Control which direction notKirby faces.
float resizer = 0.25; // Use to scale notKirby's size as needed.
boolean next; // Control transition between messages and game play.
int fontsize = 24;
color textBackground = #9FA1FA; // Background color of text boxes.
color textColor = 0;
boolean promptJump; // Prompt jumping at one point.
boolean noAdvance; // Prevent moving through messages at one point.
int jumpCounter; // Tally jumps at one point.
boolean pressedV; // Check if V has been pressed.
boolean pressedVlevel; // Check if this is the level to press V.
float msgXpos; // Use this to position a specific message.
int moveMsg = 2; // Use this to move the message.
float msgYpos; // Use this to posiition a specific message.
notKirby notKirby; // Declare an instance of the protagonist object ("notKirby").
Level [] myLevels; // Declare an array of "Level" objects (themselves ArrayLists, ala "Inception.")
boolean[] levelNew;
boolean platRockd; // Use to control changing the condition of platforms.
color platFlipped = color(0, 255, 0); // Platform changes to this color when it's been rocketed.
boolean displayWASD;
boolean noGoBack; // Use to stay on one screen.
boolean stopMotion; // Use this to stop ALL notKirby motion.
boolean finalBattle; // Use this to detect the...FINAL BATTLE.
float bossXpos, bossYpos; // Position the boss.
int bossLife, notKirbyLife;
boolean ctrlDmg; // Use to control damage.
int lastGameMode = 0; // Use to reset the game once it's won.

// __________________________________________________________________________________________________

void setup() {
  size(800, 600);

  /*
  Here's a little trick to restart the game completely using a variable outside setup.
   When you win the game, it sets lastGameMode to three and loads setup, but that wouldn't reset to the
   title screen. Resetting to the title screen wouldn't load setup and reset all the variables. So
   we check if lastGameMode is equal to the winning number and if so RESET it and set the gameMode to
   zero, all within setup. That way loading setup from the winning screen does launch the title screen.
   */
  if (lastGameMode == 3) {
    gameMode = 0;
    lastGameMode = 0;
  }

  // It's necessary to initialize the following variables within setup so that when we switch game
  // modes and reload setup, everything reverts properly:
  currentLevel = 0;
  msg = 0;
  bounced = true;
  direction = true;
  next = true;
  promptJump = false;
  noAdvance = false;
  jumpCounter = 0;
  pressedV = false;
  pressedVlevel = false;
  platRockd = false;
  displayWASD = false;
  noGoBack = false;
  stopMotion = false;
  finalBattle = false;
  bossLife = 3;
  notKirbyLife = 3;
  ctrlDmg = false;

  msgXpos = width/2;
  msgYpos = height/2;
  bossXpos = width/2;
  bossYpos = height/2;

  smooth();

  font = loadFont("font.vlw"); // Used CreatFont tool to make this one.
  game = createFont("FREEDOM.ttf", 48); // Can't figure out how to import a new font so I used this.
  // Thanks to HXDes for the font! (http://www.fontspace.com/hxdes/freedom)

  light = loadImage("light-bulb.jpg"); // Free stock image FOR THE WIN. (http://www.public-domain-image.
  //com/public-domain-images-pictures-free-stock-photos/objects-public-domain-images-pictures/electronics
  //-devices-public-domain-images-pictures/electric-lights-pictures/light-bulb.jpg)

  myLevels = new Level[18]; // Initialize the number of levels in the brackets.
  // We initialize each element in the array, labeling each with the level number it represents and
  // making it a level object. See the Level tab regarding the constructor:
  myLevels[0] = new Level(0); 
  myLevels[1] = new Level(1);
  myLevels[2] = new Level(2);
  myLevels[3] = new Level(3);
  myLevels[4] = new Level(4);
  myLevels[5] = new Level(5);
  myLevels[6] = new Level(6);
  myLevels[7] = new Level(7);
  myLevels[8] = new Level(8);
  myLevels[9] = new Level(9);
  myLevels[10] = new Level(10);
  myLevels[11] = new Level(11);
  myLevels[12] = new Level(12);
  myLevels[13] = new Level(13);
  myLevels[14] = new Level(14);
  myLevels[15] = new Level(15);
  myLevels[16] = new Level(16);
  myLevels[17] = new Level(17);

  levelNew = new boolean[18]; // Use booleans to test if we are visiting a room for the first time:
  levelNew[0] = false;
  levelNew[1] = false;
  levelNew[2] = false;
  levelNew[3] = false;
  levelNew[4] = false;
  levelNew[5] = false;
  levelNew[6] = false;
  levelNew[7] = false;
  levelNew[8] = false;
  levelNew[9] = false;
  levelNew[10] = false;
  levelNew[11] = false;
  levelNew[12] = false;
  levelNew[13] = false;
  levelNew[14] = false;
  levelNew[15] = false;
  levelNew[16] = false;
  levelNew[17] = false;

  // Use a for loop to iterate through each level in the array:
  for (int i = 0; i < myLevels.length; i++) {
    myLevels[i].prep(); // Prepare every level to be drawn. We won't draw them all at once.
    // Set the value of platCount for each level equal to the number of platforms in the level:
    myLevels[i].platCount = myLevels[i].myPlats.size();
    // Create a boolean for each platform in the current level:
    myLevels[i].platColor = new boolean[myLevels[i].myPlats.size()];
    for (int j = 0; j < myLevels[i].myPlats.size(); j++) {
      myLevels[i].platColor[j] = false;
    }
  }
  // Make instance of notKirby object using parameters entered via constructor (see notKirby tab):
  notKirby = new notKirby(50, 600 - ((175 * resizer) / 2), 175, 200, color(#FF08F3));
  notKirby.prep(); // Load notKirby's components.
}

// __________________________________________________________________________________________________

void draw() {
  background(150);

  /*
   // Debug.
   for (int i = 0; i < levelNew.length; i++) {
   println(levelNew[currentLevel]);
   }
   */

  //println(lastGameMode); // Debug.

  // Here's a title screen:
  if (gameMode == 0) {
    background(0);
    fill(255);
    textAlign(CENTER);
    textFont(game);
    text("How to Play", width/2, height/2 - ((height/2) / 5));
    textFont(game, 24);
    text("a game by J. Matthew Griffis", width/2, height/2 + ((height/2) / 5));
    textFont(game, 16);
    text("    John Matthew Griffis", width/2, height);
    textFont(font, 16);
    text("(c) 2012", width/2-125, height);
    textAlign(LEFT);
    image(light, width/2 - (256/2), 0, 256, 192); // Light bulb.
    stroke(255);
    strokeWeight(2);
    line(width/2+10, 75, width/2+275, 75); // Horizontal pull for the light.
    textFont(game, 36);
    text("J", width/2+265, 80); // Ceiling hook. This is what's known as a "hack."
    line(width/2+275, 75, width/2+275, height/2+140); // Vertical pull for the light.
    fill(255, 0, 0);
    noStroke();
    rect(width/2+270, height/2+140, 10, 50); // Pull handle for the light.
    stroke(255); // Reset stroke.
    fill(255); // Reset fill.
  }

  // And here's an end credits screen:
  if (gameMode == 3) {
    lastGameMode = gameMode;
    background(0);
    fill(255);
    textAlign(CENTER);
    textFont(game);
    text("You won the game!", width/2, height/2 - ((height/2) / 3.75));
    textFont(game, 36);
    text("Niiiiiice.", width/2, height/2 - ((height/2) / 7));
    textFont(game, 24);
    text("This is the legendary 'credits page.' My name's Matt.\nI make games, including this one. " +
      "I also hang out\nwith cool people at Parsons the New School for\nDesign. Some of them helped me " +
      "with this game.\nI thanked them in the code commentary. Check it.", width/2, height/2);
    textFont(game, 16);
    textAlign(LEFT);
    text("Hmm, not much of a credits page. Your eyes tell me you\nhunger. You hunger...for a reward. Yo," +
      " don't even worry about it.\nDrop an email to                          with the subject\nline "+
      "                           and I'll hook you up.", width/2-385, height-(height/4.5));
    textFont(font, 16);
    text("grifj153(at)newschool.edu", width/2-210, height-(height/6.5));
    text("'nothing like kirby' (no quotes)", width/2-340, height-(height/8.5));

    textAlign(LEFT);
    image(light, width/2 - (256/2), 0, 256, 192); // Light bulb.
    stroke(255);
    strokeWeight(2);
    line(width/2+10, 75, width/2+275, 75); // Horizontal pull for the light.
    textFont(game, 36);
    text("J", width/2+265, 80); // Ceiling hook. This is what's known as a "hack."
    line(width/2+275, 75, width/2+275, height/2+140); // Vertical pull for the light.
    fill(255, 0, 0);
    noStroke();
    rect(width/2+270, height/2+140, 10, 50); // Pull handle for the light.
    stroke(255); // Reset stroke.
    fill(255); // Reset fill.

    // Collision detection. We check to see if notKirby collides with the pull handle:
    if (((notKirby.xPos+(notKirby.wide/2)) >= width/2+270 && (notKirby.xPos-(notKirby.wide/2)) <= 
      width/2+280) && (notKirby.yPos+(notKirby.tall/2)) >= height/2+140 && 
      (notKirby.yPos-(notKirby.tall/2)) <= height/2+190) {

      // If so, we restart the game:
      delay(1000);
      setup();
    }

    // I mention these here to make sure notKirby gets drawn on the end screen; otherwise he wouldn't:
    notKirby.updateBall();
    notKirby.display();
  }

  if (gameMode >= 1 && gameMode < 3) {

    // Here's where things get awesome. We draw only the level in the array whose element label
    // matches the value of the variable indicating the current level. If the current level is
    // set at 2, we don't draw level 1 or level 3. Look, Ma, no for loop!
    myLevels[currentLevel].display();

    if (gameMode == 1) {

      if (currentLevel == 11) {
        if (bounced == true) { // Did the player win?
          fill(255);
          textFont(font, fontsize*0.5);
          text("Winner! You jumped this.", 115, 70); // Display winning text.
        }
        else if (bounced != true) { // The player hasn't won yet?
          fill(255);
          textFont(font, fontsize*0.5);
          text("Can't jump this.", 135, 70); // Display other text.
        }
      }



      if (currentLevel < (myLevels.length - 1)) { // If the next level exists...
        if (bounced == true) { // If we are not on the 'winning' level, needing to win...
          stroke(255);
          strokeWeight(2);
          // With these three lines we draw an arrow pointing to the next screen:
          line((width - 50), (height - 25), (width - 25), (height - 25));
          line((width - 25), (height - 25), (width - 35), (height - 35));
          line((width - 25), (height - 25), (width - 35), (height - 15));

          // Here we transition between levels. If notKirby crosses the right edge of the screen...
          if (notKirby.xPos > width-(notKirby.wide / 2)) {

            // We reset various screen-specific variables:
            if (promptJump == true) {
              promptJump = false;
            }
            if (noAdvance == true) {
              noAdvance = false;
            }
            if (pressedVlevel == true) {
              pressedVlevel = false;
            }
            if (jumpCounter > 0) {
              jumpCounter = 0;
            }

            // ...switch to the next level...
            currentLevel++;
            // ...and move notKirby to the other side of the screen so it looks like he really moved
            // between screens.
            notKirby.xPos = (notKirby.wide / 2);

            // If we haven't visited this level before...
            if (levelNew[currentLevel] == false) {
              // ...prepare for new messages.
              next = true;
              msg = 1;
            }
            else {
              msg = 0;
            }
          }
        }
      }

      if (currentLevel > 0) { // If the previous level exists...
        if (noGoBack == false) { // and if going back is allowed...
          if (bounced == true) { // If we are not on the 'winning' level, needing to win...
            stroke(255);
            strokeWeight(2);
            // With these three lines we draw an arrow pointing to the next screen:
            line(50, (height - 25), 25, (height - 25));
            line(25, (height - 25), 35, (height - 35));
            line(25, (height - 25), 35, (height - 15));

            // Do the above going the other way. If notKirby crosses the left edge of the screen...
            if (notKirby.xPos < (notKirby.wide / 2)) {

              // We reset various screen-specific variables:
              if (promptJump == true) {
                promptJump = false;
              }
              if (noAdvance == true) {
                noAdvance = false;
              }
              if (pressedVlevel == true) {
                pressedVlevel = false;
              }
              if (jumpCounter > 0) {
                jumpCounter = 0;
              }

              // ...switch to the previous level...
              currentLevel--;
              // ...and move notKirby to the other side of the screen so it looks like he really
              // moved between screens.
              notKirby.xPos = width - (notKirby.wide / 2);

              // If we skipped reading through the messages...
              if (levelNew[currentLevel] == true) {
                msg = 0;
              }
              else {
                // ...load them again:
                next = true;
                msg = 1;
                noAdvance = false;
              }
            }
          }
        }
      }

      // Here is some conditional stuff just for the last level:
      if (currentLevel == 17) {
        // If we've moved past the last message and should display "WASD," do so:
        if (displayWASD == true) { 
          textFont(font, fontsize);
          fill(255);
          textAlign(CENTER);
          text("W", width/2, fontsize);
          text("A", fontsize/2, height/2);
          text("S", width/2, height-5);
          text("D", width-fontsize/2, height/2);
          textAlign(LEFT);
          // If the player hits any of the cued keys on this screen...
          if (keyPressed && (key=='w' || key=='W' || key=='a' || key=='A' || key=='s' || key=='S' 
            || key=='d' || key=='D')) {
            // ...prevent return to a previous screen:
            noGoBack = true;
          }
        }
      }
    }

    if (gameMode == 2) {
      if (currentLevel > 0) { // If the previous level exists...
        stroke(255);
        strokeWeight(2);
        // With these three lines we draw an arrow pointing to the next screen:
        line(50, (height - 25), 25, (height - 25));
        line(25, (height - 25), 35, (height - 35));
        line(25, (height - 25), 35, (height - 15));

        // Do the above going the other way. If notKirby crosses the left edge of the screen...
        if (notKirby.xPos < (notKirby.wide / 2)) { 
          // ...switch to the previous level...
          currentLevel--; 
          // ...and move notKirby to the other side of the screen so it looks like he really
          // moved between screens:
          notKirby.xPos = width - (notKirby.wide / 2);
        }
      }
      if (currentLevel < (myLevels.length - 1)) { // If the next level exists...
        if (myLevels[currentLevel].platCount == 0) { // If all platforms have been rocketed...
          stroke(255);
          strokeWeight(2);
          // With these three lines we draw an arrow pointing to the next screen:
          line((width - 50), (height - 25), (width - 25), (height - 25));
          line((width - 25), (height - 25), (width - 35), (height - 35));
          line((width - 25), (height - 25), (width - 35), (height - 15));

          // Here we will transition between levels. If notKirby crosses the right edge of the
          // screen...
          if (notKirby.xPos > width-(notKirby.wide / 2)) { 
            // ...switch to the next level...
            currentLevel++;
            // ...and move notKirby to the other side of the screen so it looks like he really
            // moved between screens:
            notKirby.xPos = (notKirby.wide / 2);

            // If this is the last level in mode 2 we need to display a message:
            if (currentLevel == 17 && levelNew[currentLevel] == false) {
              msg = 1;
            }
          }
        }
      }
    }

    // Call the updateBall function from the notKirby tab. We list this one first so notKirby
    // will be displayed afterward (and thus appear in front of objects where applicable versus
    // behind them):
    notKirby.updateBall(); 
    notKirby.display(); // Draw notKirby! (by calling the function from the tab)

    if (platRockd == true) { // If notKirby rocketed a platform...
      if (myLevels[currentLevel].platCount > 0) { // check if the counter is greater than zero.
        myLevels[currentLevel].platCount--; // If so, subtract one.
        platRockd = false; // Then turn off the boolean so we don't subtract more than one at a time.
      }
    }

    // Debug:
    /*for (int i = 0; i < myLevels.length; i++) {
     for (int j = 0; j < myLevels[i].myPlats.size(); j++) {
     println("0 = "+ myLevels[currentLevel].platColor[0] + " 1 = " + 
     myLevels[currentLevel].platColor[1] + " 2 = " + myLevels[currentLevel].platColor[2]);
     }
     }*/

    // A debugging problem arises. An onscreen message prevents the arrow keys from enabling movement,
    // but what if movement is already enabled via the previous screen and the player keeps holding
    // the key down? We address that here:
    if (msg >= 1) { // If there's a message on screen...
      if (notKirby.R == true) { // and rightward movement is enabled...
        notKirby.R = false; // ...disable it.
      }
      if (notKirby.L == true) { // Just so, if leftward movement is enabled...
        notKirby.L = false; // ...disable it.
        // (This is necessary for debugging; otherwise the player could move right through screens
        // without going through the text boxes as long as he never stopped holding a directional key.)
      }
    }

    // Start of instructions__________________________________________________________________________// 

    if (gameMode == 1) {

      // Let's display some instructions. We'll draw text at different points on screen and colored
      // backgrounds behind the text, and instruct the player to press ENTER to progress through the
      // messages.

      textFont(font, fontsize);

      if (currentLevel == 0) { // First level.
        rectMode(CORNER);
        // If there's no message but this is the first time on this level and it's the original game
        // mode...
        if (msg == 0 && levelNew[currentLevel] == false) {
          // ...display the first message:
          msg = 1;
        }
        if (msg == 1) {
          noStroke(); 
          fill(textBackground); 
          rect(width/2-100, height/2-fontsize*5, 190, 75);
          fill(textColor); 
          text("Ah, there you are.", width/2-100, height/2-fontsize*4);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2-100, height/2-fontsize*2);
        }
        else if (msg == 2) {
          noStroke(); 
          fill(textBackground); 
          rect(width/4-100, height/2+fontsize*2, 180, 100);
          fill(textColor); 
          textFont(font, fontsize/1.25); 
          text("Oh, good. You know\nhow to follow orders.", width/4-100, height/2+fontsize*3);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/4-100, height/2+fontsize*6);
        }
        else if (msg == 3) {
          noStroke(); 
          fill(textBackground); 
          rect(width/1.25-115, height-(height/5)-fontsize*2, 205, 100);
          textFont(font, fontsize*2); 
          fill(textColor); 
          text("I like that.", width/1.25-115, height-(height/5));
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/1.25-115, height-(height/5)+fontsize*2);
        }
        else if (msg == 4) {
          noStroke(); 
          fill(textBackground); 
          rect(85, height-100, 155, 50+fontsize);
          textFont(font, fontsize*1.25); 
          fill(textColor); 
          text("Let's begin.", 85, height-100+fontsize);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", 85, height-100+fontsize*3);
        }
        // In this case we are not moving between screens by controlling notKirby so we handle the
        // transition here:
        else if (msg == 5) { 
          // We have now read the messages here so we set the variable to true so the messages don't
          // repeat if we return to this screen:
          levelNew[currentLevel] = true;
          currentLevel++;
          if (levelNew[currentLevel] == false) {
            msg = 1;
          }
          else {
            msg = 0;
          }
        }
      }

      if (currentLevel == 1) { // Second level.
        if (msg == 1) {
          pushMatrix();
          translate(-(215/2), 0);
          noStroke(); 
          fill(textBackground); 
          rect(width/2, height/7-fontsize, 215, 50+fontsize*1.5);
          textFont(font, fontsize*1.25); 
          fill(textColor); 
          text("This is a 'game.'", width/2, height/7);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/7+fontsize*2);
          popMatrix();
        }
        else if (msg == 2) {
          pushMatrix();
          translate(-130, 0);
          noStroke(); 
          fill(textBackground); 
          rect(width/2, height/3-fontsize, 260, fontsize*5-10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("The purpose of a 'game'\nis to have 'fun.'", width/2, height/3);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/3+fontsize*3);
          popMatrix();
        }
        else if (msg == 3) {
          pushMatrix();
          translate(-130, 0);
          noStroke(); 
          fill(textBackground); 
          rect(width/2, height/2, 260, fontsize*4+10);
          textFont(font, fontsize*0.75); 
          fill(textColor); 
          text("'Fun' is what you have\nwhen you're being 'useless.'", width/2, height/2+fontsize);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*4);
          popMatrix();
        }
        else if (msg == 4) {
          pushMatrix();
          translate(-(315/2), 0);
          noStroke(); 
          fill(textBackground); 
          rect(width/2, height-fontsize*7, 315, fontsize*6+10);
          textFont(font, fontsize*2); 
          fill(textColor); 
          text("Who's ready\nfor some fun!?", width/2, height-fontsize*5);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height-fontsize);
          popMatrix();
        }
        else if (msg == 5) {
          // We have now read the messages here so we set the variable to true so the messages don't
          // repeat if we return to this screen:
          levelNew[currentLevel] = true; 
          currentLevel++;
          if (levelNew[currentLevel] == false) {
            msg = 1;
          }
          else {
            msg = 0;
          }
        }
      }

      if (currentLevel == 2) {
        if (msg == 1) {
          pushMatrix(); 
          translate(-390, 50);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 225, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("This is your 'avatar.'", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          strokeWeight(10);
          stroke(0);
          line(width/2+40, height/2+fontsize*4, width/2+40, height/2+fontsize*7);
          line(width/2+30, height/2+fontsize*6.5, width/2+40, height/2+fontsize*7);
          line(width/2+50, height/2+fontsize*6.5, width/2+40, height/2+fontsize*7);
          noStroke();
          popMatrix();
        }
        if (msg == 2) {
          pushMatrix(); 
          translate(-350, 100);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 300, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("You are not the same as it.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix(); 
          translate(-310, 150);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 225, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("But it does represent\nyou in the game.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 4) {
          pushMatrix(); 
          translate(-270, 200);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 225, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("With a 90% increase\nin adorableness.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 5) {
          levelNew[currentLevel] = true;
          currentLevel++;
          if (levelNew[currentLevel] == false) {
            msg = 1;
          }
          else {
            msg = 0;
          }
        }
      }
      if (currentLevel == 3) {
        if (msg == 1) {
          pushMatrix(); 
          translate(200, -250);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 180, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("This world is flat.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          // draw arrow
          popMatrix();
        }
        if (msg == 2) {
          pushMatrix(); 
          translate(-390, -250);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 230, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Not like your outdated\ngeographic theories.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix(); 
          translate(200, 225);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 180, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("But vertically flat.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 4) {
          levelNew[currentLevel] = true;
          currentLevel++;
          if (levelNew[currentLevel] == false) {
            msg = 1;
          }
          else {
            msg = 0;
          }
        }
      }
      if (currentLevel == 4) {
        if (msg == 1) {
          pushMatrix(); 
          translate(230, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 130, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("There is left.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 2) {
          pushMatrix(); 
          translate(-370, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 200, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("And there is right.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix(); 
          translate(-(130/2), 210);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 130, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("There is up.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 4) {
          pushMatrix(); 
          translate(-100, -240);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 200, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("And there is down.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 5) {
          pushMatrix();
          translate(0, 0);
          rotate(25);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 175, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Two dimensions.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 6) {
          pushMatrix();
          rotate(-25);
          translate(0, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 185, fontsize*5+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("There is no depth\n\nin this game.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*4);
          popMatrix();
        }
        if (msg == 7) {
          levelNew[currentLevel] = true;
          currentLevel++;
          if (levelNew[currentLevel] == false) {
            msg = 1;
          }
          else {
            msg = 0;
          }
        }
      }
      if (currentLevel == 5) {
        if (msg == 1) {
          msgXpos += moveMsg;
          if (msgXpos >= (width-300) || msgXpos <= 0) {
            moveMsg *= -1;
          }
          pushMatrix(); 
          translate(0, 0);
          noStroke();
          fill(textBackground); 
          rect(msgXpos, height/2-fontsize, 300, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("You can move your avatar\nif you know the secret.", msgXpos, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", msgXpos, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 2) {
          pushMatrix(); 
          translate(0, 0);
          scale(0.5);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 200, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Here is the secret.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix(); 
          translate(0, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 230, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Find the key with\na right-pointing arrow.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 4) {
          pushMatrix(); 
          translate(-200, 100);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 185, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("I call it the\n'right arrow key.'", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 5) {
          pushMatrix(); 
          translate(100, 230);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 230, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Press it to move right.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 6) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 6) {
        if (msg == 1) {
          pushMatrix(); 
          translate(-390, -260);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 185, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("There is a 'left-\narrow key,' too.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 2) {
          pushMatrix(); 
          translate(130, 230);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 250, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Maybe you knew this?", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix(); 
          translate(-(235/2), 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 235, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("I'll bet you can guess\nwhat that does.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 4) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 7) {
        if (msg == 1) {
          msgYpos += moveMsg;
          if ((msgYpos-fontsize) >= (height-(fontsize*4+10)) || (msgYpos-fontsize) <= 0) {
            moveMsg *= -1;
          }
          pushMatrix(); 
          translate(-120, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, msgYpos-fontsize, 240, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("The 'up-' and 'down-\narrow keys,' however", width/2, msgYpos);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, msgYpos+fontsize*3);
          popMatrix();
        }
        if (msg == 2) {
          pushMatrix(); 
          translate(0, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 300, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("do not do what you expect.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix();
          scale(2.5);
          translate(-300, -150);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 115, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Ha ha.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 4) {
          pushMatrix(); 
          translate(-300, 200);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 145, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("You still need\nthe secret.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 5) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 8) {
        if (msg == 1) {
          pushMatrix();
          scale(0.5);
          translate(0, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 200, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Here is the secret.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 2) {
          pushMatrix(); 
          translate(0, 200);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 205, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Press the 'SPACE\nBAR' to 'jump.'", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix(); 
          translate(200, -150);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 180, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("I hope you know\nwhat that is.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 4) {
          pushMatrix(); 
          translate(-390, -75);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 315, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("('SPACE BAR' and 'jumping,'\nI mean.)", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 5) {
          pushMatrix(); 
          translate(-300, 175);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 115, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Try it now.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press SPACE]", width/2, height/2+fontsize*2);
          promptJump = true; // Enable jumping.
          noAdvance = true;
          popMatrix();
          if (jumpCounter >= 3) {
            msg++;
          }
        }
        if (msg == 6) {
          noAdvance = false;
          pushMatrix(); 
          translate(0, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 305, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Ha ha! Look at your avatar's\nlittle arm flip up and down!", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 7) {
          jumpCounter = 0;
          pushMatrix(); 
          translate(-390, 235 );
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 115, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("SO CUTE.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 8) {
          promptJump = false;
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 9) {
        if (msg == 1) {
          pressedVlevel = true;
          pushMatrix();
          translate(-600, -300);
          scale(2);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 185, fontsize*2+15);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Whatever you do,\ndon't press 'v'!", width/2, height/2);
          noAdvance = true;
          popMatrix();
        }
        if (msg == 2) {
          noAdvance = false;
          pressedVlevel = false;
          pushMatrix(); 
          translate(-(185/2), 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 185, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Just kidding.\nJust testing you.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix(); 
          translate(-(115/2), 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 115, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("You failed.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 4) {
          pushMatrix(); 
          translate(-60, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 120, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("LOL ha ha.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 5) {
          pushMatrix(); 
          translate(-100, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 200, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Alright, let's get\ndown to business.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 6) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 10) {
        if (pressedVlevel == true) {
          pressedVlevel = false;
        }
        if (noAdvance == true) {
          noAdvance = false;
        }
        if (msg == 1) {
          pushMatrix(); 
          translate(0, 185);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 210, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("This is a 'platform.'", width/2, height/2);
          textFont(font, fontsize/1.5);
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          // draw arrow
          popMatrix();
        }
        if (msg == 2) {
          pushMatrix(); 
          translate(-250, 100);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 225, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Your avatar can\njump on the platform.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix(); 
          translate(-235, -250);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 180, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("If you are lucky it\nwill hold weight.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 4) {
          pushMatrix(); 
          translate(-240, 240);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 210, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Ha ha, just kidding.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 5) {
          pushMatrix(); 
          translate(-390, 100);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 180, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("All platforms are\n100% reliable.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 6) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 11) {
        if (msg == 1) {
          bounced = false;
          pushMatrix(); 
          translate(-200, 75);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 315, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("There are multiple platforms.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 2) {
          pushMatrix(); 
          translate(50, 10);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 200, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Make your way to\nthe top platform.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix(); 
          translate(-275, -150);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 260, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("See how it mocks you?", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 4) {
          pushMatrix(); 
          translate(-390, 235);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 285, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Don't put up with mockery!", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 5) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
        if (msg == 6) {
          next = true;
          pushMatrix(); 
          translate(-100, -240);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 115, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Well done.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 7) {
          next = false;
          msg = 0;
        }
      }
      if (currentLevel == 12) {
        if (msg == 1) {
          pushMatrix(); 
          translate(-(285/2), 10);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 285, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Wait…what's that number\ndoing up there?", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 2) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 13) {
        if (msg == 1) {
          pushMatrix(); 
          translate(-110, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 220, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("It looks like a score.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 2) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 14) {
        if (msg == 1) {
          pushMatrix(); 
          translate(-(215/2), 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 215, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("I don't remember\nany scoring system.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 2) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 15) {
        if (msg == 1) {
          pushMatrix(); 
          translate(-(175/2), 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 175, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Wait a minute...", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 2) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 16) {
        if (msg == 1) {
          pushMatrix(); 
          translate(-(225/2), 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 225, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Are these the right...", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 2) {
          next = false;
          levelNew[currentLevel] = true;
          msg = 0;
        }
      }
      if (currentLevel == 17) {
        // Let's see if the player has refused to read through any level's set of messages.
        // Use a for loop to iterate through all the variables for level newness check (i.e. whether
        // the player has progressed through the messages). Must subtract one since the first level is
        // zero, so i will max out at one fewer than the length of the array:
        //for (int i = 0; i < levelNew.length-1; i++) {
        //if (levelNew[i] == true) {

        // The above method would be very elegant. Too bad I can't get it to work. So I use this one:
        if (levelNew[0] == false &&
          levelNew[1] == false &&
          levelNew[2] == false &&
          levelNew[3] == false &&
          levelNew[4] == false &&
          levelNew[5] == false &&
          levelNew[6] == false &&
          levelNew[7] == false &&
          levelNew[8] == false &&
          levelNew[9] == false &&
          levelNew[10] == false &&
          levelNew[11] == false &&
          levelNew[12] == false &&
          levelNew[13] == false &&
          levelNew[14] == false &&
          levelNew[15] == false &&
          levelNew[16] == false &&
          levelNew[17] == false) { // This last one is probably unecessary but whatever.

          finalBattle = true; // No level's messages completely read. Let's get our battle on!
        }
        else {
          finalBattle = false;
        }

        if (finalBattle == true) {
          if (msg == 1) {
            stopMotion = true;
            notKirby.blastU = false;
            notKirby.blastD = false;
            notKirby.blastL = false;
            notKirby.blastR = false;
            noAdvance = false;
            pushMatrix(); 
            translate(-100, -50);
            noStroke();
            fill(textBackground); 
            rect(width/2, height/2-(fontsize*2), 215, fontsize*6+10);
            textFont(font, fontsize*2); 
            fill(textColor); 
            text("FREEZE!", width/2, height/2);
            textFont(font, fontsize/1.5); 
            text("[Press ENTER]", width/2, height/2+fontsize*4);
            popMatrix();
          }
          if (msg == 2) {
            pushMatrix(); 
            translate(-205, -50);
            noStroke();
            fill(textBackground); 
            rect(width/2, height/2-(fontsize*2), 425, fontsize*7+10);
            textFont(font, fontsize*2); 
            fill(textColor); 
            text("I suppose you think\nyou're pretty clever.", width/2, height/2);
            textFont(font, fontsize/1.5); 
            text("[Press ENTER]", width/2, height/2+fontsize*5);
            popMatrix();
          }
          if (msg == 3) {
            pushMatrix(); 
            translate(-235, -50);
            noStroke();
            fill(textBackground); 
            rect(width/2, height/2-(fontsize*2), 485, fontsize*7+10);
            textFont(font, fontsize*2); 
            fill(textColor); 
            text("Maybe you've heard\ncuriosity killed the cat?", width/2, height/2);
            textFont(font, fontsize/1.5); 
            text("[Press ENTER]", width/2, height/2+fontsize*5);
            popMatrix();
          }
          if (msg == 4) {
            pushMatrix(); 
            translate(-192.5, -50);
            noStroke();
            fill(textBackground); 
            rect(width/2, height/2-(fontsize*2), 400, fontsize*7+10);
            textFont(font, fontsize*1.5); 
            fill(textColor); 
            text("There's a danger to\ngoing behind the scenes.", width/2, height/2);
            textFont(font, fontsize/1.5); 
            text("[Press ENTER]", width/2, height/2+fontsize*5);
            popMatrix();
          }
          if (msg == 5 || msg == 0) {
            pushMatrix(); 
            translate(-127.5, -50);
            noStroke();
            fill(textBackground); 
            rect(bossXpos, bossYpos-(fontsize*2), 270, fontsize*5);
            textFont(font, fontsize*2); 
            fill(textColor); 
            text("Here, let me\nshow you.", bossXpos, bossYpos);
            popMatrix();
            noGoBack = true;
            next = false;
            stopMotion = false;
            msg = 0;

            // Thanks to Jennifer Presto for her elegant method of making one object follow another.
            // See her sketch here: http://www.openprocessing.org/sketch/67512. Here I go:
            if (bossXpos < notKirby.xPos) {
              bossXpos++;
            }
            if (bossXpos > notKirby.xPos) {
              bossXpos--;
            }
            if (bossYpos < notKirby.yPos) {
              bossYpos++;
            }
            if (bossYpos > notKirby.yPos) {
              bossYpos--;
            }
            fill(notKirby.c);
            text(notKirbyLife, 0, fontsize+10);
            fill(textBackground);
            text(bossLife, width-fontsize-5, fontsize+10);
            fill(255);

            // Collision detection: the gift that keeps on giving. Here we test to see if the boss msg
            // collides with notKirby:
            if ((notKirby.xPos-(notKirby.wide/2)) > (bossXpos-(270/2)) && (notKirby.xPos+
              (notKirby.wide/2)) < (bossXpos+(270/2)) && (notKirby.yPos-(notKirby.tall/2)) > 
              (bossYpos-((fontsize*5)/2)) && (notKirby.yPos+(notKirby.tall/2)) < 
              (bossYpos+((fontsize*5)/2))) {
              // If so we do damage and use a boolean to limit it to one damage per encounter.
              // But to whom?

              // Let's see if notKirby is rocketing:
              if (notKirby.blastU == true || notKirby.blastD == true || notKirby.blastL == true ||
                notKirby.blastR == true) {
                // If so, do damage to the boss:
                if (ctrlDmg == false) {
                  bossLife--;
                  ctrlDmg = true;
                }
              }
              // If notKirby is not rocketing, do damage to notKirby:
              else {
                if (ctrlDmg == false) {
                  notKirbyLife--;
                  ctrlDmg = true;
                }
              }
            }
            else {
              ctrlDmg = false;
            }

            // If notKirby runs out of health, go back to the previous level and reset things:
            if (notKirbyLife <= 0) {
              delay(1000);
              currentLevel = 16;
              bossLife = 3;
              notKirbyLife = 3;
              bossXpos = width/2;
              bossYpos = height/2;
              //noGoBack = false; // With this commented out the player cannot avoid taking on the
              // final battle again. I like that.
            }

            // If the boss runs out of health, win the game!
            if (bossLife <= 0) {
              delay(1000);
              gameMode = 3;
            }
          }
        }
        else {
          if (msg == 1) {
            pushMatrix();
            scale(0.75);
            translate(0, 0);
            noStroke();
            fill(textBackground); 
            rect(width/2, height/2-fontsize, 200, fontsize*4+10);
            textFont(font, fontsize); 
            fill(textColor); 
            text("These are the\nwrong instructions.", width/2, height/2);
            textFont(font, fontsize/1.5); 
            text("[Press ENTER]", width/2, height/2+fontsize*3);
            popMatrix();
          }
          if (msg == 2) {
            pushMatrix(); 
            translate(0, 0);
            noStroke();
            fill(textBackground); 
            rect(width/2, height/2-fontsize, 200, fontsize*4+10);
            textFont(font, fontsize); 
            fill(textColor); 
            text("I think they're\nfor another game.", width/2, height/2);
            textFont(font, fontsize/1.5); 
            text("[Press ENTER]", width/2, height/2+fontsize*3);
            popMatrix();
          }
          if (msg == 3) {
            pushMatrix();
            scale(4);
            translate(-350, -250);
            noStroke();
            fill(textBackground); 
            rect(width/2, height/2-fontsize, 115, fontsize*3+10);
            textFont(font, fontsize); 
            fill(textColor); 
            text("LOL", width/2, height/2);
            textFont(font, fontsize/1.5); 
            text("[Press ENTER]", width/2, height/2+fontsize*2);
            popMatrix();
          }
          if (msg == 4) {
            pushMatrix(); 
            translate(-390, 130);
            noStroke();
            fill(textBackground); 
            rect(width/2, height/2-fontsize, 215, fontsize*5+10);
            textFont(font, fontsize); 
            fill(textColor); 
            text("Alright,\n\nyou're on your own.", width/2, height/2);
            textFont(font, fontsize/1.5); 
            text("[Press ENTER]", width/2, height/2+fontsize*4);
            popMatrix();
          }
          if (msg == 5) {
            pushMatrix(); 
            translate(275, 225);
            noStroke();
            fill(textBackground); 
            rect(width/2, height/2-fontsize, 115, fontsize*3+10);
            textFont(font, fontsize); 
            fill(textColor); 
            text("Later.", width/2, height/2);
            textFont(font, fontsize/1.5); 
            text("[Press ENTER]", width/2, height/2+fontsize*2);
            popMatrix();
          }
          if (msg == 6) {
            next = false;
            levelNew[currentLevel] = true;
            displayWASD = true;
            msg = 0;
          }
        }
      }

      if (currentLevel > 17) {
        /*
    if (msg == 1) {
         pushMatrix(); 
         translate(0, 0);
         noStroke();
         fill(textBackground); 
         rect(width/2, height/2, 315, fontsize*3+10);
         textFont(font, fontsize); 
         fill(textColor); 
         text("", width/2, height/2);
         textFont(font, fontsize/1.5); 
         text("[Press ENTER]", width/2, height/2+fontsize*2);
         popMatrix();
         }
         */
        next = false;
        levelNew[currentLevel] = true;
        msg = 0;
      }
    }

    // End of instructions___________________________________________________________________________//

    // Additional instructions if the player gets to the last level in mode 2:
    if (gameMode == 2) {
      if (currentLevel == 17) {
        if (msg == 1) {
          stopMotion = true;
          notKirby.blastU = false;
          notKirby.blastD = false;
          notKirby.blastL = false;
          notKirby.blastR = false;
          noAdvance = false;
          pushMatrix(); 
          translate(-100, 100);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-(fontsize*2), 350, fontsize*6+10);
          textFont(font, fontsize*2); 
          fill(textColor); 
          text("WHOA THERE,\nTURBO.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*4);
          popMatrix();
        }
        if (msg == 2) {
          pushMatrix(); 
          translate(-300, 0);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 215, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Nice moves. You've\nearned a 'Pro Tip.'", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 3) {
          pushMatrix(); 
          translate(175, -225);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 190, fontsize*4+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("Pro Tip: press ' - '\nto switch modes.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*3);
          popMatrix();
        }
        if (msg == 4) {
          pushMatrix(); 
          translate(80, 225);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 300, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("...you're still not quite there.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 5) {
          pushMatrix(); 
          translate(-390, 180);
          noStroke();
          fill(textBackground); 
          rect(width/2, height/2-fontsize, 125, fontsize*3+10);
          textFont(font, fontsize); 
          fill(textColor); 
          text("LOL peace.", width/2, height/2);
          textFont(font, fontsize/1.5); 
          text("[Press ENTER]", width/2, height/2+fontsize*2);
          popMatrix();
        }
        if (msg == 6) {
          next = false;
          levelNew[currentLevel] = true;
          stopMotion = false;
          msg = 0;
        }
      }
    }
  }
}

// __________________________________________________________________________________________________
void mousePressed() {

  // Use this to click on the light pull handle to start the game!
  if (gameMode == 0) {

    // Make sure the cursor is on the pull handle:
    if (mouseX >= width/2+270 && mouseX <= width/2+280) {
      if (mouseY >= height/2+140 && mouseY <= height/2+190) {

        // Add some visual pause to give significance to the transition (hopefully it doesn't just look
        // like slowdown):
        delay(1000);
        gameMode = 1;
      }
    }
  }
}


void keyPressed() {

  // Start debug section. __________________________________________________________________________

  /*
  if (key=='1') { // Debug.
   if (currentLevel > 0) { // If previous level exists...
   currentLevel--; // ...switch to previous level.
   }
   }
   
   if (key=='2') { // Debug.
   if (currentLevel < (myLevels.length - 1)) { // If next level exists...
   currentLevel++; // ...switch to next level.
   }
   }
   
   if (key=='0') { // Debug.
   msg--;
   }
   */

  // End debug section. _____________________________________________________________________________

  if (key=='v' || key=='V') {
    if (pressedVlevel == true) {
      msg++;
    }
  }
  if (key=='-' || key=='_') { // Switch game modes.
    if (gameMode == 1) {
      gameMode = 2;
      // Add some visual pause to give significance to the transition (hopefully it doesn't just look
      // like slowdown):
      delay(1000);
      setup(); // This returns to the first screen with the original setup, except it's a new mode.
    }
    else {
      gameMode = 1;
      // Add some visual pause to give significance to the transition (hopefully it doesn't just look
      // like slowdown).
      delay(1000); 
      setup();
    }
  }

  if (keyCode==ENTER || keyCode==RETURN) { // Let's advance the text boxes.
    if (noAdvance == false) { // Assuming it is permitted.
      if (msg >= 1) { // If there's a message on screen...
        if (next == true) { // ...and if there are more messages to come...
          msg++; // ...advance to the next message.
        }
        else {
          msg = 0; // Turn off messages (thereby enabling movement).
        }
      }
    }
  }



  // Let's control the ball. Many, MANY thanks to Ramiro Corbetta and his Dorkshop on Intro to Game
  // Programming for this method of controlling movement through booleans (resulting in much more
  // fluid control and recognition of multiple buttons at once).

  if (promptJump == true) { // Special jump instructions for if jumping is prompted.
    if (key==' ') { // If the player presses the Space Bar...
      if (notKirby.yPos >= height - (notKirby.tall / 2)) { // ...and if the ball is on the ground...
        notKirby.jump = true; // ...enable jumping.
        jumpCounter ++;
      }

      /*
      OK, this is where things get really awesome (and really complicated). It's time for collision
       detection - super cool and super important! Each level is an ArrayList composed of varying
       numbers of Platform objects. We use a for loop to count how many platforms there are in the
       ArrayList for the current level, then iterate through those platforms. We are going to check
       the ball's position relative to each Platform in the ArrayList.
       */

      else for (int i = 0; i < myLevels[currentLevel].myPlats.size(); i++) { 

        /*
        ArrayLists are weird (and cool). They don't necessarily know what kind of information
         they hold in their elements. In order to use if statements to check notKirby's position
         relative to each platform, we have to give each platform an identity, which we do by naming
         it as a platform ("myPlatform" in this case) and assigning it the current value of i. In
         other words, this statement allows us to pull one of the objects in the ArrayList so we can
         refer to it in the following statements.
         */
        Platform myPlatform = myLevels[currentLevel].myPlats.get(i);

        // At each value of i (aka ArrayList element in this case), is the ball's xPos within the
        // width of the platform at that element?
        if ((notKirby.xPos + (notKirby.wide / 2) >= myPlatform.xPos) && (notKirby.xPos - 
          (notKirby.wide / 2) <= (myPlatform.xPos + myPlatform.platWidth))) {

          // Assuming we got a positive result above, is the ball's yPos within the upper part of
          // the platform at that element?
          if ((notKirby.yPos + (notKirby.tall / 2) >= myPlatform.yPos) && (notKirby.yPos + 
            (notKirby.tall / 2) <= (myPlatform.yPos + notKirby.depth))) {

            notKirby.jump = true; // If yes to all the above, enable jumping.
            jumpCounter ++;
          }
        }
      }
    }
  }

  if (msg <= 0) { // If there are no messages on screen, proceed.
    if (keyCode==RIGHT) { // If the player presses the right-directional arrow key...
      notKirby.R = true; // ...enable movement right...
      direction=true; // ...and face right.
    }
    if (keyCode==LEFT) { // If the player presses the left-directional arrow key...
      notKirby.L = true; // ...enable movement left...
      direction=false; // ...and face left.
    }
    if (key==' ') { // If the player presses the Space Bar...
      if (notKirby.yPos >= height - (notKirby.tall / 2)) { // ...and if the ball is on the ground...
        notKirby.jump = true; // ...enable jumping.
      }
      else for (int i = 0; i < myLevels[currentLevel].myPlats.size(); i++) { // Collision detection.
        Platform myPlatform = myLevels[currentLevel].myPlats.get(i); // Works the same as above.
        if ((notKirby.xPos + (notKirby.wide / 2) >= myPlatform.xPos) && (notKirby.xPos - 
          (notKirby.wide / 2) <= (myPlatform.xPos + myPlatform.platWidth))) { // Ball's within width?
          if ((notKirby.yPos + (notKirby.tall / 2) >= myPlatform.yPos) && (notKirby.yPos + 
            (notKirby.tall / 2) <= (myPlatform.yPos + notKirby.depth))) { // Ball's within upper part?
            notKirby.jump = true; // If yes to all the above, enable jumping.
          }
        }
      }
    }
  }

  // Alternative movement mechanics:
  if (stopMotion == false) {
    if (key=='w' || key=='W') {
      notKirby.blastU = true;
    }
    if (key=='a' || key=='A') {
      notKirby.blastL = true;
      direction = false;
    }
    if (key=='s' || key=='S') {
      notKirby.blastD = true;
    }
    if (key=='d' || key=='D') {
      notKirby.blastR = true;
      direction = true;
    }
  }
}

// ___________________________________________________________________________________________________

// We use these statements to stop movement when the player releases the key. Otherwise notKirby would
// just keep groovin' in the same direction until he runs into a wall. You jerk.

void keyReleased() { 

  if (keyCode==RIGHT) {
    notKirby.R = false;
  }
  if (keyCode==LEFT) {
    notKirby.L = false;
  }

  // Alternative movement mechanics:
  if (key=='w' || key=='W') {
    notKirby.blastU = false;
  }
  if (key=='a' || key=='A') {
    notKirby.blastL = false;
  }
  if (key=='s' || key=='S') {
    notKirby.blastD = false;
  }
  if (key=='d' || key=='D') {
    notKirby.blastR = false;
  }
}

// ___________________________________________________________________________________________________

/*
The following code is a hack of sorts from the Processing website, for
 which I'm very grateful. I use pushMatrix and popMatrix to position
 the text instructions above more easily, but I discovered that Processing has a
 built-in limit of 32 uses of the push function, which was insufficient.
 Fortunately I found this solution, which overrides the default limit. Everything
 below the end of this comment is copied and pasted from the page cited below in
 the next comment. I don't totally understand what it's doing, but I'm grateful for it!
 */

/**
 deepmatrixstack taken from http:// wiki.processing.org/index.php/Matrix_stack
 to override the default stack just copy & paste the following code
 to your sketch
 @author steve
 */

// adjust this value to whatever depth is actually necessary
public final int STACK_DEPTH = 512;
public float[][] matrixStack = new float[STACK_DEPTH][6];
public int matrixStackDepth;

// this version will override the built-in version pushMatrix function
public void pushMatrix() {
  if (matrixStackDepth == 512) {
    throw new RuntimeException("too many calls to pushMatrix()");
  }
  this.g.getMatrix().get(matrixStack[matrixStackDepth]);
  matrixStackDepth++;
}

// this version will override the built-in version popMatrix function
public void popMatrix() {
  if (matrixStackDepth == 0) {
    throw new RuntimeException("too many calls to popMatrix()" +
      "(or too few to pushMatrix)");
  }
  matrixStackDepth--;
  PMatrix2D m = new PMatrix2D();
  m.set(matrixStack[matrixStackDepth]);
  this.g.setMatrix(m);
}


