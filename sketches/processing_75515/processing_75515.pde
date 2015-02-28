
final int buttonDia = 100;
final int buttonCenterX = 100;
final int buttonCenterY = 100;

float fiveSecond01 = 0.0;
int clickTime = 0;
boolean buttonClicked = false;
color buttonFill = color(111, 255, 255, 0);
color darkState = color(0, 130);

PImage fuse; //declare the images
PImage bulb;
PImage flare;

void setup() {
  size(500, 500) ;
  smooth();
  colorMode(HSB);//rainbows are easy
  noStroke();
  noFill();

  fuse = loadImage("http://www.trdpartsonline.com/images/IEC FUSE 193,195 SERIES.jpg") ;
  bulb = loadImage("http://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Gluehlampe_01_KMJ.png/200px-Gluehlampe_01_KMJ.png");
  flare = loadImage("http://i.imgur.com/AbwLK.png");//Holy hotlinking batman
}

void draw() {
  image(fuse, 0, 0, width, height);
  image(bulb, 380, 300, 100, 165);


  if (mousePressed && !buttonClicked) {//If the button is unclicked, and the mouse is pressed
    int xxx = mouseX;//store values. needed?
    int yyy = mouseY;
    if (dist(xxx, yyy, buttonCenterX, buttonCenterY) < buttonDia/2) { //is on button??
      clickTime = millis(); //store millis
      buttonClicked = true;
    }
  }

  else if (buttonClicked && millis()-clickTime<5000) { //This executes while the button is ellapsing

    buttonFill = color(255, 255);
    fiveSecond01 = map(millis()-clickTime, 0, 5000, 0, 1);//this guy goes from 0-1 as the timer elapses
    darkState = color(0, map(fiveSecond01, 0, 1, 111, 0)); //how dark should it be?
    stroke(22, 255, 255, 255*fiveSecond01); //Make the coil warmer....
    strokeCap(SQUARE) ; //hard edges
    strokeWeight(20); //thick and meaty
    line(188, 333, 347, 153);//actual line
    image(flare, 428-143/2, 356-93/2, 133, 115);
    if (fiveSecond01 > 0.82) { //This is the part where the fuse burns.
      image(flare, 296-145/2, 217-93/2, 133, 115); //BOOM.
    }
  }
  else if (buttonClicked && millis()-clickTime>5000) { //all things must end. after 5 sec, the button is made to be unclicked
    buttonClicked = false;
    fiveSecond01 = 0.0; // all is undone
  }

  else if (!buttonClicked) { //rest state
    buttonFill = color(frameCount%5, 255, 255); //button let's you know it is ready
  }

  fill(darkState);
  noStroke();
  rect(0, 0, width, height);

  lightSwitch(); //makes sure this is on top.
}


void lightSwitch() {//pretty power button
  noStroke();
  strokeCap(ROUND);
  noFill();
  pushMatrix();
  translate(buttonCenterX, buttonCenterY);
  rotate(map(fiveSecond01, 0, 1, 0, TWO_PI));//spin it with the timer
  strokeWeight(5) ;
  stroke(0);
  fill(buttonFill);
  ellipse(0, 0, buttonDia, buttonDia);
  noFill();
  arc(0, 0, .6*buttonDia, .6*buttonDia, radians(-55), radians(235));
  line(0, -5, 0, -38);
  popMatrix();
}

