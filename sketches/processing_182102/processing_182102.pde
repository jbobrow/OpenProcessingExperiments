
float x1,x2,y1,y2,xx1,xx2,yy1,yy2;
float a1,a2,b1,b2;
float duration;
int dashLength;
int circleRadius;

int angleStart;
int angleInc;

int startTime;
float time;
int z;
int ss;

void setup() {
  size (600,600);	
  smooth();
  //frameRate(60);
  dashLength = 15;
  circleRadius = 150;
  startTime = millis();
  
  angleStart = -90;
  angleInc = 6;
  duration = 1000/60;
  
  time = 0;
  z=-90;
  ss = 0;
  
}

void draw() {
  background(123,110,140);
  translate (width/2,height/2);
  noStroke();
  //ellipse (0,0,circleRadius*2,circleRadius*2);

  stroke(255);
  strokeWeight(4);
  
  //base dashes around the circle
  for (int i=0; i<60; i++) {
      
    if(i==0 || i==15 || i==30 || i==45) {dashLength = 20; stroke(255);}
    else {dashLength = 15; stroke(194,184,209);}
    
    //x1=a+r*cos t, y1=b+r*sin t for a circle centered at a,b and radius r
    x1 = 0 + (circleRadius * cos(radians(-90 + 6*i)));
    y1 = 0 + (circleRadius * sin(radians(-90 + 6*i)));
        
    //x2=x1+z*cos t, y2=y1+z*sin t for a circle centered at a,b and radius r
    x2 = x1 + (dashLength * cos(radians(-90 + 6*i)));
    y2 = y1 + (dashLength * sin(radians(-90 + 6*i)));
    
    line(x1,y1,x2,y2);
  }
    
    
    //inner dash
    stroke(194,184,209);
    a1 = 0 + ((circleRadius-6) * cos(radians(angleStart)));
    b1 = 0 + ((circleRadius-6) * sin(radians(angleStart)));
    a2 = a1 + (5 * cos(radians(angleStart)));
    b2 = b1 + (5 * sin(radians(angleStart)));
    line(a1,b1,a2,b2);
    
    //outer dashes
    
    //tallest one
    xx1 = 0 + ((circleRadius) * cos(radians(z)));
    yy1 = 0 + ((circleRadius) * sin(radians(z))); 
    xx2 = xx1 + ((dashLength+16) * cos(radians(z)));
    yy2 = yy1 + ((dashLength+16) * sin(radians(z)));
    line (xx1,yy1,xx2,yy2);
    
    //shorter ones
    xx1 = 0 + ((circleRadius) * cos(radians(z-6)));
    yy1 = 0 + ((circleRadius) * sin(radians(z-6))); 
    xx2 = xx1 + ((dashLength+8) * cos(radians(z-6)));
    yy2 = yy1 + ((dashLength+8) * sin(radians(z-6)));
    line (xx1,yy1,xx2,yy2);
    
    xx1 = 0 + ((circleRadius) * cos(radians(z+6)));
    yy1 = 0 + ((circleRadius) * sin(radians(z+6))); 
    xx2 = xx1 + ((dashLength+8) * cos(radians(z+6)));
    yy2 = yy1 + ((dashLength+8) * sin(radians(z+6)));
    line (xx1,yy1,xx2,yy2);
    
    
    //only run every 1000/60 millis
    if (millis() >= time+duration) {
      
      //move inner dash
       angleStart+=angleInc;
       //println("test: "+((time+duration)-millis()));
       
       //move outer dash 1/60th of the times
       if (ss%60 == 0) { z+=6;}
       ss++;
       
       time = millis();
    }
  
}



