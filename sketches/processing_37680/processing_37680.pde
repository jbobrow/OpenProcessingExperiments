
class Particle {
  float radiusIncre, xPosIncre, yPosIncre, colorIncre, xTargetIncre, yTargetIncre;
  float radiusTime, xPosTime, yPosTime, redTime, greenTime, blueTime, xTargetTime, yTargetTime;
  float radiusRange, xPosRange, yPosRange, colorRange, xTargetRange, yTargetRange;
  float radiusV, xPosV, yPosV, redV, greenV, blueV, xTargetV, yTargetV, xOffsetV, yOffsetV;
  float accelerateV;
  float lineWeight;
  Particle() {
    radiusTime = random(100);
    xTargetTime = random(100);
    xPosTime = random(100);
    yTargetTime = random(100);
    yPosTime = random(100);
    redTime = random(100);
    greenTime = random(100);
    blueTime = random(100);
    xPosRange = width;
    xTargetRange = width;
    yPosRange = height;
    yTargetRange = height;
    radiusRange = width/3;
    colorRange = 255;
    xPosIncre = yPosIncre = radiusIncre = colorIncre = 0.01;
    xTargetIncre = yTargetIncre = 0.005;
    xPosV = width/2;
    yPosV = height/2;
    accelerateV = 100;
    lineWeight = random(10);
  }
  void run() {
    xTargetV = noise(xTargetTime)*xTargetRange;
    yTargetV = noise(yTargetTime)*yTargetRange;
    xPosV += (xTargetV-xPosV)/accelerateV;
    yPosV += (yTargetV-yPosV)/accelerateV;
    redV = noise(redTime)*1.8*colorRange;
    greenV = noise(greenTime)*1.8*colorRange;
    blueV = noise(blueTime)*1.8*colorRange;
    xOffsetV = (noise(xPosTime)-0.5)*xPosRange;
    yOffsetV = (noise(yPosTime)-0.5)*yPosRange;
    radiusV = noise(radiusTime)*noise(radiusTime)*noise(radiusTime)*radiusRange;
  }
  void display() {
    stroke(random(100,255), random(200,255), random(0,100));
    strokeWeight(lineWeight);
    beginShape();
    vertex(xTargetV,yTargetV);
    vertex((xTargetV+xPosV)/2, (yTargetV+yPosV)/2);
    endShape();
    strokeWeight(0.5);
    fill(redV, greenV, blueV);
    ellipse(xPosV+xOffsetV, yPosV+yOffsetV, radiusV*0.8, radiusV*0.8);
    
  }
  void update() {
    xTargetTime += xTargetIncre;
    yTargetTime += yTargetIncre;
    xPosTime += xPosIncre;
    yPosTime += yPosIncre;
    radiusTime += radiusIncre;
    redTime += colorIncre;
    greenTime += colorIncre;
    blueTime += colorIncre;
  }
}

void mousePressed(){
  background(255);
}


