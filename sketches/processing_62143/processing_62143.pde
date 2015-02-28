

float myCounter=0;
PFont myFont;
String[] firstLine;

void setup() {
  size(1000, 760);
  myFont = loadFont("Futura.vlw");
  textAlign(CENTER);
  smooth();
  firstLine = new String[8];
  firstLine[0]="Providence Mall.";
  firstLine[1]="One Way.";
  firstLine[2]="Left Hand Must Turn Left.";
  firstLine[3]="WISDOM BEINS BY REALIZING HOW LITTLE WE KNOW.";
  firstLine[4]="The Edna Lawrence Nature Lab.";
  firstLine[5]="Reserved for US Marshals.";
  firstLine[6]="Parking Permit Only.";
  firstLine[7]="Memorial Boulevard.";
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


