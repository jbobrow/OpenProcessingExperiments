
int num1 = 10;
int num2 = 20;
int num3 = 20;

float speed1 = 0.06;
float speed2 = 0.02;
float speed3 = 0.02;
int fixedX1 = 0;
int fixedX2 = -150;
int fixedX3 = 150;
int distance1 = 50;
int distance2 = 200;
int distance3 = 200;
float [] angleDot1;
float [] angleDot2;
float [] angleDot3;
PVector [] dot1;
PVector [] dot2;
PVector [] dot3;

void setup(){
   size(500,500); 
   dot1 = new PVector[num1];
   dot2 = new PVector[num2];
   dot3 = new PVector[num3];
   angleDot1 = new float[num1];
   angleDot2 = new float[num2];
   angleDot3 = new float[num3];
   sedDotPosition(dot1, angleDot1, fixedX1, distance1);
   sedDotPosition(dot2, angleDot2, fixedX2, distance2);
   sedDotPosition(dot3, angleDot3, fixedX3, distance3);
}

void sedDotPosition(PVector[] dots, float[] angles, int fixedX, int distance){
   for(int i=0; i< dots.length; i++){
       float fixedAngle = TWO_PI / dots.length;
       if(i != 0){
          angles[i] = angles[i] + angles[i-1] + fixedAngle; 
       }
       PVector pos = new PVector(cos(angles[i]) * distance + fixedX, sin(angles[i]) * distance1); 
       dots[i] = pos;
   }
}

void draw(){
    smooth();
    translate(width/2,height/2);
    background(255);
    drawValues(dot1, angleDot1, fixedX1, distance1, speed1);
    drawValues(dot2, angleDot2, fixedX2, distance2, speed2);
    drawValues(dot3, angleDot3, fixedX3, distance3, speed3);
    drawConnection(dot1, dot2);
    drawConnection(dot1, dot3); 
}

void drawValues(PVector[] dots, float[] angles, int fixedX, int distance, float speed){
    for (int i = 0; i < dots.length; i++){
      angles[i] += speed;
      dots[i].x = cos(angles[i]) * distance * 0.3 + fixedX;
      dots[i].y = sin(angles[i]) * distance;
      drawDots(dots[i].x, dots[i].y);
    }
}


void drawDots(float dx, float dy){
     pushMatrix();
     fill (1,255);
     noStroke();
     ellipse (dx, dy, 3, 3);
     popMatrix();    
}

void drawConnection(PVector[] dotsOne, PVector[] dotsTwo){
     for(int i=0; i< dotsOne.length; i++){
        float x1 = dotsOne[i].x;
        float y1 = dotsOne[i].y;
        for(int j=0; j< dotsTwo.length; j++){
           float x2 = dotsTwo[j].x;
           float y2 = dotsTwo[j].y; 
           float dis = dist(x1, y1, x2, y2);
           
           float a = map(dis, 50, 300, 100, 0);
           stroke(0,a);
           strokeWeight(1);
           line(x1, y1, x2, y2);
        }
     }
}


