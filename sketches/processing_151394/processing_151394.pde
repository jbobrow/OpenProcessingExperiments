
float speed;
float myangle,margin;
boolean moved;
int circleNum,num,clockVis;
PVector[]pos;
void setup() {
  size(600, 600);
  background(180);
  num = 8;
  clockVis=0;
  myangle=0;
  pos=new PVector[num*num];
  moved=false;
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(255);
  strokeJoin(ROUND);
  margin = mouseY-width/2;
  speed=(mouseX-width/2)/500;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNum=j+i*num;
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      boolean useACircle=circleNum%2==0;
      myangle+=speed;//rotation speed varies with distance from //mouse to center of the sketch
      movingCircle(tx, ty, cellsize, (1-2*int(useACircle))*radians(20*circleNum + TWO_PI * millis() / 30+myangle/10), useACircle);
    }
  }
for (int i=0; i<num-1; i++) {
    for (int j=0; j<num-1; j++) {
      circleNum=j+i*num;
      useACircle=circleNum%2==0;
      stroke(0);
      fill(255*int(useACircle),0,255*int(!useACircle),185);
if(clockVis!=1){     quad(pos[circleNum].x,pos[circleNum].y,pos[circleNum+1].x,pos[circleNum+1].y,pos[circleNum+num+1].x,pos[circleNum+num+1].y,pos[circleNum+num].x,pos[circleNum+num].y);
      line(pos[circleNum].x,pos[circleNum].y,pos[circleNum+1].x,pos[circleNum+1].y);
      line(pos[circleNum].x,pos[circleNum].y,pos[circleNum+num].x,pos[circleNum+num].y);
      }
    }
  }
}

void movingCircle(float x, float y, float size, float angle, boolean useCircle) {

  stroke(0);
  strokeWeight(5);
  fill(255,255,0);
  if(clockVis>0)ellipse(x, y, size, size); // circle
  
  // calculate endpoint of the line
  float tempX,tempY;
  tempX = x + (size / 2) * sin(angle);
  tempY = y + (size / 2) * cos(angle);
  pos[circleNum]=new PVector(tempX,tempY);
  stroke(255, 0,0);
  if(clockVis>0)line(x, y, tempX, tempY); // red line
}

 void mouseReleased(){
    clockVis++;
    clockVis=clockVis%3;
 }
