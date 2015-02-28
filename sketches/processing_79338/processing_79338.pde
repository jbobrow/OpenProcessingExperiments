
float centx=350;
float centy=350;
float x1,y1,x2,y2,x3,y3,x4,y4;
  float radius = 200;
  float rNoise=random(10);
  float xNoise=random(10);
  float yNoise=random(10);
  float strokeCol = 0;
  float ang=0;
   
void setup() {
  size(300,700);
  background(255);
  strokeWeight(1);
  smooth();
}
 
 
 
void draw() {
  if (ang<1440) {
      stroke(255,random(255),random(42,255),random(100));
      strokeCol+=1;
      if (strokeCol==255) {
        strokeCol=0;
      }
      //Steps of 0.005-0.03 work best for most applications
      rNoise+=.03;
      xNoise+=.01;
      yNoise+=.01;
      radius=(noise(rNoise)*500)+1;
       
      float rad=radians(ang);
      centx=width/2+(noise(xNoise)*50)-25;

      centy=0;
      x1=centx + (radius*cos(rad));
      y1=centy + (radius*sin(rad));
      float opprad=rad+PI;
      x2=centx+(radius*cos(opprad));
      y2=centy+(radius*sin(opprad));
      
      centx=width/2+(noise(xNoise)*50)-25;

      centy=700;
      x3=centx + (radius*cos(rad));
      y3=centy + (radius*sin(rad));
  
      x4=centx+(radius*cos(opprad));
      y4=centy+(radius*sin(opprad));
       
       
      line(x1,y1,x2,y2);
      
      line(x3,y3,x4,y4);
      ang +=.5;
  }
         
}



