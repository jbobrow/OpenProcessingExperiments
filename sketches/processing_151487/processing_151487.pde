
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/151453*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float speed;
float myangle, ang=0;
boolean moved;
int circleNum, numH=30, numV=17;
PVector[]pos;
float[] offSet = new float[numH*numV];
float smalldia, bigdia, cellsizeH, cellsizeV;
void setup() {
  size(700, 700);
  background(180);
  smalldia=50;
  bigdia=300;
  myangle=0;
  pos=new PVector[numH*numV];
  moved=false;
  rectMode(CENTER);
 strokeWeight(2);
  for (int i=0; i<offSet.length; i++) {
    offSet[i] = random(TWO_PI);
  }
  //noLoop();
}

void draw() {
  background(255);
  strokeJoin(ROUND);
  speed =0.0153;
  float gutter = -20; //distance between each cell
  cellsizeH = ( TWO_PI*smalldia  - gutter * (numH - 1) ) / (numH - 1);
  cellsizeV = ( bigdia-smalldia  - gutter * (numV - 1) ) / (numV - 1);
  for (int j=0; j<numV; j++) {
    float radius=smalldia+j*(bigdia-smalldia)/numV;
    for (int i=0; i<numH; i++) {
      cellsizeH = ( TWO_PI*(radius-smalldia)  - gutter * (numH - 1) ) / (numH - 1);
      circleNum=i+j*numH;
      float tx = width/2+(radius)*sin(i*TWO_PI/numH);
      float ty = height/2+(radius)*cos(i*TWO_PI/numH);
      //ellipse(tx, ty, cellsizeH, cellsizeH);
      boolean useACircle=circleNum%2==0;
      ang += radians(speed);
      movingCircle(tx, ty, cellsizeH, cellsizeV, ang+circleNum*mouseX/width+TWO_PI/sq(numH)*circleNum, useACircle);
    }
  }
  for (int j=0; j<numV-1; j++) {
    for (int i=0; i<numH; i++) {
      if (i*j!=(numH-1)*(numV-2)) {
        circleNum=i+j*numH;
        int nbeCells=numV*numH;
        boolean useACircle=circleNum%2==0;
        stroke(0);
        fill(255*int(useACircle), 0, 255*int(!useACircle), 185);           
        quad(pos[circleNum].x, pos[circleNum].y, pos[(i+1)%numH+j*numH].x, pos[(i+1)%numH+j*numH].y, 
        pos[(i+1)%numH+(j+1)%numV*numH].x, pos[(i+1)%numH+(j+1)%numV*numH].y, pos[i+(j+1)%numV*numH].x, pos[i+(j+1)%numV*numH].y);
      }
    }
  }
  stroke(0);
  circleNum++;
  fill(255*int(circleNum%2==0), 0, 255*int(circleNum%2!=0), 185);
  quad(pos[-1+numV*numH].x, pos[-1+numV*numH].y, pos[(numV-1)*numH].x, pos[(numV-1)*numH].y, 
  pos[(numV-2)*numH].x, pos[(numV-2)*numH].y, pos[(numV-1)*numH-1].x, pos[(numV-1)*numH-1].y);
}

void movingCircle(float x, float y, float sizeX, float sizeY, float angle, boolean useCircle) {

  // calculate endpoint of the line
  float tempX, tempY;
  tempX = x + (sizeX / 2) * sin(angle);
  tempY = y + (sizeX / 2) * cos(angle);
  pos[circleNum]=new PVector(tempX, tempY);
}



