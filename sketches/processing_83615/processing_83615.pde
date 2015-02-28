
float[] xPos = new float[0];
float[] yPos = new float[0];
float[] xVel = new float[0];
float[] yVel = new float[0];
float[] partSize = new float[0];

void setup() {
  size(600, 400);

  noStroke();
}

void draw() {

  background(0);
  colorMode(HSB);

  //makes new particle
  xPos = append(xPos, mouseX);
  yPos = append(yPos, mouseY);
  xVel = append(xVel, random(-10, 2));
  yVel = append(yVel, random(-10, 2));
  partSize = append(partSize, random(0, 2));


 
  for (int i=0; i<xPos.length; i++) {
    fill(i%255, 255, 255);
    ellipse(xPos[i], yPos[i], partSize[i], partSize[i]);
    //rect(xPos[i], yPos[i], partSize[i], partSize[i]);

    xPos[i] += xVel[i];
    yPos[i] += yVel[i];

    yVel[i] +=0.1;
    //partSize[i] *=0.99;


    if (xPos[i] + partSize[i]>width) {
      xVel[i] = - xVel[i];
    }
    else if (xPos[i] - partSize[i]<0) {
      xVel[i] =- xVel[i];
    }
    
    if (yPos[i] + partSize[i]>height) {
      yVel[i] = - yVel[i];
    }
    else if (yPos[i] - partSize[i]<0) {
      yVel[i] =- yVel[i];
    }

  
}

    if (xPos.length >5000) {
      xPos = subset(xPos, 1);
      yPos = subset(yPos, 1);
      xVel = subset(xVel, 1);
      yVel = subset(yVel, 1);
      partSize = subset(partSize, 1);
    }
  }
  

void mousePressed(){
  xPos  = new float[0];
  yPos  = new float[0];
  xVel  = new float[0];
  xVel  = new float[0];
}


