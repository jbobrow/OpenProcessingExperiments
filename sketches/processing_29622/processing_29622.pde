
float posStartXTurtle=0;
float posStartYTurtle=0;
float posXTurtle;
float posYTurtle;
float newposXTurtle;
float newposYTurtle;
float lonCubeSide=50;
float angleCubeSide=PI/6;
float cols=10;
float rows=10;
int countCols=0;
int countRows=0;

int randomColor1=(int)random(0,255);
int randomColor2=(int)random(0,255);
int randomColor3=(int)random(0,255);
int randomNumRhombusA=(int)random(1, 3);
int randomNumRhombusB=(int)random(1, 3);
int randomNumRhombusC=(int)random(1, 3);


void setup() {
  background(255);
  size(600, 600);
}

void draw() {

  if (randomNumRhombusA==1) {
    fill(randomColor1, randomColor1, randomColor1);
  }
  else if (randomNumRhombusA==2) {
    fill(randomColor1, randomColor2, randomColor1);
  }
  else if (randomNumRhombusA==3) {
    fill(randomColor2, randomColor1, randomColor2);
  }
  pushMatrix();
  translate(posStartXTurtle, posStartYTurtle);
  rotate(radians(0));
  drawRhombus(0, 0);
  popMatrix();
  noFill();


  if (randomNumRhombusB==1) {
    fill(randomColor3, randomColor3, randomColor1);
  }
  else if (randomNumRhombusB==2) {
    fill(randomColor3, randomColor3, randomColor3);
  }
  else if (randomNumRhombusB==3) {
    fill(randomColor1, randomColor3, randomColor1);
  }
  pushMatrix();
  translate(posStartXTurtle, posStartYTurtle);
  rotate(radians(120));
  drawRhombus(0, 0);
  popMatrix();
  noFill();

  if (randomNumRhombusC==1) {
    fill(randomColor1, randomColor1, randomColor3);
  }
  else if (randomNumRhombusC==2) {
    fill(randomColor2, randomColor2, randomColor1);
  }
  else if (randomNumRhombusC==3) {
    fill(randomColor3, randomColor3, randomColor2);
  }
  pushMatrix();
  translate(posStartXTurtle, posStartYTurtle);
  rotate(radians(240));
  drawRhombus(0, 0);
  popMatrix();
  noFill();

  if (countCols==cols) {
    if (countRows%2==0) {
      posStartXTurtle=lonCubeSide*cos(angleCubeSide);
    }
    else {
      posStartXTurtle=0;
    }

    posStartYTurtle=posStartYTurtle+lonCubeSide+lonCubeSide*sin(angleCubeSide);
    countRows++;
    countCols=0;
  }
  else {
    posStartXTurtle=posStartXTurtle+2*lonCubeSide*cos(angleCubeSide);
  }

  if (countRows==rows) {
    
    noLoop();
    println("ending tilling");
  }

  countCols++;
}

public void drawRhombus(float x, float y) {
  //if(countCols%2==0){
  //  fill(200,0,0);
  //}
  beginShape();
  vertex(x, y);
  y=y+lonCubeSide;
  vertex(x, y);
  x=x-lonCubeSide*cos(angleCubeSide);
  y=y-lonCubeSide*sin(angleCubeSide);
  vertex(x, y);
  y=y-lonCubeSide;
  vertex(x, y);
  endShape(CLOSE);
  //noFill();
}


