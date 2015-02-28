
PFont hr;
PFont Min;
PImage bg;

void setup() {
  size(640, 480);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();
  hr= loadFont("hr.vlw");
  
}
 
void draw(){
  background(0);
  bg= loadImage("background.jpg");
  image(bg,0,0);
  //date
  float h1= random(0,360);
  float s1=100;
  float b1=100;
 
  
  int dia = day();
  int mes = month();
  int anio = year();
  fill(h1,s1,b1,100);
  String date =(mes+":"+dia+":"+anio);
  textSize(30);
  text(date, mouseX-30, mouseY);
  filter(DILATE);
  filter(BLUR);
    
 
  //hour
  float h = hour();
  float hModulo = h % 12;
  float hMapped = map(hModulo, 0, 12, 0, 360);
 
  float hourCenterx = cos(3*PI/2+2*PI*hour()/12+PI/2/12*minute()/60+PI/2/12/60*second()/60+PI/2/12/60/60*millis()/1000)*width/4+width/2;
  float hourCentery = sin(3*PI/2+2*PI*hour()/12+PI/2/12*minute()/60+PI/2/12/60*second()/60+PI/2/12/60/60*millis()/1000)*height/4+height/2;
  
  fill(hMapped,100,100);
  ellipse((int)hourCenterx,(int)hourCentery,height/2,height/2);
  stroke(hMapped,100,100);
  line(320,240,hourCenterx,hourCentery);
  
  fill(hMapped,100,90);
  noStroke();
  textFont(hr);
  text((int) h,(int)hourCenterx,(int)hourCentery);
  
  //min
  float m = minute();
  float mMapped = map(m, 0, 60, 0, 360);
  fill(mMapped,100,100);
  float minCenterx = cos(3*PI/2+2*PI*minute()/60+PI/2/60*second()/60+PI/2/60/60*millis()/1000)*width/8+320;
  float minCentery = sin(3*PI/2+2*PI*minute()/60+PI/2/60*second()/60+PI/2/60/60*millis()/1000)*height/8+240;
  
  noStroke();
  fill(mMapped,100,100);
  ellipse((int)minCenterx,(int)minCentery,height/4,height/4);
  
  stroke(mMapped,100,100);
  line(320,240,minCenterx,minCentery);
  
  textFont(hr);
  textSize(100);
  fill(mMapped,100,90);
  text( (int)m,(int)minCenterx,(int)minCentery);
  
  
  //sec
  float s = second();
  float sMapped = map(s, 0, 60, 0, 360);
  fill(sMapped,100,100);
  float secCenterx = cos(3*PI/2+2*PI*second()/60+PI/2/60*millis()/1000)*width/8+320;
  float secCentery = sin(3*PI/2+2*PI*second()/60+PI/2/60*millis()/1000)*height/8+240;
  noStroke();
  ellipse((int)secCenterx,(int)secCentery,height/16,height/16);
  stroke(sMapped,100,100);
  line(320,240,secCenterx,secCentery);
  
  //millis
  fill(300);
  float milCenterx = cos(3*PI/2+2*PI*millis()/1000)*width/32+secCenterx;
  float milCentery = sin(3*PI/2+2*PI*millis()/1000)*height/32+secCentery;
  noStroke();
  ellipse((int)milCenterx,(int)milCentery,height/32,height/32);

  fill(0);
  line(hourCenterx,hourCentery,320,240);
  

  


  

}


