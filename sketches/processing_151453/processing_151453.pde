
float speed;
float myangle, margin=50, ang=0;
boolean moved;
int circleNum, num=10;
PVector[]pos;
float[] offSet = new float[num*num];
void setup() {
  size(500, 500);
  background(180);
  myangle=0;
  pos=new PVector[num*num];
  moved=false;
  rectMode(CENTER);
  noStroke();
  for (int i=0; i<offSet.length; i++) {
    offSet[i] = random(TWO_PI);
  }
  //noLoop();
}

void draw() {
  background(255);
  strokeJoin(ROUND);
  speed =0.0523;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNum=j+i*num;
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      boolean useACircle=circleNum%2==0;
      //myangle+=speed;
      //float ang = (1-2*int(useACircle))*radians(20*circleNum + TWO_PI * millis() / 30+myangle/10);
      ang += radians(speed);
      //println(ang);
      //movingCircle(tx, ty, cellsize, ang+TWO_PI/num*circleNum*int(!useACircle), useACircle);
      movingCircle(tx, ty, cellsize, ang+TWO_PI/sq(num)*circleNum*int(useACircle), useACircle);
      //movingCircle(tx, ty, cellsize, ang+offSet[circleNum]+circleNum*int(useACircle), useACircle);
    }
  }
  for (int i=0; i<num-1; i++) {
    for (int j=0; j<num-1; j++) {
      circleNum=j+i*num;
      boolean useACircle=circleNum%2==0;
      stroke(0);
      fill(255*int(useACircle), 0, 255*int(!useACircle), 185);   
      quad(pos[circleNum].x, pos[circleNum].y, pos[circleNum+1].x, pos[circleNum+1].y, pos[circleNum+num+1].x, pos[circleNum+num+1].y, pos[circleNum+num].x, pos[circleNum+num].y);
      line(pos[circleNum].x, pos[circleNum].y, pos[circleNum+1].x, pos[circleNum+1].y);
      line(pos[circleNum].x, pos[circleNum].y, pos[circleNum+num].x, pos[circleNum+num].y);
    }
  }
}

void movingCircle(float x, float y, float size, float angle, boolean useCircle) {

  stroke(0);
  strokeWeight(2);
  fill(255, 255, 0);

  // calculate endpoint of the line
  float tempX, tempY;
  tempX = x + (size / 2) * sin(angle);
  tempY = y + (size / 2) * cos(angle);
  pos[circleNum]=new PVector(tempX, tempY);
  stroke(255, 0, 0);
}
