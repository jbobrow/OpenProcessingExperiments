
PFont tFont;
int[] count = {
  10,100};
  int gen = 1;
int tH = int(random(4,20));
float rad = int(random(200,500));
float[] x = new float[count[0]];
float[] y = new float[count[0]];
float[][] r = new float[gen][count[0]];
int[] s = new int[count[1]];
int[] t = new int[count[1]];
Bounce[][] ball = new Bounce[2][];
ClosestPoint[][] cPt = new ClosestPoint[gen][count[1]];

void setup(){
  size(920,400);
  //tFont = loadFont("ArialMT-24.vlw");
  smooth();
  
 // textFont(tFont,12);
  for(int i = 0; i < 2; i += 1) {
    ball[i] = new Bounce[count[i]];
    for(int j = 0; j < count[i]; j += 1) {
      ball[i][j] = new Bounce(width/2,height/2,random(0,360),random(0.2,4),0,width,0,height);
      t[j] = 0;
      s[j] = 0;
    }
  }
}

void draw(){
  background(80,175,230);
  
  for(int k = 0; k < gen; k += 1) {
  for(int i = 0; i < count[0]; i += 1) {
    r[k][i] = 0;
  }
  }
  fill(255,255,255,150);
  for(int i = 0; i < 2; i += 1) {
    for(int j = 0; j < count[i]; j += 1) {
      ball[i][j] = new Bounce(ball[i][j].x,ball[i][j].y,ball[i][j].angle,ball[i][j].v,0,width,0,height);
      if (i==0){
        x[j] =  ball[i][j].x;
        y[j] =  ball[i][j].y;
      }
      else {
            for(int k = 0; k < gen; k += 1) {
        cPt[k][j] = new ClosestPoint (ball[i][j].x, ball[i][j].y, x, y,k);
        r[k][cPt[k][j].no] = r[k][cPt[k][j].no]+1;
        
if(t[j] == cPt[k][j].no){
  fill(255,255,255);
//            text(s[j],ball[i][j].x,ball[i][j].y);
  fill(0,0,0,200);
//            text(cPt[k][j].no,ball[i][j].x,ball[i][j].y+15);
  s[j] = s[j]+1;
}else{
  s[j] = 0;
}

t[j] = cPt[k][j].no;        

        stroke(255,255,255);
        strokeWeight(0.5);
        line(ball[i][j].x,ball[i][j].y,cPt[k][j].x,cPt[k][j].y);
            }
        strokeWeight(2);
        fill(255,255,255,200);
        noStroke();
        ellipse(ball[i][j].x,ball[i][j].y,5,5);
  noFill();
  stroke(255,255,255);
  strokeWeight(0.5);
        ellipse(ball[i][j].x,ball[i][j].y,s[j]*0.5,s[j]*0.5);
      }
    }
  }
  noFill();
  stroke(0,0,0,200);
  strokeWeight(2);
  for(int i = 0; i < count[0]; i += 1) {
    ellipse(ball[0][i].x,ball[0][i].y,1+r[0][i],1+r[0][i]);
  }
}
class Bounce {
  //inputs
  float x, y, a, v;
  float angle;
  Bounce (float xPos, float yPos, float angleVal, float velocity, float xMin, float xMax, float yMin, float yMax) {
    x = xPos;
    y = yPos;
    v = velocity;
    angle = angleVal;

    if( x >= xMax || x <= xMin){
      angle = abs(angle-360);
    }
    if( y >= yMax || y <= yMin){
      if (angle <= 180 ){
        angle = abs(360-angle-180);
      }
      else {
        angle = abs(360-angle+180);
      }
    }

    x = x+velocity*sin(radians(angle));
    y = y+velocity*cos(radians(angle));
  }
}
class ClosestPoint{

  float x, y, minDist;
  int count,no;
  float[] distance;
  ClosestPoint (float xOrig, float yOrig, float[] xPnt, float[] yPnt,int pVal) {
    count = yPnt.length;
    float[] distance = new float[count];
    
    for(int i = 0; i < count; i += 1) {
      distance[i] = dist(xOrig,yOrig,xPnt[i],yPnt[i]);
    }
    
    minDist = sort(distance)[pVal];
    
    for(int i = 0; i < count; i += 1) {
      if(dist(xOrig,yOrig,xPnt[i],yPnt[i])==minDist){
        x = xPnt[i];
        y = yPnt[i];
        no = i;
      }
    }
    
  }
}








