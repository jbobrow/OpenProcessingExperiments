
/* REPEAT
 Use a nested loop structure to create a dense pattern that responds subtly to the
 position of the mouse.
 
 Response.
 This REPEAT function is a simulation of a groovin' Disco. The cursor
 location affects three different aspects of the sketch, two of which belong to the
 dense pattern, the other belonging to the dance pattern:
 1) the disco ball follows the cursur 1:1. There is a gradient on the disco ball that
 depends on its distance from the cursor itself, with a slight color shimmer.
 2) the randomized colors are more vibrant near the disco ball -- they dull slightly further away.
 3) the dancers, who look suspiciously like the dancers from saturday night fever,
 glide toward the disco ball as they groove out.
 */

// These variables are the ones that affect the dense pattern.
float distance;
float strokeColor; // i originally was using stroke, not fill. the name stuck.
float shapeSize;
int distanceMod; // converts distance from cursor into a color gradient.
float sizeDistRatio;

// I added text to the bottom.
PFont discoFont;
PFont discoFont2;

// Then I added dancers.
int danceX;
int danceOffset;
int danceV;

int danceFrame = 0;
int frame = 0;
int numDanceFrames = 2;
PImage[] danceGuy = new PImage[numDanceFrames];
PImage[] danceGirl = new PImage[numDanceFrames];

void setup()
{
  size(800,400);
  smooth();
  stroke(255);
  noStroke();

  shapeSize = 8;

  distanceMod = 5; // the higher the #, the smaller the disco ball.
  sizeDistRatio = 0.9;

  discoFont = loadFont("VisitorTT2BRK-72.vlw");
  discoFont2 = loadFont("VisitorTT2BRK-36.vlw");
  textAlign(CENTER);

  frameRate(30);
  imageMode(CENTER);
  danceGuy[0] = loadImage("DanceGuy-1.gif");
  danceGuy[1] = loadImage("DanceGuy-2.gif");
  danceGirl[0] = loadImage("DanceGirl-1.gif");
  danceGirl[1] = loadImage("DanceGirl-2.gif");

  danceX = width/2;
  danceOffset = 20;
  danceV = 4;
}

void draw()
{
  background(0);

  frame++;

  for(int i = 10; i<=height-1; i += 10)
  {
    for(int j = 10; j <= width-1; j+= 10)
    {
      distance = dist(mouseX, mouseY, j, i);
      strokeColor = distance * distanceMod;

      if(strokeColor > 255) {
        // fancy maths! linear interpolation for gradient intensity. original is commented out. modified one in use.
        fill(random(-0.3*distance + 310),random(-0.3*distance + 310),random(-0.3*distance + 310));
//        fill(random(-0.5125*distance + 280.625),random(-0.5125*distance + 280.625),random(-0.5125*distance + 280.625));
        shapeSize = 8;
      }
      else {
        float mouseDistance = dist(mouseX,mouseY, j, i);
        shapeSize = (1 - (mouseDistance/255))*15;
        fill(300 - strokeColor/2 + random(50),300 - strokeColor/2 + random(50),300 - strokeColor/2 + random(50),255);
      }

      if (i > (height - 120)) {
        rect(j-shapeSize/2,i-shapeSize/2,shapeSize,shapeSize);
      }
      else {
        ellipse(j,i,shapeSize,shapeSize);
      }
    }
  }

  if (frame <= 10) {
    danceFrame = 0;
  }
  else if (frame > 20) {
    danceFrame = 0;
    frame = 0;
  }
  else {
    danceFrame = 1;
  }

  if (round(mouseX - danceX) > danceV) {
    danceX += danceV;
  }
  else if (round(mouseX - danceX) < -danceV) {
    danceX -= danceV;
  }

  image(danceGuy[danceFrame], danceX + danceOffset, (height - 130));
  image(danceGirl[danceFrame], danceX - danceOffset, (height - 127), 26, 42);

  fill(255);
  textFont(discoFont);
  text("DISCO PARTY!", 0, height - 100, width, 72);

  textFont(discoFont2);
  text("BOOTS SKIRTS BOOTS SKIRTS", 0, height - 60, width, 72);
}


