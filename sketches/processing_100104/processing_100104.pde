

import java.util.*;

int numPred = 2;  //  controls initial number of worms
int reproduced = 0;
float minPredSize = .07;  //  bounds for the worm's size
float maxPredSize = .55;
float predSize = random(minPredSize, maxPredSize);
float medianSpeed = .07;
float minSpeed = medianSpeed - medianSpeed/1.1;
float maxSpeed = medianSpeed + medianSpeed/1.1;
float speed = random(minSpeed, maxSpeed);
float speedSum = 0;
float initialAvg;
float avgSpeed;
ArrayList predList;

int numPrey = 4;  //  controls initial number of amoeba
int minPreyPopulation = 3;  // the prey population will never drop below this number
float minPreySize = .05;  //  bounds for the amoeba size
float maxPreySize = .3;
float preyMovement = .0090;  //  higher values increase the speed of amoeba movement
ArrayList preyList;

void setup() {
  size(720, 720);
  smooth();
  noStroke();
  rectMode(CENTER);
  frameRate(30);

  //  initialize the prey and predators
  preyList = new ArrayList();
  for (int i = 0; i < numPrey; i++) {
    preyList.add(new Prey(random(680), random(680), 30, 30, preyMovement, random(minPreySize, maxPreySize)));
  }
  predList = new ArrayList();
  for (int i = 0; i < numPred; i++) {
    predList.add(new Mover(random(680), random(680), speed, predSize, numPrey, preyList));
    speedSum += speed;
    avgSpeed = speedSum/predList.size();
    initialAvg = avgSpeed;
  }
}

void draw() {
  background(255);

  for (int i = 0; i < preyList.size(); i++) {  //  show prey in preyList
    Prey prey = (Prey) preyList.get(i);
    prey.display();
  }

  for (int i = 0; i < predList.size(); i++) {   //  show worms in predList
    Mover pred = (Mover) predList.get(i);
    pred.eat();
    pred.display();
    if (pred.timeLeftAlive == 0) {  //  removes the worm from the array if it dies
      predList.remove(i);
    }
    if (pred.predSize >= maxPredSize) {  //  if a worm gets big enough, it creates 2 more worms and dies
      medianSpeed = speed;
      minSpeed = medianSpeed - medianSpeed/1.1;
      maxSpeed = medianSpeed + medianSpeed/1.1;
      speed = random(minSpeed, maxSpeed);
      speedSum += speed;
      reproduced += 1;
      predList.add(new Mover(pred.x-100, pred.y-50, speed, .2, numPrey, preyList));
      predList.add(new Mover(pred.x+100, pred.y+50, speed, .2, numPrey, preyList));
      predList.remove(i); 
      avgSpeed = speedSum/(numPred+reproduced);
    }
    if (preyList.size() < minPreyPopulation) {  //  prevents the prey population from dipping too low
      preyList.add(new Prey(random(680), random(680), 30, 30, preyMovement, random(minPreySize, maxPreySize)));
      preyList.add(new Prey(random(680), random(680), 30, 30, preyMovement, random(minPreySize, maxPreySize)));
    }
  }
  fill(255, 0, 0, 70);
  rect(660, 44, 65, 30);
  fill(0);
  text("Start Over", 633, 48);
  text("Initial average speed: " + initialAvg, 15, 25);
  text("Average speed of all worms: " + avgSpeed, 15, 45);
  text("TrevPhil", 650, 710);
}

void mousePressed() {
  if (mouseX >= (660-32.5) && mouseX <= (660+32.5) && mouseY >= (44-15) && mouseY <= (44+15)) {  // creates 2 worms if they all die; resets prey speed variables
    predList.clear();
    predSize = random(minPredSize, maxPredSize);
    medianSpeed = .07;
    minSpeed = medianSpeed - medianSpeed/1.1;
    maxSpeed = medianSpeed + medianSpeed/1.1;
    speed = random(minSpeed, maxSpeed);
    speedSum = 0;
    reproduced = 0;
    for (int i = 0; i < numPred; i++) {
      predList.add(new Mover(random(680), random(680), speed, predSize, numPrey, preyList));
      speedSum += speed;
      avgSpeed = speedSum/predList.size();
      initialAvg = avgSpeed;
    }
  }
}


class Amoeba {
  float x;
  float y;
  float x1;
  float x2;
  float x3;
  float x4;
  float y2;
  float y3;
  float spot1x = random(x1+23, (x1+x4)/2 - 23);
  float spot1y = random(y-37, y+37);
  float spot2x = random((x1+x4)/2 - 23, x4-23);
  float spot2y = random(y-77, y+77);
  float spot1Rotate = random(PI/7, PI/3);
  float spot2Rotate = random(PI/7, PI/3);
  float xoff = 0;
  float yoff = 0;
  float ciliaOff = 0;
  float xScale;
  float yScale;
  float ciliaScale;

  Amoeba() {
  }

  void display(float x, float y) {
    this.x = x;
    this.y = y;
    xScale = .0700;  //  the noise() function creates motion for both cilia and the amoeba's main body
    yScale = .0700;
    ciliaScale = .0100;
    xoff += xScale;
    yoff += yScale;
    ciliaOff += ciliaScale;
    x1 = x-100;
    x2 = x1+noise(xoff)*80;
    x3 = x2 + 160;
    x4 = x+100;
    y2 = noise(yoff)*80-360;
    y3 = y2;
    fill(89, 167, 78, 70);
    stroke(0);
    strokeWeight(2);
    bezier(x1, y, x2, y+y2, x3, y+y3, x4, y);
    bezier(x1, y, (x1-x2)+x1, y-y2, (x4-x3)+x4, y-y3, x4, y);

    int steps = 35;  // draws cilia on 1/2 of the amoeba
    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float xB = bezierPoint(x1, x2, x3, x4, t);
      float yB = bezierPoint(y, y+y2, y+y3, y, t);
      if (xB > (x1+x4)/2) {
        line(xB, yB, xB+15, yB-noise(ciliaOff)*random(-40, 40));
      } else {
        line(xB, yB, xB-15, yB-noise(ciliaOff)*random(-40, 40));
      }
    }
    for (int i = 0; i <= steps; i++) {  // draws cilia on the other 1/2 of the amoeba
      float t = i / float(steps);
      float xB2 = bezierPoint(x1, (x1-x2)+x1, (x4-x3)+x4, x4, t);
      float yB2 = bezierPoint(y, y-y2, y-y3, y, t);
      if (xB2 > (x1+x4)/2) {
        line(xB2, yB2, xB2+18, yB2-noise(ciliaOff)*random(-40, 40));
      } else {
        line(xB2, yB2, xB2-18, yB2-noise(ciliaOff)*random(-40, 40));
      }
    }
    pushMatrix();  // each amoeba gets 2 randomly rotated and randomly placed ovals
    translate(spot1x+x, spot1y+y);
    rotate(spot1Rotate);
    ellipse(0, 0, 40, 80);
    popMatrix();
    pushMatrix();
    translate(spot2x+x, spot2y+y);
    rotate(spot2Rotate);
    ellipse(0, 0, 25, 35);
    popMatrix();
  }
}


class Mover {
  float x;
  float y;
  float speed;
  float right;
  float left;
  float down;
  float up;
  float predSize;
  float timeLeftAlive;
  float angle;
  float[] distance;
  float minDist;
  int rightUsage = 1;
  int leftUsage = 1;
  int downUsage = 1;
  int upUsage = 1;
  int numPrey;
  int closestPrey;
  ArrayList preyList = new ArrayList();
  Worm w1 = new Worm();

  Mover(float x, float y, float speed, float predSize, int numPrey, ArrayList preyList) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.predSize = predSize;
    timeLeftAlive = 1000*predSize;
    this.numPrey = numPrey;
    this.preyList = preyList;
  }

  float computeDistance() {  //  this VERY IMPORTANT method finds the closest prey and its location within the ArrayList
    distance = new float[preyList.size()];
    for (int i = 0; i < preyList.size(); i++) {
      Prey p = (Prey) preyList.get(i);
      distance[i] = dist(p.x, p.y, x, y);
      if (minDist == dist(p.x, p.y, x, y)) {
        closestPrey = preyList.indexOf(p);
      }
    }
    if (preyList.isEmpty() == false) {
      minDist = min(distance);
    } else {
      minDist = 0;
    }
    return minDist;
  }

  int move(int usage1, int usage2, float temp1) {  //  test to see if the predator got closer or not
    float temp2 = computeDistance();
    if (temp2 < temp1) {
      usage1++;
      usage2 = 1;
    } else {
      usage1 = 1;
      usage2++;
    }
    return usage1;
  }

  void display() {
    PVector oldPosition = new PVector(x, y);
    right = computeDistance();  //  each direction is iterated more or less times depending on whether it helps the worm get closer to its prey
    for (int i = 0; i < rightUsage; i++) {
      x += speed;
    }
    rightUsage = move(rightUsage, leftUsage, right);
    left = computeDistance();
    for (int i = 0; i < leftUsage; i++) {
      x -= speed;
    }
    leftUsage = move(leftUsage, rightUsage, left);
    down = computeDistance();
    for (int i = 0; i < downUsage; i++) {
      y += speed;
    }
    downUsage = move(downUsage, upUsage, down);
    up = computeDistance();
    for (int i = 0; i < upUsage; i++) {
      y -= speed;
    }
    upUsage = move(upUsage, downUsage, up);

    pushMatrix();
    translate(x, y);
    scale(predSize);
    computeDistance();  //  the worm will always face its closest prey
    if (minDist != 0) {
      Prey faceMe = (Prey) preyList.get(closestPrey);
      angle = atan2(faceMe.y-oldPosition.y, faceMe.x-oldPosition.x);
      rotate(angle);
    }
    w1.display(timeLeftAlive);
    popMatrix();
    if (timeLeftAlive > 0) {  //  a worm is always losing its 'life' in time
      timeLeftAlive--;
    } else {
      timeLeftAlive = 0;
    }
  }

  void eat() {
    for (int i = 0; i < preyList.size(); i++) {  // a prey is removed if it intersects a worm, and the worm gains both size and 'life'
      Prey p = (Prey) preyList.get(i);
      if (x >= p.x-p.w/2 && x <= p.x+p.w/2 && y >= p.y-p.h/2 && y <= p.y+p.h/2) {
        if (predSize <= .55) {
          predSize += p.preySize/3;
        }
        timeLeftAlive += 500*p.preySize;
        preyList.remove(i);
      }
    }
  }
}


class Prey {
  float x;
  float y;
  float w;
  float h;
  float xoff;
  float yoff;
  float xScale;
  float yScale;
  float preyMovement;
  float preySize;
  float angle = 0;
  Amoeba a1 = new Amoeba();

  Prey(float xoff, float yoff, float w, float h, float preyMovement, float preySize) {
    this.xoff = xoff;
    this.yoff = yoff;
    this.w = w;
    this.h = h;
    this.preyMovement = preyMovement;
    this.preySize = preySize;
  }

  void display() {
    PVector oldPosition = new PVector(x, y);  //  used in conjunction with newPosition to determine the angle of rotation
    xScale = preyMovement;  //  create random movement
    yScale = preyMovement;
    xoff += xScale;
    yoff += yScale;
    x = noise(xoff)*(width+50);
    y = noise(yoff)*(height+50);
    PVector newPosition = new PVector(x, y);
    pushMatrix();
    translate(x, y);
    rotate(PI/2);
    scale(preySize);
    angle = atan2(newPosition.y-oldPosition.y, newPosition.x-oldPosition.x);  //  the prey will face the direction its moving
    rotate(angle);
    a1.display(0, 0);
    popMatrix();
  }
}


class Worm {
  float x1 = 50*cos(11*PI/6);  //  these variables are for the bezier curve of the head
  float x2 = x1 - 60;
  float x3 = x1 - 60;
  float x4 = 50*cos(PI/6);
  float y1 = 50*sin(11*PI/6);
  float y2 = y1 + 5;
  float y4 = 50*sin(PI/6);
  float y3 = y4 - 5;

  float angle = 0;
  float theta = 0;
  float amplitude = 20;
  float period = 250;
  float dx = (TWO_PI / period);
  float[] yvalues = new float[420];

  Worm() {
  }

  void display(float headColor) {  //  head color goes from green to purple as the worm dies
    pushMatrix();
    theta += .5;
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {  // the worm has an oscillating tail made up of an array of ever-shortening lines
      yvalues[i] = sin(x)*amplitude;
      x+=dx;
      float myVar = yvalues[i]+30-(i/8);
      stroke(180, 104, 9, 90);
      line(-i-10, yvalues[i]-30, -i-10, myVar);
    }
    beginShape();
    angle = atan2(-yvalues[1], 64);  //  the head also rotates to create the illusion of wiggling
    rotate(angle);
    noStroke();
    fill(150, headColor, 150);
    vertex(x1, y1);
    bezierVertex(x2, y2, x3, y3, x4, y4);  // these curves create the head/mouth
    bezierVertex(x4-150, y4+110, x1-150, y1-110, x1, y1);
    endShape();
    popMatrix();
  }
}



