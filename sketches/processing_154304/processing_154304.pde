
// Written 7/8/14 by Alek Zieba
// Just having fun with polka dots.

/////////////////////////////
// Handy variables
/////////////////////////////
// The oh-so-ever important...
final int windowSize = 500;

// State stuff
final int ATTRACT_LOOP = 0;
final int GAME = 1;
int state = GAME;

// ints
final int numDots = 500;
final int textSize = 32;

// colors
final color backgroundColor = color(255, 0, 200);
// final color ballColor = color(100, 255, 100);
color[] ballColor = new color[numDots];
final color blackHoleColor = color(0);

// floats
final float ballSize = 20;
final float blackHoleGravitationalConstant = 0.03;
final float blackHoleSize = 50;
float blackHoleX;
float blackHoleY;
float blackHoleVelocityX;
float blackHoleVelocityY;
float[] dotX = new float[numDots];
float[] dotY = new float[numDots];
final float eventHorizon = 100;
final float titleX = windowSize/2;
final float titleY = windowSize/2;
float[] velocityX = new float[numDots];
float[] velocityY = new float[numDots];

// Strings
final String title = "v- Space -v";


/////////////////////////////
// Begin Execution
/////////////////////////////

// Called Once
void setup() {
  size(windowSize, windowSize);
  background(backgroundColor);

  // Set up the dots
  for (int i = 0; i < numDots; i++) {
    resetStar(i);
  }
  
  // Set the black hole.
  resetBlackHole();
}

// Looped
void draw() {
  background(backgroundColor);
  if (state == ATTRACT_LOOP) {
    textAlign(CENTER);
    textSize(textSize);
    text(title, titleX, titleY);
  } else if (state == GAME) {
    // game
    strokeWeight(ballSize);

    for (int i = 0; i < numDots; i++) {

      // Color each ball differently so we cna actually see them
      stroke(ballColor[i]);

      dotX[i] += velocityX[i];
      dotY[i] += velocityY[i];
      point(dotX[i], dotY[i]);

      if (dotX[i] > width + ballSize/2 ||
        dotX[i] < -ballSize/2 ||
        dotY[i] > height + ballSize/2 ||
        dotY[i] < -ballSize/2) {
        // Basically reset everything
        resetStar(i);
      }

      if (dist(blackHoleX, blackHoleY, dotX[i], dotY[i]) <= eventHorizon) {

        ballColor[i] = blackHoleColor;

        if (dist(blackHoleX, blackHoleY, dotX[i], dotY[i]) <= blackHoleSize - ballSize/2) {
          dotX[i] = blackHoleX;
          dotY[i] = blackHoleY;
          velocityX[i] = 0;
          velocityY[i] = 0;
        } else {
          velocityX[i] += blackHoleGravitationalConstant * (blackHoleX - dotX[i]);
          velocityY[i] += blackHoleGravitationalConstant * (blackHoleY - dotY[i]);
        }
      }
    }

    // Draw the hole of blackness
    stroke(blackHoleColor);
    strokeWeight(blackHoleSize);
    point(blackHoleX, blackHoleY);

    blackHoleX -= blackHoleVelocityX;
    blackHoleY += blackHoleVelocityY;

    // If you change blackHoleSize to ballSize, the black hole explodes when you reach the bounds.
    if (blackHoleX < -blackHoleSize/2 ||
        blackHoleY > height + blackHoleSize/2 ||
        blackHoleY < -blackHoleSize/2) {
          
        resetBlackHole();
    }
  }
}

// Detect keyboard input
void keyPressed() {
  //if (state == ATTRACT_LOOP) {
  //  if (key == ' ') {
  //    state = GAME;
  //  }
  //} else if (state == GAME) {
  //  if (key == ' ') {
  //    state = ATTRACT_LOOP;
  //  }
  //}
}

// Reset a star's properties
void resetStar(int position) {
  dotX[position] = -ballSize/2 - random(width);
  dotY[position] = random(height);
  velocityX[position] = random(5);
  velocityY[position] = random(-5, 5);
  ballColor[position] = color(random(25, 255), random(25, 255), random(25, 255));
}

// Reset the black hole.
void resetBlackHole() {
  blackHoleVelocityX = random(5);
  blackHoleVelocityY = random(-5, 5);
  blackHoleX = windowSize + blackHoleSize/2;
  blackHoleY = random(windowSize);
}


