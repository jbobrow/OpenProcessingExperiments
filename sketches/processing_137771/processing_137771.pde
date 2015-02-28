
/*Final Project. "Think Outside the Box"
I wanted to draw an actual box in the middle of the canvas.
I also wanted to have the user be able to write thoughts
"outside" of that box. I put a thinking cloud picture in the top
right corner. The words and the box moves in relation to where 
the mouse position is. The font size varies with how long you
wait to type it. I put in two screenshot functions: one for left
click and one for right click. Enjoy!

*/

import processing.pdf.*;
import java.util.Calendar;

boolean doSave = false;

String textTyped = "Type slow and fast!";
float[] fontSizes = new float[textTyped.length()];
float minFontSize = 15;
float maxFontSize = 600;
float newFontSize = 0;

int pMillis;
float maxTimeDelta = 5000.0;

float spacing = 3; // line height
float tracking = 1; // between letters
PFont font;
//declare PImage variable
PImage thinkclouds;
//Setup
color strokeColor = color(0, 5);
//Setup
void setup(){
  size(800,800);
  colorMode(HSB, 500, 120, 120, 150);
  noFill();
  background(500); 
  font = createFont("Arial",10);
  thinkclouds= loadImage("ThinkClouds.jpeg");
}


//Draw Block
void draw(){
  if (doSave) beginRecord(PDF, timestamp()+".pdf");
  background(500);
  textAlign(LEFT);
  fill(0);
  noStroke();
  //Insert THinkCLouds image at the top right corner
  image(thinkclouds,0,0,300,300);
  spacing = map(mouseY, 0,height, 0,120);
  translate(0, 100+spacing);

  float x = 0, y = 0, fontSize = 20;

  for (int i = 0; i < textTyped.length(); i++) {
    // get fontsize for the actual letter from the array
    fontSize = fontSizes[i];
    textFont(font, fontSize);
    char letter = textTyped.charAt(i);
    float letterWidth = textWidth(letter) + tracking;
    
    if (x+letterWidth > width) {
      // start new line and add line height
      x = 0;
      y += spacing; 
    }
    
    // draw letter
    text(letter, x, y);
    // update x-coordinate for next letter
    x += letterWidth;
  }

  // blinking cursor after text
  float timeDelta = millis() - pMillis;
  newFontSize = map(timeDelta, 0,maxTimeDelta, minFontSize,maxFontSize);
  newFontSize = min(newFontSize, maxFontSize);

  fill(200, 20, 30);
  if (frameCount/10 % 2 == 0) fill(205);
  rect(x, y, newFontSize/2, newFontSize/20);


  if (doSave) {
    doSave = false;
    endRecord();
    saveFrame(timestamp()+"_##.png");
  }
//Draw the centerblock
stroke(strokeColor= color(355, 110, 110, 130));
strokeWeight(10);
fill(#140C0C);
rect(350,350,100,100);
stroke(strokeColor=color(200,120,110,145));
strokeWeight(2);
ellipse(width/2,height/2, 75, 75);
stroke(strokeColor=color(295,100,120,115));
strokeWeight(10);
point(width/2,height/2);
}

//MouseClick save screenshot
void mousePressed(){
  if (mouseButton==LEFT) saveFrame("screenshot.png");
  if (mouseButton==RIGHT) saveFrame("screenshot2.png");
}

void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case DELETE:
    case BACKSPACE:
      if (textTyped.length() > 0) {
        textTyped = textTyped.substring(0,max(0,textTyped.length()-1));
        fontSizes = shorten(fontSizes);
      }
      break;
      // disable those keys
    case TAB:
    case ENTER:
    case RETURN:
    case ESC:
      break;
    default:
      textTyped += key;
      fontSizes = append(fontSizes, newFontSize);
    }

    // reset timer
    pMillis = millis();
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



