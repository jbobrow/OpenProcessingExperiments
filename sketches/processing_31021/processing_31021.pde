
float back1X, back1Y, back2X, back2Y, back3X, back3Y, 
      back4X, back4Y, front1X, front1Y, front2X, front2Y,
      front3X, front3Y, front4X, front4Y;
int cubeX, cubeY, cursorX, cursorY;
PFont font; 

void setup(){
  font = loadFont("Arial.vlw");
  size(200,200);
  noStroke();
  smooth();
  noCursor();
}

void draw(){
  
  background(250,255,180);
  calculatePoints(); //maps updates variables for corner coordinates
  drawCube();
  cursorX = constrain(mouseX,50,150);
  cursorY = constrain(mouseY,50,150);
  cubeX = cursorX-30;
  cubeY = cursorY-30;
  fill(0);
  text("Click and hold for wireframe.",23,194);
}


void calculatePoints(){ //point numbers runs clockwise from the top left
  back1X = map(cubeX,0,width,width*.25-15,width*.75);
  back1Y = map(cubeY,0,height,height*.25-15,height*.75);
  back2X = map(cubeX,0,width,width*.25-15,width*.75)+50;
  back2Y = map(cubeY,0,height,height*.25-15,height*.75);
  back3X = map(cubeX,0,width,width*.25-15,width*.75)+50;
  back3Y = map(cubeY,0,height,height*.25-15,height*.75)+50;
  back4X = map(cubeX,0,width,width*.25-15,width*.75);
  back4Y = map(cubeY,0,height,height*.25-15,height*.75)+50;
  front1X = cubeX;
  front1Y = cubeY;
  front2X = cubeX+60;
  front2Y = cubeY;
  front3X = cubeX+60;
  front3Y = cubeY+60;
  front4X = cubeX;
  front4Y = cubeY+60;
}

void drawCube(){
  if (mousePressed == true){
    stroke(100);
    fill(78,137,203,110);
  } else {
    noStroke();
    fill(78,137,203);
  }
  rect(map(cubeX,0,width,width*.25-15,width*.75),map(cubeY,0,height,height*.25-15,height*.75),50,50);
  beginShape();
  vertex(front1X,front1Y);
  vertex(back1X,back1Y);
  vertex(back3X,back3Y);
  vertex(front3X,front3Y);
  endShape(CLOSE);
  beginShape();
  vertex(front2X,front2Y);
  vertex(back2X,back2Y);
  vertex(back4X,back4Y);
  vertex(front4X,front4Y);
  endShape(CLOSE);
  if( mousePressed == true){
    fill(131,188,255,110);
  } else {
    fill(131,188,255);
  }
  rect(cubeX,cubeY,60,60);
}

