
int num = 45;

float lineDistance = 150;
float angle = 0;
float easing = 0.5;
PVector [] dot1;
PVector [] dot2;
PVector [] dot3;
PVector [] dot4;
PVector [] dot5;
float [] angleDot1;
float [] angleDot2;
float [] angleDot3;
float [] angleDot4;
float [] angleDot5;


void setup(){
    size(600, 600);
    dot1      = new PVector [num];
    angleDot1 = new float   [num];
    dot2      = new PVector [num];
    angleDot2 = new float   [num];
    dot3      = new PVector [num];
    angleDot3 = new float   [num];
    dot4      = new PVector [1];
    angleDot4 = new float   [1];
    dot5      = new PVector [1];
    angleDot5 = new float   [1];
    setDotPosition(dot1, angleDot1);
    setDotPosition(dot2, angleDot2);
    setDotPosition(dot3, angleDot3);
    setDotPosition(dot4, angleDot4);
    setDotPosition(dot5, angleDot5);
}

void setDotPosition(PVector[] dots, float[] angleDots){
      for(int i = 0; i < dots.length; i++){
         float fixedAngle = TWO_PI / dots.length;
         PVector pos = new PVector (width/2, height/2);
         if(i != 0){
          angleDots[i] = angleDots[i] + angleDots[i-1] + fixedAngle; 
         }
         dots[i] = pos;
      }
}

void draw (){
    smooth();
    translate(width/2,height/2);
    background(255);
    drawValues(dot1, angleDot1, 0, height/3, 0.01);
    drawValues(dot2, angleDot2, 100, height/6, -0.01);
    drawValues(dot3, angleDot3, -100, height/6, -0.01);
    drawValues(dot4, angleDot4, 200, 0, -0.01);
    drawValues(dot5, angleDot5, -200, 0, -0.01);
    drawConnection(dot1, dot2);
    drawConnection(dot1, dot3);
    drawConnection(dot2, dot4);
    drawConnection(dot3, dot5);
}


void drawValues(PVector[] dots, float[] angles, int fixedY, int distance, float speed){
   for (int i = 0; i < dots.length; i++){
      angles[i] += speed;
      dots[i].x = cos(angles[i]) * distance;
      dots[i].y = sin(angles[i]) * cos(angles[i]) * distance * 0.3 + fixedY;
      drawDots(dots[i].x, dots[i].y);
    }
}

void drawDots(float dx, float dy){
      pushMatrix();
      fill (1);
      ellipse (dx, dy, 1, 1);
      popMatrix();  
}

void drawConnection(PVector[] dots1, PVector[] dots2){
     for (int i = 0; i < dots1.length; i++){
         float x1 = dots1[i].x;
         float y1 = dots1[i].y;
         for(int j=0; j<dots2.length; j++){
            float x2 = dots2[j].x;
            float y2 = dots2[j].y;
            float distance = dist(x1, y1, x2, y2);
            if(distance < lineDistance ){
              float m = map(distance, 20, lineDistance, 100, 0);
              stroke(1,m);
              line(x1, y1, x2, y2);
            }  
         }
     }
}
    


