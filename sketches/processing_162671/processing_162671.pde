

float curDeg=0;
float hour, min, sec;

void setup(){
  size(600,600);
  frameRate(1);
   background(#182A67);
  
  hour = hour();
  min = minute();
  sec = second();
}

void draw(){

   background(#182A67);
  
  translate(width/2, height/2);
    
  if(min==60){
    hour++;
    min=0;
  }
  if(sec==60){
    min++;
    sec=0;
  }
  sec++;
  
  drawLine(200, 6 * sec);
  drawLine(150, 6 * min);
  drawLine(50, 30 * hour);
}

void drawLine(float radius, float curDeg){
  curDeg-=90;
  float rad = radians(curDeg);
  float x = radius * cos(rad);
  float y = radius * sin(rad);
  stroke(255);
  line(0,0,x,y);
}
