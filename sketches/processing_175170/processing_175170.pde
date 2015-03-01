
int num = 100;

float distance1 = 0;
float distance2 = 100;
float lineDistance = 60;
float angle = 0;
float easing = 0.5;
PVector [] dot1;
PVector [] dot2;

void setup(){
    size(600, 600);
    dot1      = new PVector [num];
    dot2      = new PVector [num];
    setDotPosition(dot1);
    setDotPosition(dot2);
    
}

void setDotPosition(PVector[] dots){
      for(int i = 0; i < dots.length; i++){
         PVector pos = new PVector (width/2, height/2);
         dots[i] = pos;
      }
}

void draw (){
    smooth();
    background(255);
    drawValues(dot1, false);
    drawValues(dot2, true);
    drawConnection(); 
}


void drawValues(PVector dots, boolean isCurve){
   for (int i = 0; i < dots.length; i++){
      float targetX;
      float targetY;
      if(i == 0){
        if(isCurve){
           angle += 0.1;
           targetX = mouseX + cos(angle) * distance2;
           targetY = mouseY + sin(angle) * distance2; 
        }else{
           targetX = mouseX;
           targetY = mouseY; 
        }
      }else{
        targetX = dots[i - 1].x;
        targetY = dots[i - 1].y; 
      }
      float dx = targetX - dots[i].x;
      float dy = targetY - dots[i].y;
      if(abs(dx)> distance1){
         dots[i].x += dx * easing; 
      }
      if(abs(dy)> distance1){
         dots[i].y += dy * easing; 
      }
      drawDots(dots[i].x, dots[i].y, i);
    }
}

void drawDots(float dx, float dy, int col){
      pushMatrix();
      fill (col);
      stroke(col, col, col, 1);
      ellipse (dx, dy, 3, 3);
      popMatrix();  
}

void drawConnection(){
     for (int i = 0; i < dot1.length; i++){
         float x1 = dot1[i].x;
         float y1 = dot1[i].y;
         for(int j=0; j<dot2.length; j++){
            float x2 = dot2[j].x;
            float y2 = dot2[j].y;
            float distance = dist(x1, y1, x2, y2);
            if(distance < lineDistance){
              float m = map(distance, 20, lineDistance, 100, 0);
              stroke(1,m);
              line(x1, y1, x2, y2);
            }  
         }
     }
}
