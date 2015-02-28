
float [] xPosition = new float[0];
float [] yPosition = new float[0];

void setup() {
  size(600, 600, P3D);
  frameRate(60);
}



void draw() {
  background(0);
  noFill();
  noStroke();
 colorMode(HSB);

  xPosition = append(xPosition, mouseX);  
  yPosition = append(yPosition, mouseY); 

  for (int i=0; i<xPosition.length; i++) {
    stroke(i, 200, 200);
    ellipse(xPosition[i], yPosition[i], 200-i, 200-i);
  }

  if (xPosition.length>200) {
    xPosition = subset(xPosition, 1);
    yPosition = subset(yPosition, 1);
  }
}



