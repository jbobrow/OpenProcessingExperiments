
/*@pjs preload="face.jpg";*/

//Raven Kwok (aka Guo Ruiwen)
//pikaworms
/*
 
raystain@gmail.com
ravenkwok.com
vimeo.com/ravenkwok
flickr.com/photos/ravenkwok
twitter.com/ravenkwok
weibo.com/ravenkwok
 
*/

ArrayList pikachus;
PImage faceTxt;

void setup() {

  size(600, 338, P3D);
  frameRate(30);

  faceTxt = loadImage("face.jpg");

  pikachus = new ArrayList();

  for (int i=0; i<6; i++) {
    float weightBase = random(30, 60);
    Body pikachu = new Body(round(random(100)), random(-300,300), random(-100,100), -weightBase*28/3, 10, weightBase);
    pikachus.add(pikachu);
  }
}

void draw() {
  background(255);
  translate(width/2, height/2, 0);
  rotateX(radians(-20));
  rotateY(radians(-30));

  for (int i=0;i<pikachus.size();i++) {
    Body eachPikachu = (Body) pikachus.get(i);

    eachPikachu.update();
    eachPikachu.displayBody();
  }
  checkVanish();
}

void checkVanish() {
  for (int i=pikachus.size()-1;i>-1;i--) {
    Body eachPikachu = (Body) pikachus.get(i);
    if (eachPikachu.checkVanish()) {
      pikachus.remove(i);
      float weightBase = random(30, 60);
      Body pikachu = new Body(round(random(100)), random(-300,300), random(-100,100), -weightBase*28/3, 10, weightBase);
      pikachus.add(pikachu);
    }
  }
}

class Body {

  PVector initLoc;
  boolean spawn;

  ArrayList segments;
  int offset, sgtAmt, spawnIndex;
  float [] sgtIncre;
  float weightBase, increBase, bounding;
  float degrees;

  Body(int offset, float x, float y, float z, int sgtAmt, float weightBase) {

    spawn = true;
    
    this.offset = offset;
    this.sgtAmt = sgtAmt;
    this.weightBase = weightBase;

    bounding = weightBase*7/3;
    increBase = weightBase/3;

    initLoc = new PVector(x, y, z);

    segments = new ArrayList();

    sgtIncre = new float[sgtAmt];
    for (int i=0;i<sgtAmt;i++) {
      if (i==0);
      else if (i==1 || i==sgtAmt-2) sgtIncre[i] = increBase/3;
      else if (i==2 || i==sgtAmt-3) sgtIncre[i] = increBase/2;
      else sgtIncre[i] = increBase;
    }
    spawnSgt(initLoc.x, initLoc.y, initLoc.z, offset, weightBase*2/3);
    spawnIndex += 1;
  }

  void update() {

    if (spawn && spawnIndex<sgtAmt) {
      int lastIndex = segments.size()-1;
      int currentIndex = spawnIndex;

      Segment lastSgt = (Segment) segments.get(lastIndex);

      float sgtWeight = 0;

      if ((lastSgt.loc.z - initLoc.z)>sgtIncre[currentIndex]) {
        if (currentIndex==0 || currentIndex==sgtAmt-2) sgtWeight = weightBase*2/3;
        else if (currentIndex==1 || currentIndex==sgtAmt-3) sgtWeight = weightBase*7/8;
        else sgtWeight = weightBase;

        spawnSgt(initLoc.x, initLoc.y, initLoc.z, currentIndex+offset, sgtWeight);
        spawnIndex += 1;
      }
    }

    for (int i=0;i<segments.size();i++) {
      Segment eachSgt = (Segment) segments.get(i);
      eachSgt.update(weightBase/15, weightBase/6);
    }
    for (int i=0;i<segments.size()-1;i++) {
      Segment eachSgt = (Segment) segments.get(i);
      Segment followingSgt = (Segment) segments.get(i+1);
      eachSgt.matrixRotate(followingSgt);
    }

    if (spawn) {
      if (segments.size() == sgtAmt) {
        spawn = false;
      }
    }

    checkVanish();
  }
  
  void displayBody() {

    colorMode(RGB);

    noStroke();
    fill(255);
    displayFace();

    displayEars();
    
    noStroke();
    fill(252, 229, 1);

    for (int i=0;i<segments.size()-2;i++) {
      Segment sgt1 = (Segment) segments.get(i);
      Segment sgt2 = (Segment) segments.get(i+1);

      beginShape(TRIANGLE_STRIP);
      for (int j=0;j<sgt1.details;j++) {
        int k = (j+1)%sgt1.details;
        vertex(sgt1.vertices[j].x, sgt1.vertices[j].y, sgt1.vertices[j].z);
        vertex(sgt2.vertices[j].x, sgt2.vertices[j].y, sgt2.vertices[j].z);
        vertex(sgt1.vertices[k].x, sgt1.vertices[k].y, sgt1.vertices[k].z);
        vertex(sgt2.vertices[k].x, sgt2.vertices[k].y, sgt2.vertices[k].z);
      }
      endShape();
    }
    
    displayButt();
  }

  void displayFace() {
    if (segments.size()>0) {
      Segment face = (Segment) segments.get(0);
      beginShape();
      texture(faceTxt);
      for (int i=0;i<face.vertices.length;i++) {
        float radians = float(i)/float(face.vertices.length)*2*PI-PI;
        float u = (cos(radians)+1)*faceTxt.width/2;
        float v = (sin(radians)+1)*faceTxt.height/2;
        vertex(face.vertices[i].x, face.vertices[i].y, face.vertices[i].z, u, v);
      }
      endShape(CLOSE);
    }
  }

  void displayEars() {
    if (segments.size()>2) {
      
      Segment earsSgt = (Segment) segments.get(1);
      
      PVector earL = new PVector((earsSgt.vertices[1].x+earsSgt.vertices[2].x)/2-weightBase/3, 
      (earsSgt.vertices[1].y+earsSgt.vertices[2].y)/2-weightBase/2, 
      (earsSgt.vertices[1].z+earsSgt.vertices[2].z)/2-weightBase/4);
      
      PVector earR = new PVector((earsSgt.vertices[3].x+earsSgt.vertices[4].x)/2+weightBase/3, 
      (earsSgt.vertices[3].y+earsSgt.vertices[4].y)/2-weightBase/3, 
      (earsSgt.vertices[3].z+earsSgt.vertices[4].z)/2-weightBase/4);
      
      PVector earLml = new PVector((earsSgt.vertices[1].x+earL.x)/2, 
      (earsSgt.vertices[1].y+earL.y)/2, 
      (earsSgt.vertices[1].z+earL.z)/2);
      
      PVector earLmr = new PVector((earsSgt.vertices[2].x+earL.x)/2, 
      (earsSgt.vertices[2].y+earL.y)/2, 
      (earsSgt.vertices[2].z+earL.z)/2);
      
      PVector earRml = new PVector((earsSgt.vertices[3].x+earR.x)/2, 
      (earsSgt.vertices[3].y+earR.y)/2, 
      (earsSgt.vertices[3].z+earR.z)/2);
      
      PVector earRmr = new PVector((earsSgt.vertices[4].x+earR.x)/2, 
      (earsSgt.vertices[4].y+earR.y)/2, 
      (earsSgt.vertices[4].z+earR.z)/2);
      
      fill(0);
      beginShape(TRIANGLES);
      vertex(earLml.x, earLml.y, earLml.z);
      vertex(earL.x, earL.y, earL.z);
      vertex(earLmr.x, earLmr.y, earLmr.z);
      vertex(earRml.x, earRml.y, earRml.z);
      vertex(earR.x, earR.y, earR.z);
      vertex(earRmr.x, earRmr.y, earRmr.z);
      endShape();
      
      fill(252, 229, 1);
      beginShape(QUADS);
      vertex(earLml.x, earLml.y, earLml.z);
      vertex(earLmr.x, earLmr.y, earLmr.z);
      vertex(earsSgt.vertices[2].x, earsSgt.vertices[2].y, earsSgt.vertices[2].z);
      vertex(earsSgt.vertices[1].x, earsSgt.vertices[1].y, earsSgt.vertices[1].z);
      vertex(earRml.x, earRml.y, earRml.z);
      vertex(earRmr.x, earRmr.y, earRmr.z);
      vertex(earsSgt.vertices[4].x, earsSgt.vertices[4].y, earsSgt.vertices[4].z);
      vertex(earsSgt.vertices[3].x, earsSgt.vertices[3].y, earsSgt.vertices[3].z);
      endShape();
      
      stroke(0, 200);
      strokeWeight(1);
      line(earsSgt.vertices[1].x, earsSgt.vertices[1].y, earsSgt.vertices[1].z, earL.x, earL.y, earL.z);
      line(earsSgt.vertices[2].x, earsSgt.vertices[2].y, earsSgt.vertices[2].z, earL.x, earL.y, earL.z);
      line(earsSgt.vertices[3].x, earsSgt.vertices[3].y, earsSgt.vertices[3].z, earR.x, earR.y, earR.z);
      line(earsSgt.vertices[4].x, earsSgt.vertices[4].y, earsSgt.vertices[4].z, earR.x, earR.y, earR.z);
    }
  }

  void displayButt() {
    if (segments.size()>1) {
      Segment butt = (Segment) segments.get(segments.size()-2);
      beginShape();
      for (int i=0;i<butt.vertices.length;i++) {
        vertex(butt.vertices[i].x, butt.vertices[i].y, butt.vertices[i].z);
      }
      endShape(CLOSE);
    }
  }

  boolean checkVanish() {
    boolean result = true;
    for (int i=segments.size()-1;i>-1;i--) {
      Segment eachSgt = (Segment) segments.get(i);
      float x = screenX(eachSgt.loc.x, eachSgt.loc.y, eachSgt.loc.z);
      float y = screenY(eachSgt.loc.x, eachSgt.loc.y, eachSgt.loc.z);
      if (x > 0 && x<width && y > 0 && y<height) {
        result = false;
        break;
      }
    }
    return result;
  }

  void spawnSgt(float initX, float initY, float initZ, int index, float weight) {
    Segment addedSgt = new Segment(initX, initY, initZ, index, 10, weight);
    segments.add(addedSgt);
  }
}

class Segment {

  int details;
  int offset;
  float weight, xR, zR;

  PVector [] vertices;
  PVector initLoc, loc;

  Segment(float initX, float initY, float initZ, int offset, int details, float weight) {

    loc = new PVector(initX, initY, initZ);
    initLoc = new PVector(initX, initY, initZ);
    
    this.offset = offset;
    this.details = details;
    this.weight = weight;

    vertices = new PVector[details];
    for (int i=0;i<vertices.length;i++) {
      vertices[i] = new PVector(0, 0, 0);
    }
  }

  void update(float zIncre, float range) {
    loc.z += zIncre;
    loc.y = initLoc.y+sin(radians(offset*30+frameCount*10))*range;
  }

  void matrixRotate(Segment anotherSgt) {
    PVector dir = PVector.sub(anotherSgt.loc, loc);

    xR = (atan(dir.z/dir.y));
    if (dir.y<0) zR = (atan(dir.x/sqrt(sq(dir.y)+sq(dir.z))))-PI;
    else zR = -(atan(dir.x/sqrt(sq(dir.y)+sq(dir.z))));

    for (int i=0;i<details;i++) {
      float radians = 2*PI/details*i;
      if (dir.y<0) vertices[i].set(cos(radians), 0, sin(radians));
      else vertices[i].set(cos(radians-PI), 0, sin(radians-PI));
      vertices[i] = rotAtZ(vertices[i], zR);
      vertices[i] = rotAtX(vertices[i], xR);
      vertices[i].mult(weight);
      vertices[i].add(loc);
    }
  }

  PVector rotAtX(PVector v, float radians) {
    PVector newV = new PVector(0, 0, 0);
    newV.x = v.x;
    newV.y = v.y*cos(radians)-v.z*sin(radians);
    newV.z = v.y*sin(radians)+v.z*cos(radians);
    return newV;
  }

  PVector rotAtZ(PVector v, float radians) {
    PVector newV = new PVector(0, 0, 0);
    newV.x = v.x*cos(radians)-v.y*sin(radians);
    newV.y = v.x*sin(radians)+v.y*cos(radians);
    newV.z = v.z;
    return newV;
  }
}

