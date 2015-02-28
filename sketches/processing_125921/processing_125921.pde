
String myText = "No Man's Land";

int[] xPosition = new int[50];
int[] yPosition = new int[50];

int[] xPosition1 = new int[50];
int[] yPosition1 = new int[50];

float[] xPositionArray = new float[myText.length()];

boolean mouseClicked;

void setup() {
  rectMode(CENTER);
  size(400, 400);
  PFont myFont = loadFont("Coda-Regular-65.vlw");
  textFont(myFont, 50); //Text Height sind 48px

  float _xPosition = 0;

  for (int i=0; i<myText.length(); i++) {
    xPositionArray[i] = _xPosition;
    _xPosition = _xPosition + textWidth(myText.charAt(i));
  }
}

void draw() {
  noStroke();
  background(200);
  translate(20, 0);
  rectMode(CENTER);

  fill(0, 10);
  for (int i= 0; i<xPosition.length; i++) {
    rect( xPosition[i], yPosition[i], 1000, 50);
  }

  fill(0, 255/6);
  for (int i= 0; i<xPosition.length; i++) {
    rect( xPosition1[i], yPosition1[i], 1000, 50);
  }

  for (int i=xPosition.length-1; i>0; i--) {
    xPosition[i] = xPosition[i-1];
    yPosition[i] = yPosition[i-1]+10;
  }

  for (int i=xPosition.length-1; i>0; i--) {
    xPosition1[i] = xPosition1[i-1];
    yPosition1[i] = yPosition1[i-1]-10;
  }

  xPosition[0] = mouseX-100;
  yPosition[0] = mouseY;

  xPosition1[0] = mouseX-100;
  yPosition1[0] = mouseY;

  for (int i=0; i<myText.length(); i++) {
    fill(i * 10);
    //text(myText.charAt(i), xPositionArray[i]+mouseX, mouseY);
    if (mousePressed) {
      text(myText.charAt(i), xPositionArray[i]+mouseX, mouseY+ (i % 2 == 0 ? 30 : -20));
    }
    else {
      text(myText.charAt(i), xPositionArray[i]+mouseX, mouseY);
    }
  }
}

