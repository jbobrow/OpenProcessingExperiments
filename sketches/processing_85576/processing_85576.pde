
float r=0;
float i=0;
float w=8;
float checker = 0;
void setup() {
 size(500, 500);
  background(1);
 
  smooth();
  frameRate(60);
  
}
 
void draw() {
 if (int(i)==150){
  i=0;
 r=0;
w=8;
checker++;
if (int(checker)==3)
checker=0;
filter(BLUR, 3);
filter(GRAY);
 }
 
  float x =r*cos(i);
  float y =r*sin(i);
  
  
        
   float a = random(1,255);
   float b = random(1,255);
   float c = random(1,255);
      stroke(a,b,c, 255);      
      strokeWeight(1);      
      fill(a,b,c,255);
      if(checker==0)
      ellipse(x+width/2,y+width/2,w,w);  
      if(checker==1)
      triangle(x+width/2,y+width/2,x+width/2-x,y+width/2+y,x+width/2+x,y+width/2+y);
      if(checker==2)
      quad(x+width/2,y+width/2,x+width/2-x,y+width/2+y,x+width/2+x,y+width/2-y,x+width/2+x,y+width/2-y);
    
  
  i+=.1;
  r+=.2;
  w+=.1;
  
  
}




