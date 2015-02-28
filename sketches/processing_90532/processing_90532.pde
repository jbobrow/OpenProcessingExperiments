
PFont font;
float W;
float H;
int rad;
float xPos;
float xPos2;
float yPos;
int inc;
int gameState;
int totalSlides;

void setup() {

  size(600, 600);
  frameRate(60);
  smooth();
  noFill();

  strokeWeight(5);
  textAlign(CENTER);
  font = loadFont("font.vlw");
  textFont(font, 24);

  gameState = 1; // Current game screen.
  totalSlides = 18; // Number of game screens.
  rad = 150; // Radius of circle.
  W = width/2;
  H = height/2;
  inc = 0; // Angle (for trig purposes).
  xPos2= 0;
}

void draw() {

  background(125);

  // Increase the angle to draw with trig;
  // reset the angle if it gets too big. A rhyme.
  inc++;
  if (inc > 360*60) {
    inc = 0;
  }

  // Set the x and y positions with trig.
  xPos = sin(inc/60) * rad;
  yPos = cos(inc/60) * rad;

  // This secondary x position moves from left to right over and over.
  xPos2++;
  if (xPos2 > width) {
    xPos2 = 0;
  }

  // Show the screen count and arrow cues:
  fill(255);
  if (gameState > 1) {
    text("<--", 25, height-10); // If there's a previous screen, draw a left arrow.
  }
  if (gameState < totalSlides) {
    text("-->", width-25, height-10); // If there's a following screen, draw a right arrow.
  }
  text(gameState + "/" + totalSlides, W, height-10); // Draw the screen count.
  fill(0);

  if (gameState == 1) {

    fill(0);
    text("Let's learn about oscillation.", W, H);
  }

  if (gameState == 2) {

    fill(0);
    text("Oscillation is a scary term,\n\nbut it's not so bad.\n\nIt starts with a circle.", W, H-50);
  }

  if (gameState == 3) {

    fill(0);
    text("Watch the ball.\nIt has 'periodic' movement.\nVery important for oscillation.", W, 50);
    text("Periodic movement recurs endlessly, and always takes\nthe same amount of time to complete (the 'period').", W, height-100);

    noFill();
    ellipseMode(RADIUS);
    ellipse(W, H, rad, rad); // Draw a circle.
    pushMatrix();
    translate(W, H); // Relocate the origin temporarily to make this next bit easier to position.
    fill(255);
    stroke(255);
    ellipse(xPos, yPos, rad/10, rad/10); // Draw a ball that travels around the circle's circumference, using trig.
    stroke(0);
    noFill();
    popMatrix();
  }

  if (gameState == 4) {

    text("Now imagine you are looking at that circle from the side.\n\nWhat does the ball's movement look like?", W, H-25);
  }

  if (gameState == 5) {

    text("Something like this, perhaps?", W, 100);
    text("I'm just kidding ya. That's exactly what it looks like.", W, height-75);

    line(W, H-rad, W, H+rad); // Vertical line (profile view of circle).
    pushMatrix();
    translate(W, H);
    fill(255);
    stroke(255);
    ellipse(0, yPos, rad/10, rad/10); // Same ball as before but now it just goes up and down.
    stroke(0);
    noFill();
    popMatrix();
  }

  if (gameState == 6) {

    text("'I was told there'd be oscillation,' you assert.\n\nHold yer horses.\n\nWe're getting there.", W, H-50);
  }

  if (gameState == 7) {

    text("Now...imagine tracking that ball through time.\n\n\nHuh? ", W, H-50);
  }

  if (gameState == 8) {

    text("Well, we'll look at the circle from the side again,\nbut set the ball free from the circle's tyrannical bounds.\n\n\nWhat?", W, H-75);
  }

  if (gameState == 9) {

    text("Sigh.", W, H);
  }

  if (gameState == 10) {

    text("OK, remember this? Yeah you do.", W, 100);
    text("The ball traces a vertical path periodically,\nbut it stays in one place horizontally\nbecause the side view of the circle has no x-axis.", W, height-100);

    line(W, H-rad, W, H+rad);
    pushMatrix();
    translate(W, H);
    fill(255);
    stroke(255);
    ellipse(0, yPos, rad/10, rad/10);
    stroke(0);
    noFill();
    popMatrix();
  }

  if (gameState == 11) {

    text("What if we let the x-axis represent something other\nthan spatial position? Something like...time?\n\n\nThe ball bounces from from top to bottom to top,\nbut it can only move one direction in time.", W, H-75);
  }

  if (gameState == 12) {

    text("Track the ball's periodic vertical movement\nwhile tracking its passage through time and you get this:", W, 50);
    text("Position", W, H-rad-7);
    text("Time", W-235, H+7);
    text("(The ball may appear to repeat its horizontal course,\nbut don't be fooled.\nYour screen cannot contain the mysteries of time.)", W, height-100);

    line(W, H-rad, W, H+rad);
    line(100, H, width-100, H);
    pushMatrix();
    translate(0, H);
    fill(255);
    stroke(255);
    ellipse(xPos2, yPos, rad/10, rad/10); // This time we draw the ball moving vertically as before but it moves from left to right across the screen.
    stroke(0);
    noFill();
    popMatrix();
  }

  if (gameState == 13) {

    text("OSCILLATION.", W, H);
  }

  if (gameState == 14) {

    text("...which, when you color in the path, looks like this:", W, 100);
    text("Position", W, H-rad-7);
    text("Time", W-235, H+7);
    text("PRETTY COOL HUH.", W, height-75);

    line(W, H-rad, W, H+rad);
    line(100, H, width-100, H);
    pushMatrix();
    translate(0, H);
    fill(255);
    stroke(255);
    for (int i = 0; i < width; i+=10)
      ellipse(i, sin(i/60)*rad, rad/10, rad/10); // "Hack" a sine wave by drawing a series of fixed circles.
    stroke(0);
    noFill();
    popMatrix();
  }

  if (gameState == 15) {

    text("Maybe you've seen this before.\nIt's also called a 'sine wave.'", W, 75);
    text("Let's learn more about it.", W, height-75);

    line(W, H-rad, W, H+rad);
    line(100, H, width-100, H);
    pushMatrix();
    translate(0, H);
    fill(255);
    stroke(255);
    for (int i = 0; i < width; i+=10)
      ellipse(i, sin(i/60)*rad, rad/10, rad/10);
    stroke(0);
    noFill();
    popMatrix();
  }

  if (gameState == 16) {

    text("'AMPLITUDE': the farthest\nvertical position from\nthe center (the radius\nof the circle).", W+75, 50);
    text("'FREQUENCY': the time it takes\nto complete one cycle ('round the circle).", W+75, height-75);

    // Note the frequncy:
    strokeWeight(2);
    line(W-100, H+200, W+250, H+200);
    line(W-100, H, W-100, H+200);
    line(W+250, H, W+250, H+200);

    // Note the amplitude:
    strokeWeight(2);
    line(W+150, H-5, W+150, H-rad);
    line(W+150, H-5, W+75, H-5);
    line(W+150, H-rad, W, H-rad);

    // Draw the axes:
    strokeWeight(5);
    line(W, H-rad, W, H+rad);
    line(100, H, width-100, H);

    // Draw the sine wave:
    pushMatrix();
    translate(0, H);
    fill(255);
    stroke(255);
    for (int i = 0; i < width; i+=10)
      ellipse(i, sin(i/60)*rad, rad/10, rad/10);
    stroke(0);
    noFill();
    popMatrix();
  }

  if (gameState == 17) {

    text("This is how sound works.\n\nThe amplitude is the volume of the sound.\nTaller waves are louder.\n\nThe frequency is the pitch of the sound.\nSkinnier waves are higher.", W, H-100);
  }

  if (gameState == 18) {

    text("Thanks for learning about oscillation!\n\n\nThe End", W, H-50);
  }
}

void keyPressed() {

  if (keyCode == LEFT) {
    if (gameState > 1) {
      gameState--; // Go back a screen.
    }
  }

  if (keyCode == RIGHT) {
    if (gameState < totalSlides) {
      gameState++; // Go forward a screen.
    }
  }
}



