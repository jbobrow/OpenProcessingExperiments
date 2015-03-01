

float curDeg=0;
float hour, min, sec;

void setup(){
  size(600,600);
  frameRate(15);
   background(0);
  
  hour = hour();
  min = minute();
  sec = second();
}

void draw(){


  
  translate(width/2, height/2);
    
  if(sec==360){
    sec=0;
  }
  if(sec%30==0){
    min++;
  }
  sec++;
  
  stroke(255);
  drawLine(200, sec);
  stroke(#FF0000);
  drawLine(100, min);

}

void drawLine(float radius, float curDeg){
  curDeg-=90;
  float rad = radians(curDeg);
  float x = radius * cos(rad);
  float y = radius * sin(rad);

  line(0,0,x,y);
}

