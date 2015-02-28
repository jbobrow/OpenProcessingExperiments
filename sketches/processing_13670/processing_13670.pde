
int screenWidth = 800;
int screenHeight = 600;
int squareSize = 5;
int rows = screenHeight/squareSize;
int columns = screenWidth/squareSize;
int state[][];
int antX = columns/2;
int antY = rows/2;
int direction = 1;
int txtSize = 12;
int myFrameCount = 0;
int distance = 500;
boolean go3D = true;
float rotation = 0;
float otherRotation = 0;
float xOffset = 0;
float yOffset = 0;
int frameSkip = 100;

/*
0 = Up
1 = Right
2 = Down
3 = Left
*/
//Fills a square
//int GType[] = new int[]{0,1,1,1,1,1,0,0,1};

//Classic
int GType[] = new int[]{0,1};

//Chaos
//int GType[] = new int[]{1,0,1};

//Symmetry
//int GType[] = new int[]{0,0,1,1};

//Evil butterfly
//int GType[] = new int[]{0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1};

//Triangle
//int GType[] = new int[]{1,1,0,0,0,1,0,0,0,1,1,1};

//convuluted highway
//int GType[] = new int[]{0,0,1,1,1,0,1,0,1,0,0,1};

int stateCount = GType.length;

color stateCols[] = new color[stateCount];

color bgCol = color(0,0,0);
color antCol = color(0,0,255);
color txtCol = color(0,128,128);

//Fonts
PFont myFont = createFont("Free Serif", txtSize);


void setup(){
  frameRate(100);
  textFont(myFont);
  noStroke();
  size(screenWidth,screenHeight,P3D);
  background(0);
  state = new int[rows][columns];
  for(int j = 0; j < rows; j++){
    for(int i = 0; i < columns; i++){
      state[j][i] = 0;
    }
  }
  for(int i = 0; i < stateCount; i++){
    stateCols[i] = color(map(i,0,stateCount,255,255),map(i,0,stateCount,255,0),map(i,0,stateCount,0,0));
    //stateCols[i] = color(map(i,0,stateCount,0,255),map(i,0,stateCount,0,255),map(i,0,stateCount,0,255));
  } 
  //stateCols[0] = color(0,255,0);
  //stateCols[1] = color(0,0,255);
  drawAnt();
}

void draw3Dstate(){
  //stroke(0);
  //strokeWeight(3);
  background(bgCol);
  pushMatrix();//origin
  translate((width/2)+xOffset,(height/2)+yOffset,-distance);
  //rotateX(QUARTER_PI);
  rotateX(PI+otherRotation);
  rotateZ(QUARTER_PI+(rotation/3));
  pushMatrix();//centre + distance
  translate(-width/2,-height/2,0);
  pushMatrix();//corner
  
  
  for(int j = 0; j < rows; j++){
    for(int i = 0; i < columns; i++){
      if(state[j][i] > 0){
        pushMatrix();//correct for the cube
        translate(0,0,state[j][i]*(squareSize/2));
        fill(stateCols[(state[j][i]%stateCount)]);
        box(squareSize,squareSize,state[j][i]*squareSize);
        popMatrix();
      }
      translate(squareSize,0,0);  
    }
    translate(-width,squareSize,0);
  }
  popMatrix();//back to corner
  translate(antX*squareSize,antY*squareSize,state[antY][antX]*(squareSize/2));
  fill(antCol);
  box(squareSize*1.1,squareSize*1.1,state[antY][antX]*squareSize*1.1);
  popMatrix();//back to centre
  
  
  
  popMatrix();//back to origin
  myFrameCount++;
}

void draw(){
  if(go3D == false){
  drawState();
  for(int i = 0; i < frameSkip; i++){
    updateState();
  }
  if (frameSkip > 1){
    drawWhole2DScene();
  }
  drawAnt();
  } else {
    lights();
//    smooth();
    draw3Dstate();
    updateState();
  }
  drawText();
}
void keyPressed() {
  if(int(key) == 32){
    if(go3D){
      drawWhole2DScene();
      go3D = false;
    } else {
    go3D = true;
    }
  }
  if(int(key) == 120){
   otherRotation += QUARTER_PI/2; 
  }
  if(int(key) == 122){
    otherRotation -= QUARTER_PI/2;
  }
  if(keyCode == 38){
    yOffset -= 10;
  }
  if(keyCode == 40){
    yOffset += 10;
  }
  if(keyCode == 37){
    xOffset -= 10;
  }
  if(keyCode == 39){
    xOffset += 10;
  }
}
  
void updateState(){
  updateAnt();
  updateSquare();
  myFrameCount++;
}

void turn(int angle){
  if(angle == 0){
    //left
    if(direction == 0){
      direction = 3;
    } else {
      direction--;
    }
  } else {
    //right
    if(direction == 3){
      direction = 0;
    } else {
      direction++;
    }
  }
}

void move(){
  if(antY == 0 && direction == 0){
    antY = rows-1;
  } else {
    if(direction == 0 ){
      antY--;
    }
  }
  if(antX == columns-1 && direction == 1){
    antX = 0;
  } else {
    if(direction == 1){
      antX++;
    }
  }
  if(antY == rows-1 && direction == 2){
   antY = 0; 
  } else {
    if(direction == 2){
      antY++;
    }
  }
  if(antX == 0 && direction == 3){
    antX = columns-1;
  } else {
    if(direction == 3){
      antX--;
    }
  }
}

int getInstruction(){
  return GType[(state[antY][antX]%stateCount)];
}

void updateSquare(){
  state[antY][antX]++;
}

void mouseDragged(){
  distance += 5*(pmouseY-mouseY);
  rotation += (pmouseX-mouseX);
}

void updateAnt(){
  move();
  turn(getInstruction());
}

void drawState(){
  //for(int j = 0; j < rows; j++){
    //for(int i = 0; i < columns; i++){
      fill(stateCols[(state[antY][antX]%stateCount)]);
      rect(antX*squareSize,antY*squareSize,squareSize,squareSize);
    //}
  //}  
}

void drawWhole2DScene(){
  background(bgCol);
  for(int j = 0; j < rows; j++){
    for(int i = 0; i < columns; i++){
      fill(stateCols[(state[j][i]%stateCount)]);
      rect(i*squareSize,j*squareSize,squareSize,squareSize);
    }
  }  
}

void drawAnt(){
  fill(antCol);
  rect(antX*squareSize,antY*squareSize,squareSize,squareSize);
}

void drawText(){
  fill(bgCol);
  rect(0,0,70,80);
  fill(txtCol);
  text("FrameCount:\n"+myFrameCount+"\nFramerate\n"+int(frameRate),0,txtSize,150,100);
}


