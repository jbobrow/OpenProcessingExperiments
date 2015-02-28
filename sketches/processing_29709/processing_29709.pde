
// ball objects bouncing off walls

Random generator;
Ball[] balls;
int count = 400;


void setup() {
  size(400, 400);
  background(0);
  smooth();
  noStroke();
  colorMode(RGB,255,255,255,100);
  frameRate(90);
  
  generator = new Random();  
  balls = new Ball[count];
  

  
  int index=0;
  for(int i=0; i<count; i++)
  { 
    float r=getR();
    float g=getG();
    float b=getB();    
    balls[i] = new Ball(color(r,g,b), random(width), random(height), random(1), random(1));
  }
  
  
}

void draw() {
 // Create an alpha blended background
 double flv = generator.nextGaussian();
 float fv=((float)flv)*3;
 fill(0, fv);
 rect(0,0,width,height);
  for(int j=0; j<count;j++)
  { 
    balls[j].move();
    balls[j].display(random(50));    
  } 
}

float getR(){
  //get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float r = (float) generator.nextGaussian();
  //define standard deviation and mean
  float sd = 30; float mean = 200;
  //scale by standard deviation and mean
  //also constrain to between (0,255) since we are dealing with color
  r = constrain((r * sd) + mean,0,255);
  return r;
}

float getG(){
  float g = (float) generator.nextGaussian();
  float sd = 20; float mean = 120;  
  g = constrain((g * sd) + mean,0,255);  
  return g;
}

float getB(){
  float b = (float) generator.nextGaussian();
  float sd = 25; float mean = 0;  
  b = constrain((b * sd) + mean,0,255); 
  return b;
}



class Ball 
{
 color c;
 float yp;
 float xp;
 float xspeed;
 float yspeed;
 float dia;
 
 Ball(color tc, float txp, float typ, float txspeed, float tyspeed){
   c=tc;
   xp=txp;
   yp=typ;
   xspeed=(txspeed-.5)*2;
   yspeed=(tyspeed-.5)*2;
   ellipseMode(CENTER);
 }
 
  void move(){
   if(xp>=width||xp<0){
    xspeed=xspeed*-1;
   }
   xp=xp+xspeed;
   if(yp>=height||yp<0){
    yspeed=yspeed*-1;
   }
   yp=yp+yspeed;   
  }
  
  void display(float d){
   dia=abs(noise(d))*(width/6);
   double fillv = generator.nextGaussian();
   float fv=((float)fillv+10);
   fill(c,fv);
   ellipse(xp,yp,dia,dia);
  }
  
}

