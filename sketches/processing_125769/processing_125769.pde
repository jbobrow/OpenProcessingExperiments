
int[] xPosition = new int[50];
int[] yPosition = new int[50];

int[] xPosition1 = new int[50];
int[] yPosition1 = new int[50];

int[] xPosition2 = new int[50];
int[] yPosition2 = new int[50];


void setup() {
  size(400, 400);
}

void draw() {
  background(255/2);
  fill(255, 20);
  noStroke();
  rectMode(CENTER);

  for (int i= 0; i<xPosition.length; i++) {
    ellipse( xPosition[i], yPosition[i], pow(i,2), 40);
  }

  for (int i=xPosition.length-1; i>0; i--) {
    xPosition[i] = xPosition[i-1]+10;
    yPosition[i] = yPosition[i-1]+10;
  }

  for (int i=xPosition1.length-1; i>0; i--) {
    xPosition1[i] = xPosition1[i-1]-10;
    yPosition1[i] = yPosition1[i-1]+10;
  }

  for (int i=xPosition2.length-1; i>0; i--) {
    xPosition2[i] = xPosition2[i-1]-5;
    yPosition2[i] = yPosition2[i-1]-10;
  }

  xPosition[0] = mouseX+30;
  yPosition[0] = mouseY;

  xPosition1[0] = mouseX - 50;
  yPosition1[0] = mouseY/2+100;

  xPosition2[0] = mouseX/2;
  yPosition2[0] = mouseY - 50;

  fill(0, 10);
  for (int i= 0; i<xPosition.length; i++) {
    rect( xPosition1[i], yPosition1[i], 40, 40);
  }

  fill(255, 10);
  for (int i= 0; i<xPosition.length; i++) {
    rect( xPosition2[i], yPosition2[i], 100, pow(i,2));
  }
}

