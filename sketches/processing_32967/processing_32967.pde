
PImage heyBubble;
PImage backgroundImage;
PFont smallTalkFont;
float xPos=100;
float yPos=100;
int heyBubbleRadius=50; //because the image is 100 pixels
boolean isGoingRight=true;
boolean isGoingDown=true;


void setup() {
  size (600,400);
  smooth();
  backgroundImage = loadImage("background.gif");
  heyBubble=loadImage("hey.png");
  imageMode(CENTER);
  smallTalkFont=loadFont("Helvetica-Bold-48.vlw");
  fill(0);
  textFont(smallTalkFont,60);
  
}

void draw() {
 
  background(255,255,255);
  text("SMALL TALK",16,380);
  image(backgroundImage,300,200);
  image(heyBubble, xPos, yPos);

  if (isGoingRight) {
    xPos+=2;
  }
  else {
    xPos-=2;
  }

  //this is if it hits the right side
  if (xPos+heyBubbleRadius >= width) {
    isGoingRight=false;
  }

  //this is if it hits the left side
  if (xPos-heyBubbleRadius <= 0) {
    isGoingRight=true;
  }


  //Y POSITION
  //this is for the bottom side
  if (isGoingDown) {
    yPos+=2;
  }
  else {
    yPos-=2;
  }

  //this is if it hits the bottom side
  if (yPos+heyBubbleRadius >= height) {
    isGoingDown=false;
  }

  //this is if it hits the top side
  if (yPos-heyBubbleRadius <= 0) {
    isGoingDown=true;
  }
  
}

