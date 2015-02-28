
int numOfBins = 5;
int binSize = 60;
int binDist = binSize;
int turn = 0;
int dir = 0;

int displayData = 1;

float startPoint;
bin[] bins = new bin[numOfBins];
PVector[] prevBins = new PVector[numOfBins];
float[] binDists = new float[numOfBins];
float[] binDists1 = new float[numOfBins];
float[] binDists2 = new float[numOfBins];
float[] binDists3 = new float[numOfBins];



color carColour = color(255, 0, 0);
int stupidCount = 0;

PVector zeroVec = new PVector(0, 0);

void setup() {
  size(600, 480,P2D);
  //frame.setLocation(0, -100);
  smooth();
  frameRate(10);
  background(255); 
  startPoint = width*0.5 - binDist*(numOfBins - 1)*0.5;
  for (int i = 0; i < numOfBins; i++) {
    bins[i] = new bin(new PVector(startPoint + i*binDist, height/2), i);
    prevBins[i] = new PVector(startPoint + i*binDist, height/2);
    binDists[i] = 0.0;
    binDists1[i] = 0.0;
    binDists2[i] = 0.0;
    binDists3[i] = 0.0;
  }
  rectMode(CENTER);
}

void draw() {
  //stupidCount++;
  if (stupidCount >170) {
    startPoint = width*0.5 - binDist*(numOfBins - 1)*0.5;
    for (int i = 0; i < numOfBins; i++) {
      binDists[i] = 0.0;
      bins[i].resetPos(i);
    }
  }

  noCursor();
  background(255);

  //  findWheels();
  //  updateBin();
  //  updateWheels();
  for (int i = 0; i < numOfBins; i++) {
    if (bins[i].pos.x > width || bins[i].pos.x < 0 || bins[i].pos.y > height || bins[i].pos.y < 0) {
      startPoint = width*0.5 - binDist*(numOfBins - 1)*0.5;
      bins[i] = new bin(new PVector(startPoint + i*binDist, height/2), i);
      binDists[i] = 0.0;
      //fixPos = 0;
      //foundWall = 0;
      stupidCount = 0;
    }

    //binDists[i] = dist(bins[i].pos.x,bins[i].pos.y,mouseX,mouseY);
    binDists[i] = dist(0, bins[i].pos.y, 0, height);
    binDists1[i] = dist(0, bins[i].pos.y, 0, 0);
    binDists2[i] = dist(bins[i].pos.x, 0, width, 0);
    binDists3[i] = dist(bins[i].pos.x, 0, 0, 0);
  }
  
  for (int i = 0; i < numOfBins; i++) {
    //    if (binDists[i] < 100) {
    //      bins[i].pos.x += (bins[i].pos.x - mouseX)/100;
    //      bins[i].pos.y += (bins[i].pos.y - mouseY)/100;
    //    }





    if(bins != null) bins[i].display();
    
    //stroke((255/numOfBins)*bins[i].id, 255 - 255/numOfBins*bins[i].id, random(0, 255));
    stroke((255/numOfBins)*bins[i].id,0, random(0, 255));
    strokeWeight(2);
    
    //fill((255/numOfBins)*bins[i].id, 255 - 255/numOfBins*bins[i].id, random(0, 255));
    line(bins[i].pos.x, bins[i].pos.y,prevBins[i].x,prevBins[i].y);
    bins[i].bTurn = turn;
     
    bins[i].bDir = dir;
    stroke(0);
    strokeWeight(1);
    prevBins[i] = bins[i].pos.get();
    
  }

  fill(0);
  //ellipse(mouseX,mouseY,20,20);
  vLine(new PVector(mouseX +20, mouseY), new PVector(mouseX -20, mouseY));
  vLine(new PVector(mouseX, mouseY +20), new PVector(mouseX, mouseY -20));
  int num = 20;
  strokeWeight(2);
  line(num, height - num, width-num, height - num);
  line(num, num, num, height - num);
  line(num, num, width-num, num);
  line(width-num, num, width-num, height - num);
  strokeWeight(1);
  
  //saveFrame("anim01-####.png");
}

class bin {
  PVector pos;
  PVector direction, dirV, dirU;
  int bTurn;
  int bDir;
  int bSize = 60;
  int carSize = 20;
  int haltF = 0;
  int turnSide = 0;
  int goFront = 0;
  int foundWall = 0;
  int fixPos = 0;
  int buffer = 0;
  int goF = 0;
  int goB = 0;
  int goL = 0;
  int goR = 0;
  int id;
  float angle = 0;
  float accel = 0;
  float maxAngle = radians(10);
  float maxAccel = 3;
  float rotFactor = .003;  // FACTOR OF ROTATION
  float accFactor = 0.5;   // FACTOR OF ACCELERATION
  float sR;
  float S0V;
  float S1V;
  float S2V;
  float S3V;
  int wheelReachV = 12;
  int wheelReachU = 7;
  PVector FL = new PVector(0, 0);
  PVector FR = new PVector(0, 0);
  PVector BL = new PVector(0, 0);
  PVector BR = new PVector(0, 0);
  PVector[] wheelPos = new PVector[4];
  PVector[] wheelRot = new PVector[2];
  PVector[] wheelAccel = new PVector[2];
  sensor [] sensors = new sensor[4];
  bin(PVector p, int ident) {
    id = ident;
    pos = p.get();
    direction = new PVector(0, 1);


    for (int i = 0; i<4; i++) {
      wheelPos[i] = zeroVec.get();
    }
    for (int i = 0; i<2; i++) {
      wheelRot[i] = zeroVec.get();
    }
    for (int i = 0; i<4; i++) {
      sensors[i] = new sensor(id, 0, 0, zeroVec.get(), zeroVec.get());
    }
  }


  void buildBin() {
  
    dirV = direction.get();
    dirV.mult(wheelReachV);
    dirU = direction.get();
    dirU.mult(wheelReachU);
 //   
    rotate2D(dirU,PI*0.5);
   
    for(int i = 0; i < numOfBins; i++) {
      if(i != id) {
        //text(str(PVector.dist(pos,bins[i].pos)),pos.x,pos.y,60,60);
        if(PVector.dist(pos,bins[i].pos) < binSize) {
          PVector v1 = new PVector((pos.x+bins[i].pos.x)/2,(pos.y+bins[i].pos.y)/2);
          v1.sub(pos);
          v1.mult(-1);
          v1.normalize();
          pos.add(v1);
        }
      }
    }
    
    placeSensors();

    turnWheels();
    accelWheels();

    turnBin();
    moveBin();

    findWheels();
    FL = new PVector(pos.x + bSize*0.4375, pos.y - bSize*0.4375);
    FR = new PVector(pos.x + bSize*0.4375, pos.y + bSize*0.4375);
    BL = new PVector(pos.x - bSize*0.4375, pos.y - bSize*0.4375);
    BR = new PVector(pos.x - bSize*0.4375, pos.y + bSize*0.4375);
  }
  void placeSensors() {
  
    for (int i = 0; i<4; i++) {
      sensors[i].bCen = zeroVec.get();
      sensors[i].pos = zeroVec.get();
    }
    
    PVector sPos = direction.get();
    sPos.mult(carSize);
    sensors[0] = new sensor(id, 2000, 1, pos.get(), sPos);

    rotate2D(sPos,radians(20));
    sensors[1] = new sensor(id, 600, -1, pos.get(), sPos);
    sPos = direction.get();
    
    sPos.mult(carSize);
    rotate2D(sPos,radians(-20));
    sensors[2] = new sensor(id, 600, -1, pos.get(), sPos);


    sPos = direction.get();
    sPos.mult(carSize);
    rotate2D(sPos,radians(180));
    sensors[3] = new sensor(id, 1000, -1, pos.get(), sPos);
  }
  void sensePos() {

    sR = sensors[0].iDist;
    S0V =sensors[1].iDist;
    S1V =sensors[2].iDist;
    S2V =sensors[3].iDist;
    //S3V =sensors[4].iDist;

    //if (sR < 80 || S0V < 90 || S1V < 80 || S2V < 80) {
    if (sR <80) {
      halt();
      haltF = 1;
    } 
    else {
      moveF();
      haltF = 0;
}

if (S2V < 80) goFront = 1;
else goFront = 0;

carColour = color(255, 0, 0); 
int dimFactor = 2;

if (sR < 120 && foundWall == 0 && fixPos == 0) { 
  carColour = color(255, 255, 0); 
  buffer += 1*dimFactor;
  if (buffer >30) {
    foundWall = 1;
    fixPos = 0;
  }
  if (S0V <= sensors[1].sens && S1V > sensors[2].sens) {
    turnSide = -1;
  } 
  else if (S0V > sensors[1].sens && S1V <= sensors[2].sens) {
    turnSide = 1;
  } 
  else { 
    turnSide = -1 + round(random(0, 1))*2;
  }
  goB = 55;
  //goB = 49;
}
if (foundWall == 1 && fixPos == 0) {
  if (goFront == 0) {
    carColour = color(0, 255, 0);
    switch(turnSide) { 
    case 1:
      moveBR();
      break;
    case 0:
      moveB();
      break;
    case -1:
      moveBL();
      break;
    }
    goB -= 1;
    if (buffer != 0 && goB < buffer) {
      buffer -=1;
    }

    if (goB == 0) {
      fixPos = 1;
      foundWall = 0;
      goF = 55;
    }
  } 
  else {
    goB = 0;
    fixPos = 1;
    foundWall = 0;
    goF = 10;
  }
}  

if (foundWall == 0 && fixPos == 1) {
  if (haltF == 0) {
    carColour = color(0, 0, 255);
    goB = 0;
    buffer = 0;
    switch(turnSide) { 
    case 1:
      moveFL();
      break;
    case 0:
      moveF();
      break;
    case -1:
      moveFR();
      break;
    }

    goF -= 1;
    if (goF == 0) {
      fixPos = 0;
    }
  } else {
    goF = 0;
    fixPos = 0;
  }
}
}
void turnBin() {
  rotate2D(direction,angle);
  //println(direction);
}
void moveBin() {
  pos.add(wheelAccel[1]);
  rotate2D(direction,angle);
}
void properPosition() {

  wheelPos[0].add(pos);
  wheelPos[1].add(pos);
  wheelPos[2].add(pos);
  wheelPos[3].add(pos);

  wheelRot[0].add(pos);
  wheelRot[1].add(pos);

  wheelAccel[0].add(pos);

  wheelAccel[1].add(pos);
}

void findWheels() {
  for (int i = 0; i<4; i++) {
    wheelPos[i] = zeroVec.get();
  }
  wheelPos[0].add(dirV);
  wheelPos[0].add(dirU);
  wheelPos[1].add(dirV);
  wheelPos[1].sub(dirU);
  wheelPos[2].sub(dirV);
  wheelPos[2].add(dirU);
  wheelPos[3].sub(dirV);
  wheelPos[3].sub(dirU);


  wheelRot[0] = direction.get();
  wheelRot[0].mult(10);
  wheelRot[0].add(wheelPos[0]);
  rotate2D(wheelRot[0],angle);

  wheelRot[1] = direction.get();
  wheelRot[1].mult(10);
  wheelRot[1].add(wheelPos[1]);
  rotate2D(wheelRot[1],angle);

  angle = 0;

  wheelAccel[0].add(wheelPos[2]);
  wheelAccel[1].add(wheelPos[3]);
}

void turnWheels() {

  if (bTurn == 1 && dir != 0 && angle <= maxAngle) {
    angle += dir*bTurn*2*rotFactor;
  }
  if (bTurn == -1 && dir != 0 && angle >= -maxAngle ) {
    //angle += turn*rotFactor*(maxAngle - angle);
    angle += dir*bTurn*3*rotFactor;
    //println("beep" + angle);
  }
  if (angle > maxAngle) {
    angle = maxAngle;
  }
  if (angle < -maxAngle) {
    angle = -maxAngle;
  }
  if (bTurn == 0 && angle < -rotFactor) {
    angle += rotFactor;
  } 
  else  if (bTurn == 0 && angle > rotFactor) {
    angle -= rotFactor;
  } 
  else if (bTurn == 0) {
    angle = 0;
  }
  //println(angle);
}
void accelWheels() {
  if (bDir == 1 && accel < maxAccel) {
    accel += bDir*accFactor;
  }
  if (bDir == -1 && accel > -maxAccel ) {
    accel += bDir*accFactor;
  }
  if (bDir == 0 && accel < 0) {
    accel += accFactor;
  }
  if (bDir == 0 && accel > 0) {
    accel -= accFactor;
  }

  wheelAccel[0] = direction.get();
  wheelAccel[0].mult(accel);
  wheelAccel[1] = direction.get();
  wheelAccel[1].mult(accel);
}
void resetPos(int i) {
  pos = new PVector(startPoint + i*binDist, height/2);
  fixPos = 0;
  foundWall = 0;
  stupidCount = 0;
}
void display() {

  sensePos();
  buildBin();
  properPosition();   
  fill(150, 100);
  //ellipse(pos.x, pos.y, bSize, bSize);

  fill(carColour);
  vCircle(pos, carSize);
  for (int i = 0; i<4; i++) {
    vCircle(wheelPos[i], 10);
    sensors[i].display();
  }
  vLine(wheelPos[0], wheelRot[0]);
  vLine(wheelPos[1], wheelRot[1]);
  vLine(wheelPos[2], wheelAccel[0]);
  vLine(wheelPos[3], wheelAccel[1]);
  vLine(FR,FL);
  vLine(FR,BR);
  vLine(BL,FL);
  vLine(BL,BR);
  fill(0);
  //text(str(id), pos.x, pos.y, 80, 80);
}
}
void keyPressed() {
  switch(key) {
  case ' ':
    startPoint = width*0.5 - binDist*(numOfBins - 1)*0.5;
    for (int i = 0; i < numOfBins; i++) {
      bins[i].resetPos(i);
      binDists[i] = 0.0;
    }
    break;

  case 'w':
  case 'W':
    dir = 1;
    break;

  case 'a':
  case 'A':
    turn = -1;
    break;

  case 's':
  case 'S':
    dir = -1;
    break;
  case 'd':
  case 'D':
    turn = 1;
    break;

  case 'f':
  case 'F':
    bins[0].direction.x += 10;
    break;
  case 'u':
  case 'U':
    displayData +=1;
    if(displayData > 1) displayData = 0;
    break;
  }
}
void keyReleased() {
  switch(key) {
  case 'w':
  case 'W':
  case 's':
  case 'S':
    dir = 0;
    break;

  case 'a':
  case 'A':
  case 'd':
  case 'D':
    turn = 0;
    break;
  }
}
void vLine(PVector v1, PVector v2) {
  if (displayData == 1) {
    line(v1.x, v1.y, v2.x, v2.y);
  }
}
void vCircle(PVector v1, float s) {
  if (displayData == 1) {
  ellipse(v1.x,v1.y,s,s);
  }
}
PVector lineInt(PVector v1, PVector v2, PVector v3, PVector v4) {
  float x1 = v1.x;
  float y1 = v1.y;
  float x2 = v2.x;
  float y2 = v2.y;
  float x3 = v3.x;
  float y3 = v3.y;
  float x4 = v4.x;
  float y4 = v4.y;

  float bx = x2 - x1;
  float by = y2 - y1;
  float dx = x4 - x3;
  float dy = y4 - y3; 
  float b_dot_d_perp = bx*dy - by*dx;
  if (b_dot_d_perp == 0) {
    return null;
  }
  float cx = x3-x1; 
  float cy = y3-y1;
  float t = (cx*dy - cy*dx) / b_dot_d_perp; 

  return new PVector(x1+t*bx, y1+t*by);
}


// Line Segment Intersection

//PVector segIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) 
PVector segInt(PVector v1, PVector v2, PVector v3, PVector v4) {
  float x1 = v1.x;
  float y1 = v1.y;
  float x2 = v2.x;
  float y2 = v2.y;
  float x3 = v3.x;
  float y3 = v3.y;
  float x4 = v4.x;
  float y4 = v4.y;
  
  float bx = x2 - x1; 
  float by = y2 - y1; 
  float dx = x4 - x3; 
  float dy = y4 - y3;
  float b_dot_d_perp = bx * dy - by * dx;
  if (b_dot_d_perp == 0) {
    return null;
  }
  float cx = x3 - x1;
  float cy = y3 - y1;
  float t = (cx * dy - cy * dx) / b_dot_d_perp;
  if (t < 0 || t > 1) {
    return null;
  }
  float u = (cx * by - cy * bx) / b_dot_d_perp;
  if (u < 0 || u > 1) { 
    return null;
  }
  return new PVector(x1+t*bx, y1+t*by);
}
void moveFL() {
  dir = 1;
  turn = 1;
}
void moveF() {
  dir = 1;
  turn = 0;
}

void moveFR() {
  dir = 1;
  turn = -1;
}

void moveBL() {
  dir = -1;
  turn = 1;
}
void moveB() {
  dir = -1;
  turn = 0;
}
void moveBR() {
  dir = -1;
  turn = -1;
}
void halt() {
  dir = 0;
  dir = 0;
}class sensor {
  int sens = 0;
  int type = 0;
  PVector bCen;
  PVector pos;
  PVector iPoint = new PVector(width*2, height*2);
  float iDist;
  int id;
  sensor(int ident, int s, int t, PVector b, PVector p) {
    id = ident;
    sens = s;
    type = type;
    bCen = b.get();
    pos = p.get();
  }

  void display() {
    stroke(0, 100);

    PVector ext = pos.get();
    ext.normalize();
    ext.mult(sens/5);
    pos.normalize();
    //pos.mult(40);
    pos.add(bCen);
    ext.add(bCen);
    vLine(ext, pos);
    stroke(0);
    int num = 20;
    PVector cV1, cV2, compareV1, compareV2;


    cV1 = new PVector(num, height - num);
    cV2 = new PVector(width-num, height - num);

    compareV1 = segInt(pos, ext, cV1, cV2);
    compareV2 = iPoint.get();
    if (compareV1 != null) {
      compareV1.sub(pos);
      compareV2.sub(pos);
      if (compareV2.mag() > compareV1.mag()) {
        iPoint = compareV1.get();
        iPoint.add(pos);
      }
    }

    cV1 = new PVector(num, num);
    cV2 = new PVector(num, height - num);
    compareV1 = segInt(pos, ext, cV1, cV2);
    compareV2 = iPoint.get();
    if (compareV1 != null) {
      compareV1.sub(pos);
      compareV2.sub(pos);
      if (compareV2.mag() > compareV1.mag()) {
        iPoint = compareV1.get();
        iPoint.add(pos);
      }
    }

    cV1 = new PVector(num, num);
    cV2 = new PVector(width-num, num);
    compareV1 = segInt(pos, ext, cV1, cV2);
    compareV2 = iPoint.get();
    if (compareV1 != null) {
      compareV1.sub(pos);
      compareV2.sub(pos);
      if (compareV2.mag() > compareV1.mag()) {
        iPoint = compareV1.get();
        iPoint.add(pos);
      }
    }

    cV1 = new PVector(width-num, num);
    cV2 = new PVector(width-num, height - num);
    compareV1 = segInt(pos, ext, cV1, cV2);
    compareV2 = iPoint.get();
    if (compareV1 != null) {
      compareV1.sub(pos);
      compareV2.sub(pos);
      if (compareV2.mag() > compareV1.mag()) {
        iPoint = compareV1.get();
        iPoint.add(pos);
      }
    }

    cV1 = new PVector(mouseX +20, mouseY);
    cV2 = new PVector(mouseX -20, mouseY);
    compareV1 = segInt(pos, ext, cV1, cV2);
    compareV2 = iPoint.get();
    if (compareV1 != null) {
      compareV1.sub(pos);
      compareV2.sub(pos);
      if (compareV2.mag() > compareV1.mag()) {
        iPoint = compareV1.get();
        iPoint.add(pos);
      }
    }

    cV1 = new PVector(mouseX, mouseY +20);
    cV2 = new PVector(mouseX, mouseY -20);
    compareV1 = segInt(pos, ext, cV1, cV2);
    compareV2 = iPoint.get();
    if (compareV1 != null) {
      compareV1.sub(pos);
      compareV2.sub(pos);
      if (compareV2.mag() > compareV1.mag()) {
        iPoint = compareV1.get();
        iPoint.add(pos);
      }
    }
    for (int i = 0; i < numOfBins; i++) {
      if (i != id) {
        

        
        
        cV1 = bins[i].FR.get();
        cV2 = bins[i].FL.get();
        compareV1 = segInt(pos, ext, cV1, cV2);
        compareV2 = iPoint.get();
        if (compareV1 != null) {
          compareV1.sub(pos);
          compareV2.sub(pos);
          if (compareV2.mag() > compareV1.mag()) {
            iPoint = compareV1.get();
            iPoint.add(pos);
          }
        }

        cV1 = bins[i].FR.get();
        cV2 = bins[i].BR.get();
        compareV1 = segInt(pos, ext, cV1, cV2);
        compareV2 = iPoint.get();
        if (compareV1 != null) {
          compareV1.sub(pos);
          compareV2.sub(pos);
          if (compareV2.mag() > compareV1.mag()) {
            iPoint = compareV1.get();
            iPoint.add(pos);
          }
        }

       
        cV1 = bins[i].BL.get();
        cV2 = bins[i].FL.get();
        compareV1 = segInt(pos, ext, cV1, cV2);
        compareV2 = iPoint.get();
        if (compareV1 != null) {
          compareV1.sub(pos);
          compareV2.sub(pos);
          if (compareV2.mag() > compareV1.mag()) {
            iPoint = compareV1.get();
            iPoint.add(pos);
          }
        }
       
        cV1 = bins[i].BL.get();
        cV2 = bins[i].BR.get();
        compareV1 = segInt(pos, ext, cV1, cV2);
        compareV2 = iPoint.get();
        if (compareV1 != null) {
          compareV1.sub(pos);
          compareV2.sub(pos);
          if (compareV2.mag() > compareV1.mag()) {
            iPoint = compareV1.get();
            iPoint.add(pos);
          }
        }
      }
    }
    noStroke();
    vCircle(iPoint, 10);
    stroke(0);
    iDist = 0;
    iPoint.sub(pos);
    if (iPoint.mag() < sens/5) {
      iDist = iPoint.mag();
    }
    else {
      iDist = width*height;
    }
  }
}
void rotate2D(PVector v, float theta) {
  float xTemp = v.x;
  v.x = v.x*cos(theta) - v.y*sin(theta);
  v.y = xTemp*sin(theta) + v.y*cos(theta);
}
