
int[] xPosition = new int[50];
int[] yPosition = new int[50];
float r = random(255);

void setup() {
  size (640, 400);
  //background(#DE102F);
  //noStroke();
  //strokeWeight(30);
  smooth();
}

void draw() {

  background(#DE102F);
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  for (int i=1; i<xPosition.length; i++) {
    strokeWeight(1);
    stroke(0);

    line(xPosition[i-1], yPosition[i-1], xPosition[1], yPosition[1]);

    // einfache Linie zeichnen
    line(xPosition[i-1], yPosition[i-1], xPosition[i], yPosition[i]);
  }

  for (int i=xPosition.length-1; i>0; i--) { 
    xPosition[i] = xPosition[i-1];
    yPosition[i] = yPosition[i-1];
  }

  xPosition[0] = mouseX;
  yPosition[0] = mouseY;
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  noStroke();
  fill(255);
  ellipse(x, y, speed, speed);

  strokeWeight(speed / 2);
  stroke(#980921, speed * 100);
  fill(#980921, speed * 2);
  //noFill();
  ellipse(x, y, 30, 30);
}

