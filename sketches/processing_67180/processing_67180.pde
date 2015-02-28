
/*Homework for august 9th -- Make a sketch that utilizes at least 2 arrays, 
as well as mouse or key input, where the values in those arrays affect 
what's going on onscreen. (You'll probably be using if-statements.) 
The lightbulb example that we did in class is an example of this.

What I want to do: A person blowing on a pinwheel (one of those thingies that spin
in the wind that looks like the translate spinner we made today). The way that it 
will look like the wind is blowing is by making lines that turn on and off based on if the array
is on isShowing or not. So it will create movement of the breath being blown... hopefully
that works! */

PImage skygrass;
PImage girlblow;
PFont font;

int[] linex1 = {
  249, 327, 403, 477, 543
};
int[] linex2 = {
  296, 380, 452, 524, 555
}; 

boolean [] isShowing = new boolean[5];
boolean isSpinning;

float angle;

/*since i only have 3 y coordinates, I'm just going to leave these out
 int y1;
 int y2;
 int y3;
 int y4;
 int y5;
 int y6;
 int y7;
 */

void setup() {
  size(750, 453);
  skygrass = loadImage("skygrass.jpg");
  girlblow = loadImage("girlblow.png");
  imageMode(CORNER);
  smooth();

  font = loadFont("GillSans-36.vlw");

  angle = 0;

  //make sure none of the blows are showing yet

  for (int i = 0; i<5; i++) {
    line(linex1[i], 374, linex2[i], 374);
    line(linex1[i], 391, linex2[i], 391);
    line(linex1[i], 408, linex2[i], 408); 
    isShowing[i] = false;
  }

  isSpinning = false;
}

void draw() {
  image(skygrass, 0, 0);
  image(girlblow, 20, 236);
  strokeWeight(4);

  text("Count to 4 using your keyboard.", 75, 100);

  //pinwheel staying still
  rect(643, 374, 4, 30);
  pushMatrix();
  translate(643, 374);
  rect(0, 0, 4, 30);
  rotate(angle);
  fill(5, 44, 255);
  ellipse(-50, 0, 90, 60);
  fill(121, 5, 255);
  ellipse(50, 0, 90, 60);
  fill(255, 5, 14);
  ellipse(0, -50, 60, 90);
  fill(255, 135, 5);
  ellipse(0, 50, 60, 90);
  fill(225, 255, 5);
  ellipse(0, 0, 10, 10);
  popMatrix();


  for (int i = 0; i<5; i++) {
    if (isShowing[i] == true) {
      line(linex1[i], 374, linex2[i], 374);
      line(linex1[i], 391, linex2[i], 391);
      line(linex1[i], 408, linex2[i], 408);
    }
  }

  if (isShowing[3] == true) {
    isSpinning = true;
  } 
  else {
    isSpinning = false;
  }

  if (isSpinning == true) {
    angle+=.5;
  }
}

void keyPressed() {
  if (key == '1') {
    if (isShowing[0] == true) {
      for (int i = 0; i < 4; i++) {
        isShowing[i] = false;
      }
    }

    isShowing[0] = true;
  }

  if (key == '2') {
    isShowing[1] = true;
  }
  if (key == '3') {
    isShowing[2] = true;
  }
  //for this part, how do I make the pinwheel stay there??
  if (key == '4') {
    isShowing[3] = true;
  }
}

