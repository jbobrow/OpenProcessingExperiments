
// these arrays store the properties for each particle
float[] xPos = new float[0];
float[] yPos = new float[0]; 
float[] xVel = new float[0]; 
float[] yVel = new float[0]; 
float[] partSize = new float[0];

void setup() { 
  size(600, 600);  
  noStroke();
}

void draw() { 

  background(0); 

  // make a new particle - 
  // in other words, add a property on to the end of 
  // each array for a new particle
  xPos = append(xPos, mouseX); 
  yPos = append(yPos, mouseY);
  xVel = append(xVel, random(-1, 1)); 
  yVel = append(yVel, random(-12, -6)); 
  partSize = append(partSize, random(6, 12)); 

  fill(255, 0, 0); 

  // go through each item in the arrays
  for (int i = 0; i<xPos.length; i++ ) {   

    // and draw a circle at the position specified 
    // in the xPos and yPos arrays. 
    ellipse(xPos[i], yPos[i], partSize[i], partSize[i]); 

    // add the velocity to the positions
    xPos[i] += xVel[i]; 
    yPos[i] += yVel[i]; 

    // add some gravity
    yVel[i]+=0.1;
    // make the particles shrink
    partSize[i] *= 0.99;
  }

  // if we have too many particles, then lose the oldest one
  if (xPos.length>200) { 
    xPos = subset(xPos, 1); 
    yPos = subset(yPos, 1); 
    xVel = subset(xVel, 1); 
    yVel = subset(yVel, 1); 
    partSize = subset(partSize, 1);
  }
}
