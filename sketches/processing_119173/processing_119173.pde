
void setup(){
  size(500,300);
 //noLoop();
 frameRate(10);
}

void draw(){
  background(0);
  drawspiral(250,170,100,150,70);
  drawspiral(380,100,200,200,150);
  drawspiral(100,50,200,150,100);
  drawspiral(60,270,225,80,80);
  drawspiral(450,290,150,180,225);
}

void drawspiral(int centX,int centY,int b, int c, int d){
  strokeWeight(5);
  //stroke(20,50,70);

  float x,y;
  
  float radius =10;
  //int centX=250;
  //int centY=150;
  
  //draw line
  float lastx=-999;
  float lasty=-999;
  
  //noisy
  float radiusNoise=random(10);
  float a=100;
  stroke(b,c,d,a);
  for(float ang=0;ang<=360*8;ang+=5){
  //radiusNoise+=0.05;  
  radius+=0.1;  
  a-=5;
  float thisRadius=radius+(noise(radiusNoise)*250)-100;
  float rad= radians(ang);
  
  x=centX+(thisRadius*cos(rad));
  y=centY+(thisRadius*sin(rad));

  //draw line
  if(lastx>-999){
    line(x,y,lastx,lasty);  
   }
   lastx=x;
   lasty=y;
  } 

}


