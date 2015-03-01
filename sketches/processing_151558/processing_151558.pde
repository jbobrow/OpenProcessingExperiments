
/*
  //Thanks for Pierre Marzin for the original sketch (151394)
  //
  //Move mouse left -> right to increase/decrease speed
  //Move mouse ^ v to zoom
  //Click through iterations
  //      1. rotation reversed line by line
  //      2. uniform rotation
  //      3. rotation reversed cell by cell
  //      >3 repeat above but angular offset increased x 10 for every 3
  //
*/

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
  boolean useACircle, useAThird;

  int unidir = 0;
  
  margin = mouseY-width/2;
  speed=(mouseX-width/2)/100;
  
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  int multiplier = 1;
  
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNum=j+i*num;
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      myangle+=speed;//rotation speed varies with distance from //mouse to center of the sketch
               
      //if click divis 2 line by line reversed
      useACircle=circleNum%2==0;
      
      //if click is divis 3 direction is reversed
      useAThird=clockVis%3==0;
      
      if (clockVis%2 == 0) {
          unidir=(1-2*int(useACircle));
      } else {
          unidir = 1;
      }
      
      //for every third mouse click increase the angular displacement 
      if (clockVis>3) multiplier=( (int) clockVis/3 ) *10;
         
        
      //in the following
      movingCircle(tx, ty, cellsize, unidir*radians(multiplier*circleNum + TWO_PI * millis() / 30+myangle/10), useAThird);
    }
  }
  for (int i=0; i<num-1; i++) {
    for (int j=0; j<num-1; j++) {
      circleNum=j+i*num;
      useACircle=circleNum%2==0;
      stroke(0);
      fill(250*int(useACircle),0,250*int(!useACircle),185);
      
      //draw the quad
      quad(pos[circleNum].x,pos[circleNum].y,pos[circleNum+1].x,pos[circleNum+1].y,pos[circleNum+num+1].x,pos[circleNum+num+1].y,pos[circleNum+num].x,pos[circleNum+num].y);
      
      //draw the outline - perhaps superfluous
      //line(pos[circleNum].x,pos[circleNum].y,pos[circleNum+1].x,pos[circleNum+1].y);
      //line(pos[circleNum].x,pos[circleNum].y,pos[circleNum+num].x,pos[circleNum+num].y);
    }
  }
}
 
void movingCircle(float x, float y, float size, float angle, boolean useCircle) {
 
  stroke(0);
  strokeWeight(1);
  fill(255,255,0);
   
  // calculate endpoint of the line
  float tempX,tempY;
  if (useCircle) {
     tempX = x + (size / 2) * sin(angle);
     tempY = y + (size / 2) * cos(angle);
  } else {
     tempX = x + (size / 2) * cos(angle);
     tempY = y + (size / 2) * sin(angle);
  }
  pos[circleNum]=new PVector(tempX,tempY);
  stroke(255, 0,0);
  line(x, y, tempX, tempY);
}
 
void mouseReleased(){
    clockVis++;
 }



