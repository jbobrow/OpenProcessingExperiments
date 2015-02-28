
/* Project 3A: Transformation for DMA 28 Winter 11 by Faustine Chia 

Candy Love Letters 
Candy Heart Message Generator

a) CLICK Mouse: New Composition
  > Change Candy Heart & Background
b) TYPE Message: Limit 18 Characters
  > BACKSPACE = Delete Characters
c) ENTER: When Finished

*Repeat Steps a) to c) for new compositions :)

 */
 
PImage blueHeart, greenHeart, orangeHeart, pinkHeart, whiteHeart;
PImage bg1, bg2, bg3, bg4, bg5, bg6, bg7, bg8, bg9, bg10, bg11;
PShape heart1, pixelHeart;
color neonColor;

PFont errorFont, heartFont, font;
String displayText = "";
String currentInput = "";

int characterMax = 18;
boolean tooManyCharacters = false;

PImage[] bHeart;
PImage bHeart1;

int bgNum = 0;
int neon = 0;
float x, y, s, r;

PImage screen;


void setup() {

  size(640, 480);
  fill(255);
  noStroke();
  smooth();
  background(0);

  // Load Images
  blueHeart = loadImage ("Blue Heart.png"); 
  greenHeart = loadImage ("Green Heart.png"); 
  orangeHeart = loadImage ("Orange Heart.png"); 
  pinkHeart = loadImage ("Pink Heart.png"); 
  whiteHeart = loadImage ("White Heart.png"); 

  PImage[] b = {
    blueHeart, greenHeart, orangeHeart, pinkHeart, whiteHeart
  };
  bHeart = b;
  //  bHeart1 = bHeart[int(random(0, bHeart.length))];

  heart1 = loadShape ("heart1.svg");
  pixelHeart = loadShape ("pixel_heart.svg");

  bg1 = loadImage("bg1.jpg");
  bg2 = loadImage("bg2.jpg");
  bg3 = loadImage("bg3.jpg");
  bg4 = loadImage("bg4.jpg");
  bg5 = loadImage("bg5.jpg");
  bg6 = loadImage("bg6.jpg");
  bg7 = loadImage("bg7.jpg");
  bg8 = loadImage("bg8.jpg");
  bg9 = loadImage("bg9.jpg");
  bg10 = loadImage("bg10.jpg");
  bg11 = loadImage("bg11.jpg");

  // Load Font
  font = loadFont("MicrosoftSansSerif-48.vlw");
  textFont(font, 30);
  screen = generate();
}



void draw () {
  // display screenshot
  image(screen, 0, 0); 


  // candy heart
  image(bHeart1, 255,50);

  // Your Message:
    // Clear Text Box
    fill(255, 150);
    noStroke();
    rect(5, 392.5, 200, 35);
  fill(0);
  textAlign(LEFT);
  textSize(30);
  text("Your Message :", 10, 420);

  // Display Text
  fill(205, 54, 95);
  textAlign(CENTER);
  textSize(35);
  text(displayText, width/2+5, height/2-60, 200, 200); // (displayText, x, y, boxWidth, boxHeight)
 
  // Input Text
    // Text Box
    fill(255);
    noStroke();
    rect(width/2-95, 392.5, 325+20, 35);
  fill(240, 80, 103);
  textAlign(LEFT);
  textSize(25);
  text(currentInput, width/2-90, 420);

  // error message
  if (tooManyCharacters == true) {
    textSize(30);
    fill(255, 0, 255);
    text("LIMIT IS 18 CHARACTERS!!", 200, 460);
  }
}





// Clicking 
void mousePressed() {
  screen = generate();
  bHeart1 = bHeart[int(random(0, bHeart.length))];
  bgNum = int(random(0,11));
  neon = int(random(5));
  displayText = "";
}





// Typing 
void keyPressed() {
  tooManyCharacters = false;

  if(key == ENTER)
  {
    displayText = currentInput = currentInput + key;
    currentInput = "";
  }
  else if(key == BACKSPACE && currentInput.length() > 0)
  {
    currentInput = currentInput.substring(0, currentInput.length() - 1);
  }
  else
  {
    // check the length
    if (currentInput.length() < characterMax) {
      // if its less than, add the character
      currentInput = currentInput + key;
    } 
    else {
      // show the error
      tooManyCharacters = true;
    }
  }
} 





// screenshot
PImage generate() {
  background(255);

  // candy heart
  bHeart1 = bHeart[int(random(0, bHeart.length))];

  // background
  if (bgNum == 0) {
    image(bg1, 0, 0);
  }
  else if (bgNum == 1) {
    image(bg2, 0, 0);
  }
  else if (bgNum == 2) {
    image(bg3, 0, 0);
  }
  else if (bgNum == 3) {
    image(bg4, 0, 0);
  }
  else if (bgNum == 4) {
    image(bg5, 0, 0);
  }
  else if (bgNum == 5) {
    image(bg6, 0, 0);
  }
  else if (bgNum == 6) {
    image(bg7, 0, 0);
  }
  else if (bgNum == 7) {
    image(bg8, 0, 0);
  }
  else if (bgNum == 8) {
    image(bg9, 0, 0);
  }
  else if (bgNum == 9) {
    image(bg10, 0, 0);
  }
  else if (bgNum == 10) {
    image(bg11, 0, 0);
  }

  // ellipses
  strokeWeight(20);
  noFill();
  if (neon == 0) { 
    neonColor = color (0, 250, 126); //green
  } 
  else if (neon == 1) { 
    neonColor = color (2, 0, 223); //purple
  } 
  else if (neon == 2) { 
    neonColor = color (225, 238, 136); //yellow
  } 
  else if (neon == 3) { 
    neonColor = color (250, 66, 94); //red
  } 
  else if (neon == 4) { 
    neonColor = color (157, 188, 252); //blue
  }
  for(int i=0; i<15; i++) {
    stroke (neonColor);
    x = random(0, width);
    y = random(0, height);
    s = random(0.5, 0.8);
    ellipse(random(width), random(height), 50, 50);
  }

  // pixel hearts 
  shapeMode(CENTER);
  tint(random(0,255), random(0,255), random(0,255));
  for(int i=0; i<20; i++) {
    x = random(50, width-50);
    y = random(50, height-50);
    s = random(0.1, 0.5);
    r = random(0, PI/4);
    pushMatrix();
    translate(x, y);
    rotate(r);
    scale(s); 
    shape(pixelHeart, -pixelHeart.width/2, -pixelHeart.height/2);
    popMatrix();
  }

  // small heart 
  shapeMode(CENTER);
  tint(random(0,255), random(0,255), random(0,255));
  for(int i=0; i<15; i++) {
    x = random(50, width-50);
    y = random(50, height-50);
    s = random(0.2, 0.7);
    r = random(0, PI/4);
    pushMatrix();
    translate(x, y);
    rotate(r);
    scale(s); 
    shape(heart1, -heart1.width/2, -heart1.height/2);
    popMatrix();
  }  
  // take & return screenshot 
  tint(255);
  PImage img = get(0, 0, width, height);
  return img;
}


