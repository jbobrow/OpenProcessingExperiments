
//import processing.opengl.*;

float myCounter=0;
PFont myFont;
String[] firstLine;

void setup() {
  size(1024, 768);
  myFont = loadFont("Futura.vlw");
  textAlign(CENTER);
  smooth();
  firstLine = new String[8];
  firstLine[0]="ALL THIS HAPPENED, MORE OR LESS.";
  firstLine[1]="LOLITA, LIGHT OF MY LIFE, FIRE OF MY LOINS.";
  firstLine[2]="SOMEONE MUST HAVE SLANDERED JOSEF K., FOR ONE MORNING, WITHOUT HAVING DONE ANYTHING TRULY WRONG, HE WAS ARRESTED.";
  firstLine[3]="IT IS A TRUTH UNIVERSALLY ACKNOWLEDGED, THAT A SINGLE MAN IN POSSESSION OF A GOOD FORTUNE MUST BE IN WANT OF A WIFE.";
  firstLine[4]="THE NELLIE, A CRUISING YAWL, SWUNG TO HER ANCHOR WITHOUT A FLUTTER OF THE SAILS, AND WAS AT REST.";
  firstLine[5]="CALL ME ISHMAEL.";
  firstLine[6]="MISS BROOKE HAD THAT KIND OF BEAUTY WHICH SEEMS TO BE THROWN INTO RELIEF BY POOR DRESS.";
  firstLine[7]="RIVERRUN, PAST EVE AND ADAM'S.";
}

void draw() {
  background(#245C54);
  doSpinText(0, 335, 98, .4, #FFCA8E);
  doSpinText(1, 198, 58, -.3, #FFCA8E);
  doSpinText(2, 250, 22, -.2, #EDA062);
  doSpinText(3, 273, 28, -.1, #FF4000);
  doSpinText(4, 300, 42, .1, #EDA062);
  doSpinText(7, 141, 62, .2, #FF4000);
  doSpinText(6, 415, 36, -.15, #E57734);
  doSpinText(5, 98, 46, -.4, #E57734);
}

void doSpinText(int myText, int myRadius, int fontSize, float txtSpeed, color myCol) {
  float arclength = 0;
  myCounter=myCounter+sin(frameCount*0.00225);
  textFont(myFont, fontSize);
  float startPos=radians(myText*25)+PI;
  for (int i = 0; i < firstLine[myText].length(); i++)
  {
    char currentChar = firstLine[myText].charAt(i);
    float w = textWidth(currentChar);
    arclength += w/2.52;
    float theta = radians(myCounter*txtSpeed) + startPos + arclength / myRadius;    

    pushMatrix();
    translate(820, 450);
    // Polar --> cartesian
    translate(myRadius*cos(theta), myRadius*sin(theta));
    rotate(theta+HALF_PI);
    fill(myCol);
    text(currentChar, 0, 0);
    popMatrix();
    arclength += w/2.52;
  }
}


