
PFont talkFont;
PFont elseFont;
int colorCounter = 0;
boolean mouseOnRight=false;

PImage socks = loadImage("socks.png");
PImage speechbubble = loadImage("speechbubble.png");



void setup() {
  size(605, 605);
  talkFont = loadFont("Pacifico-26.vlw");
  elseFont = loadFont("Helvetica-26.vlw");
}

void draw() {
  imageMode(CENTER);
  image(socks, width/2, height/2);
  smooth();
  image(speechbubble, width/2, height/2);

  if (mouseX > 350 && mouseX < 486 && mouseY < 485 && mouseY > 392) {
    
    image(socks, width/2, height/2);
    image(speechbubble, width/2, height/2);
    textFont(talkFont);
    fill(255);
    text("I'm hungry!", 410, 100);
    PImage food = loadImage("food.png");
    image(food, width/2, height/2);
  }

  else {
    fill(255);
    textFont(elseFont);
    text("Hi! I'm Socks", 410, 100);
    text("Wever!", 410, 130);
  }

}

void mouseDragged() {
  
  //Code help credit: Juan
  image(socks, width/2, height/2);
  image(speechbubble, width/2, height/2);
  fill(colorCounter, colorCounter, colorCounter); //sets color based on colorCounter
  textFont(talkFont);
  text("Prrrrr....", 410, 100);
  colorCounter+=5;
  if (colorCounter == 255) {
    colorCounter = 0;
  }
}


