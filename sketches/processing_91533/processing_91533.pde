
import ddf.minim.*;
Minim minim;
AudioPlayer song;
AudioPlayer boo;
AudioPlayer cheer;

float xmag, ymag = 0;
float newXmag, newYmag = 0; 
float backR=0;
float backG=0;
float backB=0;
float foreR=0;
float foreG=0;
float foreB=0;

int boxLength=6;
int boxHeight=10;

int rowsCompleted=0;
int time=2000;
int timeInterval=2000;
int level=0;
int levelFactor=3;
int score=0;

float scaleFactor=40;

boolean booDoneOnce=false;

ArrayList<Block> allBlocks = new ArrayList<Block>();
boolean gameOver=false;

int cheerCount=0;

void setup() {
  size(600, 650, P3D);
  background(1, 1, 1);
  backR=random(0, 255);
  backG=random(0, 255);
  backB=random(0, 255);
  foreR=random(0, 255);
  foreG=random(0, 255);
  foreB=random(0, 255);
  allBlocks.add(new Block());
  minim=new Minim(this);
  song=minim.loadFile("Approaching Nirvana - Tetris Remix.mp3");
  boo=minim.loadFile("boohiss-01.wav");
  cheer=minim.loadFile("Kids Cheering.mp3");
//  song.setGain(0);
  song.loop();
  song.play();
}

void draw() {
  background(backR, backG, backB);
  stroke(foreR, foreG, foreB);
  fill(foreR, foreG, foreB, 1);
  strokeWeight(5);
  pushMatrix();
  translate(width/2, height/2, 0);

  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;

  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0;
  }

  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0;
  }

  rotateX(-ymag);
  rotateZ(-xmag);

  scale(40); 
//  pointLight(128,128,128,0,0,0);
  lights();

  if (!gameOver) {
    beginShape();
    vertex(-(boxLength/2), -(boxLength/2), -boxHeight/2);
    for (int i=0;i<boxLength;i++) {
      vertex(-(boxLength/2)+i, -(boxLength/2), -boxHeight/2);
      vertex(-(boxLength/2)+i, (boxLength/2), -boxHeight/2);
      vertex(-(boxLength/2)+i, -(boxLength/2), -boxHeight/2);
    }
    vertex((boxLength/2), -(boxLength/2), -boxHeight/2);
    for (int i=0;i<boxLength;i++) {
      vertex((boxLength/2), -(boxLength/2)+i, -boxHeight/2);
      vertex(-(boxLength/2), -(boxLength/2)+i, -boxHeight/2);
      vertex((boxLength/2), -(boxLength/2)+i, -boxHeight/2);
    }
    vertex((boxLength/2), (boxLength/2), -boxHeight/2);
    vertex(-(boxLength/2), (boxLength/2), -boxHeight/2);
    vertex(-(boxLength/2), -(boxLength/2), -boxHeight/2);

    vertex(-(boxLength/2), -(boxLength/2), boxHeight/2);
    vertex((boxLength/2), -(boxLength/2), boxHeight/2);
    vertex((boxLength/2), -(boxLength/2), -boxHeight/2);
    vertex((boxLength/2), -(boxLength/2), boxHeight/2);
    vertex((boxLength/2), (boxLength/2), boxHeight/2);
    vertex((boxLength/2), (boxLength/2), -boxHeight/2);
    vertex((boxLength/2), (boxLength/2), boxHeight/2);
    vertex(-(boxLength/2), (boxLength/2), boxHeight/2);
    vertex(-(boxLength/2), (boxLength/2), -boxHeight/2);
    vertex(-(boxLength/2), (boxLength/2), boxHeight/2);
    vertex(-(boxLength/2), -(boxLength/2), boxHeight/2);
    endShape();

    for (int i=0;i<allBlocks.size()-1;i++) {
      Block b = allBlocks.get(i);
      for (int j=0;j<b.cubes.size();j++) {
        if (b.cubes.get(j).getZ()>=5) {
          gameOver=true;
        }
      }
    }

    int rowsCompleteThisRound=0;
    allBlocks.get(allBlocks.size()-1).checkDoneMoving();
    if (allBlocks.get(allBlocks.size()-1).doneMoving) {
      for (int i=-boxHeight/2;i<boxHeight/2;i++) {
        boolean complete=checkRowComplete(i);
        if (complete) {
          rowsCompleteThisRound++;
          clearRow(i);
          rowsCompleted++;
          if (rowsCompleted%levelFactor==0) {
            level++;
            timeInterval=timeInterval-300;
          }
          i--;
        }
      }
      allBlocks.add(new Block());
    }
    
    if(cheerCount!=0 && millis()-cheerCount>2000){
       cheerCount=0;
    }
    
    if(rowsCompleted>0){
      cheer.setGain(14);
      cheer.play();
      cheerCount=millis();
    }

    if (rowsCompleteThisRound==1) {
      score=score+40*(level+1);
    }
    if (rowsCompleteThisRound==2) {
      score=score+100*(level+1);
    }
    if (rowsCompleteThisRound==3) {
      score=score+300*(level+1);
    }
    if (rowsCompleteThisRound==4) {
      score=score+1200*(level+1);
    }

    if (millis()>time) {
      allBlocks.get(allBlocks.size()-1).drop();
      time=time+timeInterval;
    }

    for (int i=0;i<allBlocks.size();i++) {
      allBlocks.get(i).display();
    }

    popMatrix();

    pushMatrix();
    textFont (createFont ((PFont.list())[12], 52));
    //  println(PFont.list());
    fill(0, 0, 0);
    text("Level: "+level, 20, 50, 0);
    text("Score: "+score, width/2+20, 50, 0);
    popMatrix();

    if (gameOver) {
      song.setGain(-14);
      boo.setGain(14);
      boo.play();
      for (int i=0;i<allBlocks.size();i++) {
        Block b = allBlocks.get(i);
        b.setDirection();
        b.setRotationSpeedX();
        b.setRotationSpeedY();
        b.setRotationSpeedZ();
      }
    }
  }
  else if (gameOver) {
    if(!boo.isPlaying() && !booDoneOnce){
      song.setGain(0);
      booDoneOnce=true;
    }
    for (int i=0;i<allBlocks.size();i++) {
      Block b = allBlocks.get(i);
      b.explosionMovement();
      b.display();
    }
    popMatrix();
  }
}

void stop() {
  song.close();
  boo.close();
  minim.stop();
  super.stop();
}

void mousePressed() {
  backR=random(0, 255);
  backG=random(0, 255);
  backB=random(0, 255);
  foreR=random(0, 255);
  foreG=random(0, 255);
  foreB=random(0, 255);
}

boolean checkRowComplete(int row) {
  for (int x=-3;x<boxLength/2;x++) {
    for (int y=-3;y<boxLength/2;y++) {
      boolean spotOccupied=false;
      for (int i=0;i<allBlocks.size();i++) {
        ArrayList<Cube> allCubes = allBlocks.get(i).cubes;
        for (int j=0;j<allCubes.size();j++) {
          if (abs(row-allCubes.get(j).getZ())<0.5 && abs(x-allCubes.get(j).getX())<0.5 && abs(y-allCubes.get(j).getY())<0.5) {
            spotOccupied=true;
          }
        }
      }
      if (!spotOccupied) {
        return false;
      }
    }
  }
  return true;
}

void clearRow(int row) {
  for (int i=0;i<allBlocks.size();i++) {
    ArrayList<Cube> allCubes = allBlocks.get(i).cubes;
    for (int j=0;j<allCubes.size();j++) {
      if (abs(row-allCubes.get(j).getZ())<0.5) {
        allCubes.remove(allCubes.get(j));
        j--;
      }
      else if (allCubes.get(j).getZ()>row) {
        allCubes.get(j).drop();
      }
    }
  }
}

void keyPressed() {
  if (keyCode == UP) {
    if (0<xmag && xmag<0.5) {
      allBlocks.get(allBlocks.size()-1).backward();
    }
    else if (0.5<xmag && xmag<2.5) {
      allBlocks.get(allBlocks.size()-1).right();
    }
    else if (2.5<xmag && xmag<4) {
      allBlocks.get(allBlocks.size()-1).forward();
    }
    else if (xmag>4 && xmag<5.5) {
      allBlocks.get(allBlocks.size()-1).left();
    }
    else {
      allBlocks.get(allBlocks.size()-1).backward();
    }
  }
  if (keyCode == DOWN) {
    if (0<xmag && xmag<0.5) {
      allBlocks.get(allBlocks.size()-1).forward();
    }
    else if (0.5<xmag && xmag<2.5) {
      allBlocks.get(allBlocks.size()-1).left();
    }
    else if (2.5<xmag && xmag<4) {
      allBlocks.get(allBlocks.size()-1).backward();
    }
    else if (xmag>4 && xmag<5.5) {
      allBlocks.get(allBlocks.size()-1).right();
    }
    else {
      allBlocks.get(allBlocks.size()-1).forward();
    }
  }
  if (keyCode == LEFT) {
    if (0<xmag && xmag<0.5) {
      allBlocks.get(allBlocks.size()-1).left();
    }
    else if (0.5<xmag && xmag<2.5) {
      allBlocks.get(allBlocks.size()-1).backward();
    }
    else if (2.5<xmag && xmag<4) {
      allBlocks.get(allBlocks.size()-1).right();
    }
    else if (xmag>4 && xmag<5.5) {
      allBlocks.get(allBlocks.size()-1).forward();
    }
    else {
      allBlocks.get(allBlocks.size()-1).left();
    }
  }
  if (keyCode == RIGHT) {
    if (0<xmag && xmag<0.5) {
      allBlocks.get(allBlocks.size()-1).right();
    }
    else if (0.5<xmag && xmag<2.5) {
      allBlocks.get(allBlocks.size()-1).forward();
    }
    else if (2.5<xmag && xmag<4) {
      allBlocks.get(allBlocks.size()-1).left();
    }
    else if (xmag>4 && xmag<5.5) {
      allBlocks.get(allBlocks.size()-1).backward();
    }
    else {
      allBlocks.get(allBlocks.size()-1).right();
    }
  } 
  if (key == 'Q' || key == 'q') {
    allBlocks.get(allBlocks.size()-1).yRotation(-90);
  }
  if (key == 'W' || key == 'w') {
    allBlocks.get(allBlocks.size()-1).yRotation(90);
  }
  if (key == 'A' || key == 'a') {
    allBlocks.get(allBlocks.size()-1).xRotation(-90);
  }
  if (key == 'S' || key == 's') {
    allBlocks.get(allBlocks.size()-1).xRotation(90);
  }
  if (key == 'Z' || key == 'z') {
    allBlocks.get(allBlocks.size()-1).zRotation(-90);
  }
  if (key == 'X' || key == 'x') {
    allBlocks.get(allBlocks.size()-1).zRotation(90);
  }
  if (key == ' ') {
    Block b = allBlocks.get(allBlocks.size()-1);
    for (int i=0;i<10;i++) {
      b.drop();
      b.checkDoneMoving();
      if (!b.doneMoving) {
        score=score+2;
      }
    }
  }
}


class Block {
  ArrayList<Cube> cubes = new ArrayList<Cube>();
  boolean doneMoving=false;
  my3DPoint shapeCenter;
  float rValue;
  float gValue;
  float bValue;
  PVector direction;
  float rotationSpeedX;
  float rotationSpeedY;
  float rotationSpeedZ;

  Block() {
    int randomNumber = (int)random(0, 7);
    //    int randomNumber=2;

    //square piece
    if (randomNumber==0) {
      cubes.add(new Cube(-1, 0, 4));
      cubes.add(new Cube(0, 0, 5));
      cubes.add(new Cube(-1, 0, 5));
      cubes.add(new Cube(0, 0, 4));
      shapeCenter = new my3DPoint(-0.5, 0.5, 4.5);
      rValue=255;
      gValue=0;
      bValue=0;
    }

    //T piece
    if (randomNumber==1) {
      cubes.add(new Cube(1, 0, 4));
      cubes.add(new Cube(0, 0, 4));
      cubes.add(new Cube(0, 1, 4));
      cubes.add(new Cube(0, -1, 4));
      shapeCenter = new my3DPoint(0, 0, 4);
      rValue=255;
      gValue=165;
      bValue=0;
    }

    //line piece
    if (randomNumber==2) {
      cubes.add(new Cube(-1, 0, 4));
      cubes.add(new Cube(0, 0, 4));
      cubes.add(new Cube(1, 0, 4));
      cubes.add(new Cube(2, 0, 4));
      shapeCenter = new my3DPoint(0.5, 0.5, 3.5);
      rValue=0;
      gValue=0;
      bValue=255;
    }

    //squiggle piece
    if (randomNumber==3) {
      cubes.add(new Cube(-1, -1, 4));
      cubes.add(new Cube(0, -1, 4));
      cubes.add(new Cube(0, 0, 4));
      cubes.add(new Cube(1, 0, 4));
      shapeCenter = new my3DPoint(0.5, -0.5, 3.5);
      rValue=160;
      gValue=32;
      bValue=240;
    }

    //L block
    if (randomNumber==4) {
      cubes.add(new Cube(-1, 1, 4));
      cubes.add(new Cube(-1, 0, 4));
      cubes.add(new Cube(0, 0, 4));
      cubes.add(new Cube(1, 0, 4));
      shapeCenter = new my3DPoint(0, 0, 4); 
      rValue=0;
      gValue=255;
      bValue=0;
    }

    //corner block
    if (randomNumber==5) {
      cubes.add(new Cube(-1, 0, 4));
      cubes.add(new Cube(0, 0, 4));
      cubes.add(new Cube(0, -1, 4));
      cubes.add(new Cube(0, 0, 5));
      shapeCenter = new my3DPoint(-0.5, -0.5, 4.5);
      rValue=255;
      gValue=255;
      bValue=0;
    }

    //other corner block
    if (randomNumber==6) {
      cubes.add(new Cube(-1, 0, 4));
      cubes.add(new Cube(0, 0, 4));
      cubes.add(new Cube(0, -1, 4));
      cubes.add(new Cube(-1, 0, 5));
      shapeCenter = new my3DPoint(-0.5, -0.5, 4.5);
      rValue=255;
      gValue=20;
      bValue=147;
    }
  }

  void setDirection() {
    float x=random(-1, 1);
    float y=random(-1, 1);
    float z=random(-1, 1);
    direction = new PVector(x, y, z);
    direction.div(1000);
  }

  void setRotationSpeedX() {
    rotationSpeedX=random(0, 30);
  }

  float getRotationSpeedX() {
    return rotationSpeedX;
  }

  void setRotationSpeedY() {
    rotationSpeedY=random(0, 30);
  }

  float getRotationSpeedY() {
    return rotationSpeedY;
  }

  void setRotationSpeedZ() {
    rotationSpeedZ=random(0, 30);
  }

  float getRotationSpeedZ() {
    return rotationSpeedZ;
  }

  float getXDirection() {
    return direction.x;
  }

  float getYDirection() {
    return direction.y;
  }

  float getZDirection() {
    return direction.z;
  }

  void explosionMovement() {
    if (direction.x>0) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).right();
      }
    }
    if (direction.x<0) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).left();
      }
    }
    if (direction.y>0) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).backward();
      }
    }
    if (direction.y<0) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).forward();
      }
    }
    if (direction.z>0) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).up();
      }
    }
    if (direction.z<0) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).down();
      }
    }
    Cube[] newCubes = new Cube[cubes.size()];
    for (int i=0;i<cubes.size();i++) {
      newCubes[i] = new Cube(cubes.get(i).getX(), cubes.get(i).getY(), cubes.get(i).getZ());
    }
    for (int i=0;i<newCubes.length;i++) {
      Cube newCube = new Cube(newCubes[i].getX()-shapeCenter.getX(), newCubes[i].getY()-shapeCenter.getY(), newCubes[i].getZ()-shapeCenter.getZ());
      newCubes[i] = newCube;
    }
    for (int i=0;i<newCubes.length;i++) {
      float newX = newCubes[i].getX();
      float newZ = newCubes[i].getY()*sin(radians(rotationSpeedX))+newCubes[i].getZ()*cos(radians(rotationSpeedX));
      float newY = newCubes[i].getY()*cos(radians(rotationSpeedX))-newCubes[i].getZ()*sin(radians(rotationSpeedX));
      Cube newCube = new Cube(newX, newY, newZ);
      newCubes[i] = newCube;
    }
    for (int i=0;i<newCubes.length;i++) {
      Cube newCube = new Cube(newCubes[i].getX()+shapeCenter.getX(), newCubes[i].getY()+shapeCenter.getY(), newCubes[i].getZ()+shapeCenter.getZ());
      newCubes[i] = newCube;
    }
    cubes = new ArrayList<Cube>();
    for (int i=0;i<newCubes.length;i++) {
      cubes.add(newCubes[i]);
    }

    newCubes = new Cube[cubes.size()];
    for (int i=0;i<cubes.size();i++) {
      newCubes[i] = new Cube(cubes.get(i).getX(), cubes.get(i).getY(), cubes.get(i).getZ());
    }
    for (int i=0;i<newCubes.length;i++) {
      Cube newCube = new Cube(newCubes[i].getX()-shapeCenter.getX(), newCubes[i].getY()-shapeCenter.getY(), newCubes[i].getZ()-shapeCenter.getZ());
      newCubes[i] = newCube;
    }
    for (int i=0;i<newCubes.length;i++) {
      float newX = newCubes[i].getZ()*sin(radians(rotationSpeedY))+newCubes[i].getX()*cos(radians(rotationSpeedY));
      float newZ = newCubes[i].getZ()*cos(radians(rotationSpeedY))-newCubes[i].getX()*sin(radians(rotationSpeedY));
      float newY = newCubes[i].getY();
      ;
      Cube newCube = new Cube(newX, newY, newZ);
      newCubes[i] = newCube;
    }
    for (int i=0;i<newCubes.length;i++) {
      Cube newCube = new Cube(newCubes[i].getX()+shapeCenter.getX(), newCubes[i].getY()+shapeCenter.getY(), newCubes[i].getZ()+shapeCenter.getZ());
      newCubes[i] = newCube;
    }
    cubes = new ArrayList<Cube>();
    for (int i=0;i<newCubes.length;i++) {
      cubes.add(newCubes[i]);
    }

    newCubes = new Cube[cubes.size()];
    for (int i=0;i<cubes.size();i++) {
      newCubes[i] = new Cube(cubes.get(i).getX(), cubes.get(i).getY(), cubes.get(i).getZ());
    }
    for (int i=0;i<newCubes.length;i++) {
      Cube newCube = new Cube(newCubes[i].getX()-shapeCenter.getX(), newCubes[i].getY()-shapeCenter.getY(), newCubes[i].getZ()-shapeCenter.getZ());
      newCubes[i] = newCube;
    }
    for (int i=0;i<newCubes.length;i++) {
      float newX = newCubes[i].getX()*cos(radians(rotationSpeedZ))-newCubes[i].getY()*sin(radians(rotationSpeedZ));
      float newZ = newCubes[i].getZ();
      float newY = newCubes[i].getX()*sin(radians(rotationSpeedZ))+newCubes[i].getY()*cos(radians(rotationSpeedZ));
      Cube newCube = new Cube(newX, newY, newZ);
      newCubes[i] = newCube;
    }
    for (int i=0;i<newCubes.length;i++) {
      Cube newCube = new Cube(newCubes[i].getX()+shapeCenter.getX(), newCubes[i].getY()+shapeCenter.getY(), newCubes[i].getZ()+shapeCenter.getZ());
      newCubes[i] = newCube;
    }
    cubes = new ArrayList<Cube>();
    for (int i=0;i<newCubes.length;i++) {
      cubes.add(newCubes[i]);
    }
  }

  void display() {
    for (int i=0;i<cubes.size();i++) {
      cubes.get(i).display(rValue, gValue, bValue);
      if (!doneMoving && !gameOver) {
        cubes.get(i).displayShadow();
        //display point of rotation
        stroke(255, 0, 0);
        fill(255, 0, 0);
        noStroke();
        pushMatrix();
        translate(shapeCenter.getX()+0.5, shapeCenter.getY()+0.5, shapeCenter.getZ()+0.5);
        box(0.2);
        popMatrix();
      }
    }
  }

  void xRotation(float angle) {
    checkDoneMoving();
    if (!doneMoving) {
      Cube[] newCubes = new Cube[cubes.size()];
      for (int i=0;i<cubes.size();i++) {
        newCubes[i] = new Cube(cubes.get(i).getX(), cubes.get(i).getY(), cubes.get(i).getZ());
      }

      //move to center
      for (int i=0;i<newCubes.length;i++) {
        Cube newCube = new Cube(newCubes[i].getX()-shapeCenter.getX(), newCubes[i].getY()-shapeCenter.getY(), newCubes[i].getZ()-shapeCenter.getZ());
        newCubes[i] = newCube;
      }
      //do the rotation
      for (int i=0;i<newCubes.length;i++) {
        float newX = newCubes[i].getX();
        float newZ = newCubes[i].getY()*sin(radians(angle))+newCubes[i].getZ()*cos(radians(angle));
        float newY = newCubes[i].getY()*cos(radians(angle))-newCubes[i].getZ()*sin(radians(angle));
        Cube newCube = new Cube(newX, newY, newZ);
        newCubes[i] = newCube;
      }
      //translate back
      for (int i=0;i<newCubes.length;i++) {
        Cube newCube = new Cube(newCubes[i].getX()+shapeCenter.getX(), newCubes[i].getY()+shapeCenter.getY(), newCubes[i].getZ()+shapeCenter.getZ());
        newCubes[i] = newCube;
      }
      boolean inBounds=true;
      for (int i=0;i<newCubes.length;i++) {
        if (newCubes[i].inBounds()==false) {
          inBounds=false;
        }
      }
      if (inBounds && !collision(newCubes)) {
        cubes = new ArrayList<Cube>();
        for (int i=0;i<newCubes.length;i++) {
          cubes.add(newCubes[i]);
        }
      }
    }
  }

  void yRotation(float angle) {
    checkDoneMoving();
    if (!doneMoving) {
      Cube[] newCubes = new Cube[cubes.size()];
      for (int i=0;i<cubes.size();i++) {
        newCubes[i] = new Cube(cubes.get(i).getX(), cubes.get(i).getY(), cubes.get(i).getZ());
      }

      //move to center
      for (int i=0;i<newCubes.length;i++) {
        Cube newCube = new Cube(newCubes[i].getX()-shapeCenter.getX(), newCubes[i].getY()-shapeCenter.getY(), newCubes[i].getZ()-shapeCenter.getZ());
        newCubes[i] = newCube;
      }
      //do the rotation
      for (int i=0;i<newCubes.length;i++) {
        float newX = newCubes[i].getZ()*sin(radians(angle))+newCubes[i].getX()*cos(radians(angle));
        float newZ = newCubes[i].getZ()*cos(radians(angle))-newCubes[i].getX()*sin(radians(angle));
        float newY = newCubes[i].getY();
        ;
        Cube newCube = new Cube(newX, newY, newZ);
        newCubes[i] = newCube;
      }
      //translate back
      for (int i=0;i<newCubes.length;i++) {
        Cube newCube = new Cube(newCubes[i].getX()+shapeCenter.getX(), newCubes[i].getY()+shapeCenter.getY(), newCubes[i].getZ()+shapeCenter.getZ());
        newCubes[i] = newCube;
      }
      boolean inBounds=true;
      for (int i=0;i<newCubes.length;i++) {
        if (newCubes[i].inBounds()==false) {
          inBounds=false;
        }
      }
      if (inBounds && !collision(newCubes)) {
        cubes = new ArrayList<Cube>();
        for (int i=0;i<newCubes.length;i++) {
          cubes.add(newCubes[i]);
        }
      }
    }
  }

  void zRotation(float angle) {
    checkDoneMoving();
    if (!doneMoving) {
      Cube[] newCubes = new Cube[cubes.size()];
      for (int i=0;i<cubes.size();i++) {
        newCubes[i] = new Cube(cubes.get(i).getX(), cubes.get(i).getY(), cubes.get(i).getZ());
      }

      //move to center
      for (int i=0;i<newCubes.length;i++) {
        Cube newCube = new Cube(newCubes[i].getX()-shapeCenter.getX(), newCubes[i].getY()-shapeCenter.getY(), newCubes[i].getZ()-shapeCenter.getZ());
        newCubes[i] = newCube;
      }
      //do the rotation
      for (int i=0;i<newCubes.length;i++) {
        float newX = newCubes[i].getX()*cos(radians(angle))-newCubes[i].getY()*sin(radians(angle));
        float newZ = newCubes[i].getZ();
        float newY = newCubes[i].getX()*sin(radians(angle))+newCubes[i].getY()*cos(radians(angle));
        Cube newCube = new Cube(newX, newY, newZ);
        newCubes[i] = newCube;
      }
      //translate back
      for (int i=0;i<newCubes.length;i++) {
        Cube newCube = new Cube(newCubes[i].getX()+shapeCenter.getX(), newCubes[i].getY()+shapeCenter.getY(), newCubes[i].getZ()+shapeCenter.getZ());
        newCubes[i] = newCube;
      }
      boolean inBounds=true;
      for (int i=0;i<newCubes.length;i++) {
        if (newCubes[i].inBounds()==false) {
          inBounds=false;
        }
      }
      if (inBounds && !collision(newCubes)) {
        cubes = new ArrayList<Cube>();
        for (int i=0;i<newCubes.length;i++) {
          cubes.add(newCubes[i]);
        }
      }
    }
  }


  void drop() {
    boolean goOn=true;
    for (int i=0;i<cubes.size();i++) {
      if (!(cubes.get(i).getZ()>-(boxHeight/2))) {
        goOn=false;
      }
    }
    for (int i=0;i<allBlocks.size()-1;i++) {
      ArrayList<Cube> otherCubes = allBlocks.get(i).cubes;
      for (int j=0;j<otherCubes.size();j++) {
        for (int k=0;k<cubes.size();k++) {
          //System.out.println(cubes.get(k).getX()+","+ cubes.get(k).getY()+","+ (cubes.get(k).getZ()-1));
          if (otherCubes.get(j).equals(new Cube(cubes.get(k).getX(), cubes.get(k).getY(), cubes.get(k).getZ()-1))) {
            doneMoving=true;
            goOn=false;
          }
        }
      }
    }
    if (goOn) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).drop();
      }
      shapeCenter = new my3DPoint(shapeCenter.getX(), shapeCenter.getY(), shapeCenter.getZ()-1);
    }
  }

  void left() {
    checkDoneMoving();
    boolean goOn=true;
    for (int i=0;i<cubes.size();i++) {
      if (!(cubes.get(i).getX()>-(boxLength/2))||doneMoving) {
        goOn=false;
      }
    }
    for (int i=0;i<allBlocks.size()-1;i++) {
      ArrayList<Cube> otherCubes = allBlocks.get(i).cubes;
      for (int j=0;j<otherCubes.size();j++) {
        for (int k=0;k<cubes.size();k++) {
          if (otherCubes.get(j).equals(new Cube(cubes.get(k).getX()-1, cubes.get(k).getY(), cubes.get(k).getZ()))) {
            goOn=false;
          }
        }
      }
    }
    if (goOn) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).left();
      }
      shapeCenter = new my3DPoint(shapeCenter.getX()-1, shapeCenter.getY(), shapeCenter.getZ());
    }
  }

  void right() {
    checkDoneMoving();
    boolean goOn=true;
    for (int i=0;i<cubes.size();i++) {
      if (!(cubes.get(i).getX()<(boxLength/2)-1)||doneMoving) {
        goOn=false;
      }
    }
    for (int i=0;i<allBlocks.size()-1;i++) {
      ArrayList<Cube> otherCubes = allBlocks.get(i).cubes;
      for (int j=0;j<otherCubes.size();j++) {
        for (int k=0;k<cubes.size();k++) {
          if (otherCubes.get(j).equals(new Cube(cubes.get(k).getX()+1, cubes.get(k).getY(), cubes.get(k).getZ()))) {
            goOn=false;
          }
        }
      }
    }
    if (goOn) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).right();
      }
      shapeCenter = new my3DPoint(shapeCenter.getX()+1, shapeCenter.getY(), shapeCenter.getZ());
    }
  }

  void forward() {
    checkDoneMoving();
    boolean goOn=true;
    for (int i=0;i<cubes.size();i++) {
      if (!(cubes.get(i).getY()<(boxLength/2)-1)||doneMoving) {
        goOn=false;
      }
    }
    for (int i=0;i<allBlocks.size()-1;i++) {
      ArrayList<Cube> otherCubes = allBlocks.get(i).cubes;
      for (int j=0;j<otherCubes.size();j++) {
        for (int k=0;k<cubes.size();k++) {
          if (otherCubes.get(j).equals(new Cube(cubes.get(k).getX(), cubes.get(k).getY()+1, cubes.get(k).getZ()))) {
            goOn=false;
          }
        }
      }
    }
    if (goOn) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).forward();
      }
      shapeCenter = new my3DPoint(shapeCenter.getX(), shapeCenter.getY()+1, shapeCenter.getZ());
    }
  }

  void backward() {
    checkDoneMoving();
    boolean goOn=true;
    for (int i=0;i<cubes.size();i++) {
      if (!(cubes.get(i).getY()>-(boxLength/2))||doneMoving) {
        goOn=false;
      }
    }
    for (int i=0;i<allBlocks.size()-1;i++) {
      ArrayList<Cube> otherCubes = allBlocks.get(i).cubes;
      for (int j=0;j<otherCubes.size();j++) {
        for (int k=0;k<cubes.size();k++) {
          if (otherCubes.get(j).equals(new Cube(cubes.get(k).getX(), cubes.get(k).getY()-1, cubes.get(k).getZ()))) {
            goOn=false;
          }
        }
      }
    }
    if (goOn) {
      for (int i=0;i<cubes.size();i++) {
        cubes.get(i).backward();
      }
      shapeCenter = new my3DPoint(shapeCenter.getX(), shapeCenter.getY()-1, shapeCenter.getZ());
    }
  }  

  void checkDoneMoving() {
    for (int i=0;i<cubes.size();i++) {
      if (!(cubes.get(i).getZ()>-(boxHeight/2))) {
        doneMoving=true;
      }
    }
    for (int i=0;i<allBlocks.size()-1;i++) {
      ArrayList<Cube> otherCubes = allBlocks.get(i).cubes;
      for (int j=0;j<otherCubes.size();j++) {
        for (int k=0;k<cubes.size();k++) {
          if (otherCubes.get(j).equals(cubes.get(k))) {
            doneMoving=true;
          }
        }
      }
    }
  }

  boolean collision(ArrayList<Cube> newCubes) {
    for (int i=0;i<allBlocks.size()-1;i++) {
      ArrayList<Cube> otherCubes = allBlocks.get(i).cubes;
      for (int j=0;j<otherCubes.size();j++) {
        for (int k=0;k<newCubes.size();k++) {
          if (otherCubes.get(j).equals(newCubes.get(k))) {
            return true;
          }
        }
      }
    }
    return false;
  }

  boolean collision(Cube[] newCubes) {
    for (int i=0;i<allBlocks.size()-1;i++) {
      ArrayList<Cube> otherCubes = allBlocks.get(i).cubes;
      for (int j=0;j<otherCubes.size();j++) {
        for (int k=0;k<newCubes.length;k++) {
          if (otherCubes.get(j).equals(newCubes[k])) {
            return true;
          }
        }
      }
    }
    return false;
  }
}

class Cube {
  float x;
  float y;
  float z;
  int length=1;

  Cube(float x1, float y1, float z1) {
    x=x1;
    y=y1;
    z=z1;
  }

  boolean equals(Cube c) {
    if (abs(x-c.getX())<0.5 && abs(y-c.getY())<0.5 && abs(z-c.getZ())<0.5) {
      return true;
    }
    else {
      return false;
    }
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getZ() {
    return z;
  }

  void drop() {
    z--;
  }

  void left() {
    x--;
  }

  void right() {
    x++;
  }

  void forward() {
    y++;
  }

  void backward() {
    y--;
  }  

  void up() {
    z++;
  }

  void down() {
    z--;
  }

  boolean inBounds() {
    if (y>=-(boxLength/2) && y<boxLength/2 && x>=-(boxLength/2) && x<boxLength/2) {
      return true;
    }
    else {
      return false;
    }
  }

  void displayShadow() {
    float maxZ=-(boxHeight)/2-1;
    for (int i=0;i<allBlocks.size()-1;i++) {
      ArrayList<Cube> allCubes = allBlocks.get(i).cubes;
      for (int j=0;j<allCubes.size();j++) {
        if (allCubes.get(j).getZ()>maxZ && abs(x-allCubes.get(j).getX())<0.5 && abs(y-allCubes.get(j).getY())<0.5) {
          maxZ=allCubes.get(j).getZ();
        }
      }
    }
    stroke(35, 35, 35);
    fill(35, 35, 35);
    pushMatrix();
    translate((x+0.5), (y+0.5), maxZ+1);
    box(length, length, 0.01);
    popMatrix();
  }

  void display(float rValue, float gValue, float bValue) {
    stroke(0, 0, 0);
    fill(rValue, gValue, bValue);
    strokeWeight(3);
    pushMatrix();
    translate(x+0.5, y+0.5, z+0.5);
    box(length);
    popMatrix();
  }
}

class my3DPoint {

  float x=0;
  float y=0;
  float z=0;

  my3DPoint(float x1, float y1, float z1) {
    x=x1;
    y=y1;
    z=z1;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getZ() {
    return z;
  }

  String toString() {
    return "("+x+", "+y+", "+z+")";
  }
}

