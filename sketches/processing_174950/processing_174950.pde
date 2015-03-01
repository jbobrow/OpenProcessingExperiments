
int num0 = 50;
int num1 = num0/2;
int num2 = num1/2 + 20;

int distance0 = 250;
int distance1 = distance0/2;
int distance2 = distance1/2;
float speedDot0 =0.01;
float speedDot1 = -speedDot0 *2;
float speedDot2 = -speedDot1 *2;

int [] circles;
float [] angleDot0;
float [] angleDot1;
float [] angleDot2;
PVector [] dot0;
PVector [] dot1;
PVector [] dot2;

void setup(){
     size (600, 600); 
     angleDot0 = new float [num0];
     angleDot1 = new float [num1];
     angleDot2 = new float [num2];
     dot0 = new PVector [num0];
     dot1 = new PVector [num1];
     dot2 = new PVector [num2];
     setDotPosition(dot0, distance0, angleDot0, speedDot0);
     setDotPosition(dot1, distance1, angleDot1, speedDot1);
     setDotPosition(dot2, distance2, angleDot2, speedDot2);
}

void setDotPosition(PVector[] dots, int distance, float[] angles, float speed){
     
     for (int i = 0; i < dots.length; i++){
         
         float angle = TWO_PI/ dots.length;
         if(i != 0){
           angles[i] = angles[i] + angles[i-1] + angle;
         }
         PVector pos = new PVector (cos(angles[i]) * distance, sin(angles[i]) * distance);
         dots[i] = pos;
     } 
}

void draw (){
    smooth();
    translate(width/2,height/2);
    background(255);
    drawValues();
    drawConnection(); 
}

void drawValues(){    

    for (int i = 0; i < dot0.length; i++){
      angleDot0[i] += speedDot0;
      dot0[i].x = cos(angleDot0[i]) * distance0;
      dot0[i].y = sin(angleDot0[i]) * distance0;
      addDots(dot0[i].x, dot0[i].y);
    }
    for (int j = 0; j < dot1.length; j++){
      angleDot1[j] += speedDot1;
      dot1[j].x = cos(angleDot1[j]) * distance1;
      dot1[j].y = sin(angleDot1[j]) * distance1;
      addDots(dot1[j].x, dot1[j].y);
    }
    for (int k = 0; k < dot2.length; k++){
      angleDot2[k] += speedDot2;
      dot2[k].x = cos(angleDot2[k]) * distance2;
      dot2[k].y = sin(angleDot2[k]) * distance2;
      addDots(dot2[k].x, dot2[k].y);
    }
}


void addDots(float dx, float dy){
     pushMatrix();
     fill (0,100);
     ellipse (dx, dy, 3, 3);
     popMatrix();    
}

void drawConnection(){
     
      for(int i = 0; i< dot0.length; i++){
         float x0 = dot0[i].x;
         float y0 = dot0[i].y;
         for(int j = 0; j< dot1.length; j++){
            float x1 = dot1[j].x;
            float y1 = dot1[j].y;
            float distance = dist(x0, y0, x1, y1);
            
            if(distance < 260){
               float a = map(distance, 40, 260, 100, 0);
               stroke(0,a);
               strokeWeight(1);
               line (x0, y0, x1, y1);
            }
         } 
      }
      for(int k = 0; k< dot1.length; k++){
         float x1 = dot1[k].x;
         float y1 = dot1[k].y;
         for(int j = 0; j< dot2.length; j++){
            float x2 = dot2[j].x;
            float y2 = dot2[j].y;
            float distance = dist(x1, y1, x2, y2);
            
            if(distance < 100){
               float a = map(distance, 40, 100, 100, 0);
               stroke(0,a);
               strokeWeight(1);
               line (x1, y1, x2, y2);
            }
         } 
      }
}


