
// Written 7/8/14 by Alek Zieba
// Definitely not the best-looking with so few methods but eh.

/////////////////////////////
// Handy variables
/////////////////////////////

// ints
int numberDots = 10;
int score = 0;
int textSize = 32;

// floats
float dotSize = 50;
float normalStroke = 1;
float pacmanSize = 200;
float pacmanX = pacmanSize/2;
float pacmanY;
float pacmanSpeed = 5;
float theta = PI/5;
float thetaIncrementor = PI/200;
float thetaMax = PI/4;
float thetaMin = PI/9;
float thetaPacStart = theta;
float thetaPacEnd = 2*PI - theta;

// colors
final color backgroundColor = color(0);
final color dotColor = color(255, 255, 255);
final color normalStrokeColor = color(0);
final color pacmanColor = color(255, 255, 0);
final color textColor = color(255, 255, 255);

// Strings
String winMessage = "You win!"; // NOT USED
String scoreMessage = "Score";

// Other
boolean[] dotVisible = new boolean[numberDots];

/////////////////////////////
// Execution
/////////////////////////////
// Housekeeping
void setup() {
  // Window settings.
  size(750, 750);
  background(backgroundColor);
  pacmanY = height/2;
  
  // Yellow pacman body
  fill(pacmanColor);
  arc(pacmanX, pacmanY, pacmanSize, pacmanSize, thetaPacStart, thetaPacEnd);
  
  // Make sure that all the dots are visible at the start.
  for (int i = 0; i < numberDots; i++) {
     dotVisible[i] = true; 
  }
}

// Looped
void draw() {
  // Reset the screen
  background(backgroundColor);
  
  // Let's makea somea dotsa.
  stroke(dotColor);
  strokeWeight(dotSize);
  for (int i = 0; i < numberDots; i++) {
    float dotX = i*width/numberDots;
    float dotY = height/2;
    
    // Remove a dot when we pass over it.
    if (dist(pacmanX, pacmanY, dotX, dotY) <= 100 && pacmanX > dotX + dotSize/2 && dotVisible[i]) {
      dotVisible[i] = false;
      displayWin();
    }
    if (dotVisible[i])
      point(dotX, dotY);
    
  }
  
  thetaPacStart += thetaIncrementor;
  thetaPacEnd -= thetaIncrementor;
  if (thetaPacStart >= thetaMax || thetaPacStart <= thetaMin) {
   thetaIncrementor *= -1; 
  }
  
  // Packity Man
  fill(pacmanColor);
  stroke(normalStrokeColor);
  strokeWeight(normalStroke);
  arc(pacmanX, pacmanY, pacmanSize, pacmanSize, thetaPacStart, thetaPacEnd);
  
  if (pacmanX > width + pacmanSize / 2) {
     pacmanX = -pacmanSize; 
  }
  
  // Score
  fill(textColor);
  textSize(textSize);
  // String.format wasn't working
  text(scoreMessage + ": " + Integer.toString(score), 100, 100); 
}

// Apparently drawing stops at 2*PI?
// User interaction via arrows.
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      pacmanY -= pacmanSpeed;
    } else if (keyCode == DOWN) {
      pacmanY += pacmanSpeed;
    } else if (keyCode == LEFT) {
      pacmanX -= pacmanSpeed;
    } else if (keyCode == RIGHT) {
      pacmanX += pacmanSpeed;
    }
  }
}

// Make sure we're in bounds
void mouseClicked() {
  // Do some trig.
  float distance = dist(pacmanX, pacmanY, mouseX, mouseY);
  if (distance <= 100) {
    float tanThetaMouse = (mouseY - pacmanY) / (mouseX - pacmanX);
    
    // Cache these later.
    float tanThetaStart = tan(thetaPacStart);
    float tanThetaEnd = tan(thetaPacEnd);
    if (mouseX >= 0) {
      if (!(tanThetaMouse < tanThetaStart && tanThetaMouse > tanThetaEnd)) {
         displayWin(); 
      }
    } else {
      displayWin();
    }
  }
}

// You win!
void displayWin() {
  score++;
  
  // Actually doesn't display win at the current moment.
}

















