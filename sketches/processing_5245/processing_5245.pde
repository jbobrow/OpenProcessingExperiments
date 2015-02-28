
class Bird extends Particle {
  float birdSize = 5.0;
  int currentFrame = int(random(0, birdImg.length));

  int frameCounter = currentFrame;
  float headAngle, colorR, colorG, colorB, tcR, tcG, tcB, curR, curG, curB;
  int birdNum, shapeNum;
  color birdColor;
  float colorSpd = 0.01;

  Bird(float ix, float iy, float spd, int n) {
    super(ix, iy, spd);
    birdNum = n;
    shapeNum = birdNum%numBirdShapes;
    colorR = min(random(144, birdNum%255), 255);  // Create random colors
    colorG = min(random(birdNum%144, 255), 255);
    colorB = min(random(144, 255), 255);
    tcR = colorR;
    tcG = colorG;
    tcB = colorB;
    curR = colorR;
    curG = colorG;
    curB = colorB;
    birdColor = color(colorR, colorG, colorB);
  }

  void update() {
    super.update();
    headAngle = atan2(dy, dx);        // Make 'heads' follow the cursor
  }

  void display() {
    currentFrame = (frameCounter/4)%numBirdImages;  // Create looping animation
    frameCounter++;
    pushMatrix();
    translate(x, y);
    rotate(headAngle);
    if (showSkin==1) {                  // Skin 1: PImage
      if (xDir > 0) {
        image(birdImg[currentFrame], 0, 0);  // Draw images
      } 
      else {
        pushMatrix();
        scale(1.0, -1.0);
        image(birdImg[currentFrame], 0, -birdImg[currentFrame].height); // Draw reflected images
        popMatrix();
      }
    } 
    else if (showSkin==2) {            // Skin 2: PShape
      pushMatrix();
      scale(birdSize/min(dist(x, y, mouseX, mouseY)+1, 10));
      rotate(-HALF_PI);
      shape(birdShape[shapeNum], 0, 0);// Draw shapes
      popMatrix();
    } 
    else {                             // Skin 3: drawing
      scale(birdSize);
      rotate(HALF_PI);
      if (mousePressed) {
        tcR = 255 - min(dist(x, y, mouseX, mouseY), 255);   // Make birds red
        tcG = 0;
        tcB = 0;
      } 
      else {
        tcR = colorR;     // Reset to previous color
        tcG = colorG;
        tcB = colorB;
      }
      curR += (tcR - curR)*colorSpd; 
      curG += (tcG - curG)*colorSpd; 
      curB += (tcB - curB)*colorSpd;
      birdColor = color(curR, curG, curB);
      fill(birdColor, 204);
      rect(0, 0, 5, 5);                // Draw birds
    }
    popMatrix();
  }
}






