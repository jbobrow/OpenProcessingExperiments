
float innerRad = 54;
float outerRad = 150;
int gameState;

PFont font;
PImage hulagirl;

void setup() {
  size(454, 340);
  smooth();
  hulagirl = loadImage("hulagirl.jpg");
  background(hulagirl);
  gameState = 0;
}

void draw() {
  if (gameState == 0) {

    //Move the origin to the center of the hula girl
    translate(206, 77);

    for (int deg = int(random(50, 120)); deg < 120; deg+=10) {
      float angle = radians(deg);
      float x1 = cos(angle) * innerRad;
      float y1 = sin(angle) * innerRad;
      float x2 = cos(angle) * outerRad;
      float y2 = sin(angle) * outerRad;


      //Change color of Skirt

      if ((keyPressed == true) && (key == 'a'))
      {
        stroke(random(100, 255), random (0, 50), random (0, 50));
        line(x1, y1, x2, y2);
        line(x1, y1, x2, y2);
      }
      else if ((keyPressed == true) && (key == 'b'))
      {
        stroke(random(0, 50), random (100, 255), random (0, 50));
        line(x1, y1, x2, y2);
      }
      else if ((keyPressed == true) && (key == 'c'))
      {
        stroke(random(0, 50), random (100, 150), random (150, 255));
        line(x1, y1, x2, y2);
      }
      else if ((keyPressed == true) && (key == '1'))
      {
        noStroke();
        fill(random(0, 50), random(100, 255), random (100, 255));
        ellipse(x1, y1, 5, 5);
      }
      else if ((keyPressed == true) && (key == '2'))
      {
        noStroke();
        fill(random(100, 255), random(0, 255), random (100, 255));
        ellipse(x1*2, y1*2, 5, 5);
      }
      else if ((keyPressed == true) && (key == '3'))
      {
        noStroke();
        fill(random(100, 255), random(100, 255), random (0, 255));
        ellipse(x2, y2 + 2, 5, 5);
      }
    }
  }
  if (gameState == 1) {
    //Move the origin to the center of the hula girl
    translate(206, 77);
    frameRate(10);

    for (int deg = int(random(50, 120)); deg < 120; deg++) {
      float angle = radians(deg);
      float x1 = cos(angle) * innerRad;
      float y1 = sin(angle) * innerRad;
      float x2 = cos(angle) * outerRad;
      float y2 = sin(angle) * outerRad;
      outerRad = outerRad + .0025;

      stroke(random(220, 245), random(200, 220), random(140, 160));
      line(x1, y1, x2, y2);
    }
  }
}

void keyPressed() {
  if (key == 32) {
    gameState++;
    if (gameState > 1) {
      gameState = 0;
    }
  }
}


