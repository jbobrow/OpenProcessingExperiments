
// Code for enemy AI is a modification of that found
// in http://youtu.be/3AA9Hs5RfsA . Inspiration from
// Tom Francis: http://youtu.be/DN6dZWXUEzA .

int winWidth = 640, // Change the window dimensions here.
winHeight = 480;

float playerX = 320, // These floats are used in
playerY = 240, // the custom function playerDraw.
playerWidth = 24, 
playerHeight = 24, 

playerWalkSpeed = 2.0, // These floats are used in
playerRunSpeed = 4.0, // the custom functions playerMove
screenPadding = 4.0, // and playerStamina.
playerStamina = 250.0, 
playerMaxStamina = 250.0, 
playerOrientation = 0, 
staminaBarR = 0, 
staminaBarG = 255, 
staminaBarB = 255, 

playerHealth = 250.0, // These floats are used in
playerMaxHealth = 250.0, // the custom function playerHealth.
healthBarR = 255, 
healthBarG = 0, 
healthBarB = 0, 

enemyX = 250, // These floats are used in
enemyY = 250, // the custom funtion enemyDraw.
enemyRadius = 24, 

enemyWalkSpeed = 3.0, 
enemyDirection = 0.0, 
enemyMindChange = 0.0, 
enemyOrientation = 0.0, 

xDistE = 0, // These five floats are used in
yDistE = 0, // the custom function vectorDiagnostic
magnitudeE = 0, // for the player-enemy relation.
playerAngleE = 0, 
enemyAngleE = 0, 

xDistC = 0, // These six floats are used in
yDistC = 0, // the custom function vectorDiagnostic
magnitudeC = 0, // for the player-cursor relation.
playerAngleC = 0, 
absPlayerAngleC = 0, 
cursorAngleC = 0, 

diagnosticPiA = 0, // This draws an arc to illustrate the playerGun.
diagnosticPiB = 0; // This draws an arc to illustrate playerOrientation.

boolean holdLeft = false, // These five booleans are used in
holdRight = false, // the custom function setSignal,
holdUp = false, // which in turn passes them to
holdDown = false, // the custom function playerMove.
holdShift = false, 
holdSpace = false;

void setup() {
  noCursor();
  size(winWidth, winHeight);
}

void draw() {
  background(3, 44, 110);

  //Instructions for the player.
  fill(0);
  text("Hold shift to dash. Hold space for diagnostic.", 5, 15);
  fill(255);
  text("Hold shift to dash. Hold space for diagnostic.", 4, 14);

  // Custom functions called within draw.
  enemyDraw();
  enemyMove();
  playerDraw();
  playerMove();
  playerGun();

  // For player movement in relation to the screen, we want the
  // origin to be (0,0). However, any action for which the player
  // is the center of the world requires us translate the origin
  // to (playerX, playerY). pushMatrix and popMatrix contain
  // and isolate this translation.

  pushMatrix();
  translate(playerX, playerY);
  actorRelations();
  if (holdSpace) {
    vectorDiagnostic();
  }
  popMatrix();
}

void actorRelations() {

  // Calculates player-cursor relation.
  xDistC = dist(0, 0, mouseX-playerX, 0);
  yDistC = dist(mouseX-playerX, mouseY-playerY, mouseX-playerX, 0);
  magnitudeC = dist(0, 0, mouseX-playerX, mouseY-playerY);
  playerAngleC = atan(yDistC/xDistC); // In radians.
  cursorAngleC = atan(xDistC/yDistC); // In radians.

  // Processing draws arcs clockwise where (x=0, y>0) is 0 degrees
  // and 0 radians. However, the above calculates the angle between
  // the player and cursor in absolute distances, so the angle
  // is never > 90 degrees. Below translates the angle into an angle
  // suitable for drawing arcs, so the player's "gun" points at
  // the mouse. There was probably a easier way to do this, but
  // math is not my strong point.

  if (mouseX-playerX > 0 && mouseY-playerY > 0) {
    absPlayerAngleC = playerAngleC;
  } 
  if (mouseX-playerX < 0 && mouseY-playerY > 0) {
    absPlayerAngleC = PI - playerAngleC;
  } 
  if (mouseX-playerX < 0 && mouseY-playerY < 0) {
    absPlayerAngleC = PI + playerAngleC;
  } 
  if (mouseX-playerX > 0 && mouseY-playerY < 0) {
    absPlayerAngleC = TAU - playerAngleC;
  }

  // Calculates the player-enemy relation.
  xDistE = dist(0, 0, enemyX-playerX, 0);
  yDistE = dist(enemyX-playerX, enemyY-playerY, enemyX-playerX, 0);
  magnitudeE = dist(0, 0, enemyX-playerX, enemyY-playerY);
  playerAngleE = atan(yDistE/xDistE); // In radians.
  enemyAngleE = atan(xDistE/yDistE); // In radians.
}

void playerDraw() {

  pushStyle(); // Push and Pop Style allow us to contain fill and stroke.

  // This draws the player's shape when the player is not moving.
  strokeWeight(2);
  stroke(0);
  fill(255);
  ellipse(playerX, playerY, playerWidth, playerHeight);

  // These if statements draw a line which shows the player's
  // orientation when moving. playerOrientation records the
  // angle the player is facing, so in the future there can
  // be an added bonus if the player fires where s/he faces.

  // Problem: the player standing still is recorded as the
  // equivalent as the player heading toward the right.

  // Basic Right, Left, Up, Down.
  // Also accounts for user holding down three keys, two of which negate each other.
  if ((holdRight == true && holdLeft == false && holdUp == false && holdDown == false) || (holdRight == true && holdLeft == false && holdUp == true && holdDown == true)) {
    line(playerX, playerY, (playerX+round(playerWidth/2)), playerY);
    playerOrientation = 0;
  }

  if ((holdLeft == true && holdRight == false && holdUp == false && holdDown == false) || (holdLeft == true && holdRight == false && holdUp == true && holdDown == true)) {
    line(playerX, playerY, (playerX-round(playerWidth/2)), playerY);
    playerOrientation = PI;
  }

  if ((holdUp == true && holdDown == false && holdLeft == false && holdRight == false) || (holdUp == true && holdDown == false && holdLeft == true && holdRight == true)) {
    line(playerX, playerY, playerX, (playerY-round(playerHeight/2)));
    playerOrientation = PI+HALF_PI;
  }

  if ((holdDown == true && holdUp == false && holdLeft == false && holdRight == false) || (holdDown == true && holdUp == false && holdLeft == true && holdRight == true)) {
    line(playerX, playerY, playerX, (playerY+round(playerHeight/2)));
    playerOrientation = HALF_PI;
  }

  // Diagonal Right-Up, Right-Down, Left-Up, Left-Down
  if (holdRight == true && holdLeft == false && holdUp == true && holdDown == false) {
    line(playerX, playerY, (playerX+round(playerWidth/2-5)), (playerY-round(playerHeight/2-5)));
    playerOrientation = PI*1.75;
  }
  if (holdRight == true && holdLeft == false && holdUp == false && holdDown == true) {
    line(playerX, playerY, (playerX+round(playerWidth/2-5)), (playerY+round(playerHeight/2-5)));
    playerOrientation = PI*0.25;
  }
  if (holdLeft == true && holdRight == false && holdUp == true && holdDown == false) {
    line(playerX, playerY, (playerX-round(playerWidth/2-5)), (playerY-round(playerHeight/2-5)));
    playerOrientation = PI*1.25;
  }
  if (holdLeft == true && holdRight == false && holdUp == false && holdDown == true) {
    line(playerX, playerY, (playerX-round(playerWidth/2-5)), (playerY+round(playerHeight/2-5)));
    playerOrientation = PI*0.75;
  }

  // No inputs; contradictory inputs Left-Right, Up-Down, All Four Keys.
  if (holdRight == true && holdLeft == true && holdUp == false && holdDown == false) {
    point(playerX, playerY);
    playerOrientation = 0;
  }
  if (holdUp == true && holdDown == true && holdLeft == false && holdRight == false) {
    point(playerX, playerY);
    playerOrientation = 0;
  }
  if (holdUp == true && holdDown == true && holdLeft == true && holdRight == true) {
    point(playerX, playerY);
    playerOrientation = 0;
  }
  if (holdUp == false && holdDown == false && holdLeft == false && holdRight == false) {
    playerOrientation = 0;
  }

  popStyle();
}

void playerMove() {

  // If we don't want the player to walk offscreen, we stipulate
  // an additional condition that the player's position must be
  // either greater than the minimum screen boundary (0,0) plus
  // half the player's size or less than the screen boundary
  // (height,width) minus half the player's size.

  // screenPadding adds some buffer.

  // Recall the Pythagorean theorem for determining the hypotenuse
  // of a right triangle, a^2 + b^2 = c^2, so c = sqrt(a^2 + b^2).
  // If the player holds left or right and up or down together, he
  // or she can gain an unfair advantage, since diagonal travel is
  // is 2.83 when walking speed = 2, and 5.66 when running speed = 4.

  if (holdLeft && playerX > 0 + screenPadding + (playerWidth/2)) {
    playerX -= playerWalkSpeed;
  }
  if (holdRight && playerX < width - screenPadding - (playerWidth/2)) {
    playerX += playerWalkSpeed;
  }
  if (holdUp && playerY > 0 + screenPadding + (playerWidth/2)) {
    playerY -= playerWalkSpeed;
  }
  if (holdDown && playerY < height - screenPadding - (playerHeight/2)) {
    playerY += playerWalkSpeed;
  }

  // Functions of the player that playerMove will call:
  playerStamina();
  playerHealth();
}

void playerStamina() {

  // The player will run if they are holding shift and a direction
  // and their stamina is greater than 0.
  if (holdShift && playerStamina > 0 && (holdLeft || holdRight || holdUp || holdDown)) {
    playerWalkSpeed = playerRunSpeed;
    playerStamina -= 1.0;
  } else {
    playerWalkSpeed = 2.0;
  }

  // When the player is not holding shift, they will recover stamina.
  if ((holdShift == false) && playerStamina < playerMaxStamina) {
    playerStamina += 0.25;
  }

  // UI Display
  pushStyle();
  fill(0);
  // Draws a drop shadow for the STAMINA label so that it stands out over high texture backgrounds.
  text("STAMINA: " + int((playerStamina/playerMaxStamina)*100) + "% ( " + round(playerStamina) + " / " + round(playerMaxStamina) + " )", 11, height-9);
  // Draws a rectangle for the stamina bar capacity, showing an empty bar when actual stamina depletes.
  rect(200, height-20, 200, 10);
  fill(255);
  text("STAMINA: " + int((playerStamina/playerMaxStamina)*100) + "% ( " + round(playerStamina) + " / " + round(playerMaxStamina) + " )", 10, height-10);
  // The green in the stamina bar is directly proportional to the player's stamina, so green increases as stamina increases.
  staminaBarG = int(map(playerStamina, 0, playerMaxStamina+1, 0, 256));
  fill(staminaBarR, staminaBarG, staminaBarB);
  rect(200, height-20, int(map(playerStamina, 0, playerMaxStamina+1, 0, 201)), 10);
  popStyle();
}

void playerHealth() {

  if (playerHealth<=0) {
    exit();
  }

  // UI Display
  pushStyle();
  fill(0);
  // Draws a drop shadow for the Health label so that it stands out over high texture backgrounds.
  text("HEALTH: " + int((playerHealth/playerMaxHealth)*100) + "% ( " + round(playerHealth) + " / " + round(playerMaxHealth) + " )", 11, height-29);
  // Draws a rectangle for the health bar capacity, showing an empty bar when actual stamina depletes.
  rect(200, height-40, 200, 10);
  fill(255);
  text("HEALTH: " + int((playerHealth/playerMaxHealth)*100) + "% ( " + round(playerHealth) + " / " + round(playerMaxHealth) + " )", 10, height-30);
  // The yellow in the health bar is inversely proportional to the player's health, so yellow increases as health decreases.
  healthBarG = int(map(playerHealth, 0, playerMaxHealth+1, 255, 0));
  fill(healthBarR, healthBarG, healthBarB);
  rect(200, height-40, int(map(playerHealth, 0, playerMaxHealth+1, 0, 201)), 10);
  popStyle();
}

void playerGun() {
  pushStyle();
  strokeWeight(1);
  stroke(255, 0, 0);
  noFill();
  point(mouseX, mouseY);
  ellipse(mouseX, mouseY, 10, 10);
  strokeWeight(2);
  stroke(7, 102, 255);
  line(playerX + cos(absPlayerAngleC)*10, playerY + sin(absPlayerAngleC)*10, playerX + cos(absPlayerAngleC)*20, playerY + sin(absPlayerAngleC)*20);
  popStyle();
}

void enemyDraw() {
  pushStyle();
  strokeWeight(2);
  stroke(255); 
  fill(0);
  ellipse(enemyX, enemyY, enemyRadius, enemyRadius);

  // For now, I'm assuming that the enemy is a circle, and that its height = width = radius.
  if (playerHealth > 0 && dist(playerX, playerY, enemyX, enemyY) <= enemyRadius)
  {

    // When your stamina is low, your defenses are down.
    if (playerStamina <=25) {
      playerHealth -= 2.0;
    } else {
      playerHealth -= 1.0;
    }
  }
  popStyle();
}

void enemyMove() {
  // Credit for this enemy AI code goes to the
  // gentleman in http://youtu.be/3AA9Hs5RfsA .

  pushStyle();
  strokeWeight(2);
  stroke(255);

  //If the enemy is on top of the player, the enemy stays put.
  if (playerHealth > 0 && dist(playerX, playerY, enemyX, enemyY) <= enemyRadius)
  {
  } else {

    // Otherwise, every 20 to 120 frames, the AI
    // picks a new direction to head in from
    // the 8 cases of possible directions.
    enemyMindChange--;
    if (enemyMindChange < 0) {
      enemyMindChange = 5+random(100);
      enemyDirection = random(8);
    }

    switch(int(enemyDirection)) {

    case 0:
      enemyX += enemyWalkSpeed;
      if ((enemyX <= 0+screenPadding+(enemyRadius/2)) || (enemyX >= width-screenPadding-(enemyRadius/2)))
      {
        enemyX -= enemyWalkSpeed;
      }
      break;

    case 1:
      enemyX += enemyWalkSpeed;
      enemyY += enemyWalkSpeed;
      if ((enemyX <= 0+screenPadding+(enemyRadius/2)) || (enemyX >= width-screenPadding-(enemyRadius/2)) || (enemyY <= 0+screenPadding+(enemyRadius/2)) || (enemyY >= height-screenPadding-(enemyRadius/2)) )
      {
        enemyX -= enemyWalkSpeed;
        enemyY -= enemyWalkSpeed;
      }
      break;

    case 2:
      enemyY += enemyWalkSpeed;
      if ((enemyY <= 0+screenPadding+(enemyRadius/2)) || (enemyY >= height-screenPadding-(enemyRadius/2)) || (enemyY <= 0+screenPadding+(enemyRadius/2)) || (enemyY >= height-screenPadding-(enemyRadius/2))) 
      {
        enemyY -= enemyWalkSpeed;
      }
      break;

    case 3:
      enemyX -= enemyWalkSpeed;
      enemyY += enemyWalkSpeed;
      if ((enemyX <= 0+screenPadding+(enemyRadius/2)) || (enemyX >= width-screenPadding-(enemyRadius/2)) || (enemyY <= 0+screenPadding+(enemyRadius/2)) || (enemyY >= height-screenPadding-(enemyRadius/2)))
      {
        enemyX += enemyWalkSpeed;
        enemyY -= enemyWalkSpeed;
      }
      break;

    case 4:
      enemyX -= enemyWalkSpeed;
      if ((enemyX <= 0+screenPadding+(enemyRadius/2)) || (enemyX >= width - screenPadding - (enemyRadius/2)) || (enemyY <= 0+screenPadding+(enemyRadius/2)) || (enemyY >= height-screenPadding-(enemyRadius/2)))
      {
        enemyX += enemyWalkSpeed;
      }
      break;

    case 5:
      enemyX -= enemyWalkSpeed;
      enemyY -= enemyWalkSpeed;
      if ((enemyX <= 0+screenPadding+(enemyRadius/2)) || (enemyX >= width-screenPadding-(enemyRadius/2)) || (enemyY <= 0+screenPadding+(enemyRadius/2)) || (enemyY >= height-screenPadding-(enemyRadius/2)))
      {
        enemyX += enemyWalkSpeed;
        enemyY += enemyWalkSpeed;
      }
      break;

    case 6:
      enemyY -= enemyWalkSpeed;
      if ((enemyX <= 0+screenPadding+(enemyRadius/2)) || (enemyX >= width-screenPadding-(enemyRadius/2)) || (enemyY <= 0+screenPadding+(enemyRadius/2)) || (enemyY >= height-screenPadding-(enemyRadius/2)))
      {
        enemyY += enemyWalkSpeed;
      }
      break;

    case 7:
      enemyX += enemyWalkSpeed;
      enemyY -= enemyWalkSpeed;
      if ((enemyX <= 0+screenPadding+(enemyRadius/2)) || (enemyX >= width-screenPadding-(enemyRadius/2)) || (enemyY <= 0+screenPadding+(enemyRadius/2)) || (enemyY >= height-screenPadding-(enemyRadius/2)))
      {
        enemyX -= enemyWalkSpeed;
        enemyY += enemyWalkSpeed;
      }
      break;
    }
  }
  popStyle();
}

void vectorDiagnostic() {
  pushStyle();

  // Draws the triangle from player to cursor position.
  strokeWeight(2);
  stroke(0, 255, 0, 80);
  line(0, 0, mouseX-playerX, mouseY-playerY);
  strokeWeight(1);
  stroke(0, 180, 0, 45);
  line(mouseX-playerX, mouseY-playerY, mouseX-playerX, 0);
  line(0, 0, mouseX-playerX, 0);

  // Displays diagnostic calculations for player to cursor position.
  //Drop shadow beneath text.
  fill(0, 85);
  text("Magnitude: " + magnitudeC, int((mouseX-playerX)/2+1), int((mouseY-playerY)/2+1));
  text("\u2220" + degrees(playerAngleC) + "\u00B0", 61, 1);
  text("Cursor: (" + int(mouseX-playerX) + ", " + int(mouseY-playerY) + "), \u2220" + degrees(cursorAngleC) + "\u00B0", mouseX-playerX+6, mouseY-playerY+1);
  //Actual Text
  fill(0, 255, 0, 205);
  text("Magnitude: " + magnitudeC, int((mouseX-playerX)/2), int((mouseY-playerY)/2));
  text("\u2220" + degrees(playerAngleC) + "\u00B0", 60, 0);
  text("Cursor: (" + int(mouseX-playerX) + ", " + int(mouseY-playerY) + "), \u2220" + degrees(cursorAngleC) + "\u00B0", mouseX-playerX+5, mouseY-playerY);

  // Draws the triangle from player to enemy position.
  strokeWeight(2);
  stroke(255, 255, 0, 90);
  line(0, 0, enemyX-playerX, enemyY-playerY);
  strokeWeight(1);
  stroke(200, 180, 0, 55);
  line(enemyX-playerX, enemyY-playerY, enemyX-playerX, 0);
  line(0, 0, enemyX-playerX, 0);

  // Displays diagnostic calculations for player to enemy position.
  //Drop shadow beneath text.
  fill(0, 0, 0, 85);
  text("Magnitude: " + magnitudeE, int((enemyX-playerX)/2+1), int((enemyY-playerY)/2+1));
  text("Player: (" + int(0) + ", " + int(0) + "), \u2220" + degrees(playerAngleE) + "\u00B0", -19, -19);
  text("Enemy: (" + int(enemyX-playerX) + ", " + int(enemyY-playerY) + "), \u2220" + degrees(enemyAngleE) + "\u00B0", enemyX-playerX+6, enemyY-playerY+1);
  //Actual Text
  fill(255, 255, 0, 205);
  text("Magnitude: " + magnitudeE, int((enemyX-playerX)/2), int((enemyY-playerY)/2));
  text("Player: (" + int(0) + ", " + int(0) + "), \u2220" + degrees(playerAngleE) + "\u00B0", -20, -20);
  text("Enemy: (" + int(enemyX-playerX) + ", " + int(enemyY-playerY) + "), \u2220" + degrees(enemyAngleE) + "\u00B0", enemyX-playerX+5, enemyY-playerY);

  // This illustrates the player's orientation in relation
  // to the gun's angle.
  fill(1, 18, 46, 205);
  if (diagnosticPiB >= playerOrientation) {
    diagnosticPiB = 0;
  } else {
    diagnosticPiB += QUARTER_PI/6;
  }
  arc(90, 22, 30, 30, 0, diagnosticPiB, PIE);

  // This illustrates the arc of the absolute angle (gun's angle)
  // from (x=0, y>0) to the cursor position.
  noFill();
  strokeWeight(2);
  stroke(7, 102, 255, 205);
  if (diagnosticPiA >= absPlayerAngleC) {
    diagnosticPiA = 0;
  } else {
    diagnosticPiA += QUARTER_PI/10;
  }
  arc(90, 22, 30, 30, 0, diagnosticPiA, PIE);
  fill(7, 102, 255, 205);

  // This displays the gun's angle. If the player is moving,
  // it displays player heading. It then takes the absolute
  // value of the difference between the two. One could imagine
  // that if this value is less than the human field of view,
  // the player is looking where s/he's pointing. 
  text("Gun \u2220" + degrees(absPlayerAngleC) + "\u00B0", 60, 54);
  fill(1, 18, 46, 205);
  if (playerOrientation == 0) {
    if ((holdRight == true && holdLeft == false && holdUp == false && holdDown == false) || (holdRight == true && holdLeft == false && holdUp == true && holdDown == true)) {
      text("Heading \u2220" + int(degrees(playerOrientation)) + "\u00B0", 60, 70);
      text("\u0394" + round(degrees(absPlayerAngleC-playerOrientation)) + "\u00B0", 60, 86);
    } else {
      text("Standing Still", 60, 70);
    }
  } else {
    text("Heading \u2220" + int(degrees(playerOrientation)) + "\u00B0", 60, 70);
    text("\u0394" + round(degrees(abs(playerOrientation-absPlayerAngleC))) + "\u00B0", 60, 86);
  }
  popStyle();
}

// This custom function holds all the variables which will be set
// to true once a key is pressed. It works with the baked-in
// key pressed and key released functions below. This way, 
// any other custom function can say "if the boolean var. name
// tied to the key is true, then do the following."

void setSignal(boolean setTo) {
  if (keyCode == LEFT) {
    holdLeft = setTo;
  }
  if (keyCode == RIGHT) {
    holdRight = setTo;
  }
  if (keyCode == UP) {
    holdUp = setTo;
  }
  if (keyCode == DOWN) {
    holdDown = setTo;
  }
  if (keyCode == SHIFT) {
    holdShift = setTo;
  }
  if (key == ' ') {
    holdSpace = setTo;
  }
}

void keyPressed() {
  setSignal(true);
}

void keyReleased() {
  setSignal(false);
}

