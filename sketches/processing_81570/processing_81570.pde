
// MODIFIED BY JAKE OLIVEIRA
// 
// CEDIT TO: Benedikt Gross
//
// http://www.generative-gestaltung.de
//
/**
 * 
 * MOUSE
 * drag                : draw with text
 */

float x = 0, y = 0;
float stepSize = 5.0;

PFont font;
String letters = "Mr. Fantastic";
int fontSizeMin = 3;
float angleDistortion = 0.0;

int counter = 0;


void setup() {
  // use full screen size 
  size(400, 500);
  background(190, 190, 190);
  smooth();
  cursor(CROSS);

  x = mouseX;
  y = mouseY;

  //font = createFont = CHOOSING THE FONT TO TYPESET IN
  font = createFont("Helvetica",10);
  textFont(font,fontSizeMin);
  textAlign(LEFT);
  fill(0);


  /*
  // load an image in background
   PImage img = loadImage(selectInput("select a background image"));
   image(img, 0, 0, width, height);
   */
}


void draw() {
  if (mousePressed) {
    float d = dist(x,y, mouseX,mouseY);
    textFont(font,fontSizeMin+d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x); 

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize; 
    }
  }
}


void mousePressed() {
  x = mouseX;
  y = mouseY;
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == DELETE || key == BACKSPACE) background(255);
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


















