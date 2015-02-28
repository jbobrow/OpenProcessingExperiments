
int counter;
int i;
int turns;
float angle;
float nextX;
float nextY;
float len;
float phi;
float coeff;
float p;
boolean increasing;

float x;
float y;
float xv;

void setup() {  //setup function called initially, only once
  size(700, 500);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  turns = 4;
  x = width/2;
  y  = height/2;
  angle = 0;
  len = 5;
  phi = 0;
  coeff = 2;
  p = 0.25
  increasing = true;
  xv = 3;
  x = 0;
  
}

void draw() {  //draw function loops 
  

  //x= mouseX;
  //y = mouseY;
  
 background(255);
  
  
  
  
 i = 0;

turns = 6;
int j = 7;
p = 0.25;
stroke(0,0,0);
if( x < 0){
   x = 0;
   xv = -xv;
}

if( x > width - 10){
   x = width - 10;
   xv = -xv;
}
x = x+xv;
//rect( x,height-20,10,10);




drawSpiral( 200, height/2 - 70 , x/200, 20, PI/2,4,j,p);
drawSpiral_a( 500, height/2 - 70 , x/200, 20, PI/2,4,j,p);
drawSpiral_b( 200, height/2 + 200 , x/200, 20, PI/2,4,j,p);
drawSpiral_c( 500, height/2 + 200 , x/200, 20, PI/2,4,j,p);






i = 0;







if( increasing){
   
phi = phi + 0.001;

} 


if ( !increasing ){
   phi = phi - 0.001;
}

if( phi > PI/3 ){
   phi = PI/3;
   increasing = false;
}

if( phi < -PI/3 ){
   phi = -PI/3;
   increasing = true;
   
}



coeff = coeff + 0.01;
   







}

void drawSpiral(float x, float y, int turns, float len, float angle, int depth,int depth2,float p){
   
   if( depth % 2 == 0 ){
   stroke( 122,186,221);
   }
   else{
   stroke (255,0,0);
   }
   
   if(depth > 0){
      float nextX;
      float nextY;
      float nextAngle;
      
      nextX = x + len*cos(angle);
      nextY = y - len*sin(angle);
      
      line(x,y,nextX,nextY);
      
      nextAngle = angle + PI/(float)turns;
      
      //drawSpiral(nextX,nextY, turns +4, len/1.1, angle,depth-1);
      //drawSpiral(nextY ,nextX ,(turns  )  , len/1.1,-angle,depth-1);
      
      if( depth2 > 0) {
      drawSpiral(nextX ,nextY,turns/ p  ,len,abs(mouseY)*angle/100 ,depth,depth2 -1,p);}
      //drawSpiral(nextX,nextY,-turns,len/1.1,-angle,depth-1);
      
      drawSpiral(nextX,nextY,turns,len/1.7,nextAngle ,depth-1,depth2,p);
   }
}


void drawSpiral_a(float x, float y, int turns, float len, float angle, int depth,int depth2,float p){
   
   if( depth % 2 == 0 ){
   stroke( 122,186,221);
   }
   else{
   stroke (255,0,0);
   }
   
   if(depth > 0){
      float nextX;
      float nextY;
      float nextAngle;
      
      nextX = x + len*cos(angle);
      nextY = y - len*sin(angle);
      
      line(x,y,nextX,nextY);
      
      nextAngle = angle + PI/(float)turns;
      
      //drawSpiral(nextX,nextY, turns +4, len/1.1, angle,depth-1);
      //drawSpiral(nextY ,nextX ,(turns  )  , len/1.1,-angle,depth-1);
      
      if( depth2 > 0) {
      drawSpiral_a(nextX ,nextY,turns - p  ,len,abs(mouseY)*angle/100 ,depth,depth2 -1,p);}
      //drawSpiral(nextX,nextY,-turns,len/1.1,-angle,depth-1);
      
      drawSpiral_a(nextX,nextY,turns,len/1.7,nextAngle ,depth-1,depth2,p);
   }
}





void drawSpiral_b(float x, float y, int turns, float len, float angle, int depth,int depth2,float p){
   
   if( depth % 2 == 0 ){
   stroke( 122,186,221);
   }
   else{
   stroke (255,0,0);
   }
   
   if(depth > 0){
      float nextX;
      float nextY;
      float nextAngle;
      
      nextX = x + len*cos(angle);
      nextY = y - len*sin(angle);
      
      line(x,y,nextX,nextY);
      
      nextAngle = angle + PI/(float)turns;
      
      //drawSpiral(nextX,nextY, turns +4, len/1.1, angle,depth-1);
      //drawSpiral(nextY ,nextX ,(turns  )  , len/1.1,-angle,depth-1);
      
      if( depth2 > 0) {
      drawSpiral_b(nextX ,nextY,turns + p  ,len,abs(mouseY)*angle/100 ,depth,depth2 -1,p);}
      //drawSpiral(nextX,nextY,-turns,len/1.1,-angle,depth-1);
      
      drawSpiral_b(nextX,nextY,turns,len/1.7,nextAngle ,depth-1,depth2,p);
   }
}
  
  
void drawSpiral_c(float x, float y, int turns, float len, float angle, int depth,int depth2,float p){
   
   if( depth % 2 == 0 ){
   stroke( 122,186,221);
   }
   else{
   stroke (255,0,0);
   }
   
   if(depth > 0){
      float nextX;
      float nextY;
      float nextAngle;
      
      nextX = x + len*cos(angle);
      nextY = y - len*sin(angle);
      
      line(x,y,nextX,nextY);
      
      nextAngle = angle + PI/(float)turns;
      
      //drawSpiral(nextX,nextY, turns +4, len/1.1, angle,depth-1);
      //drawSpiral(nextY ,nextX ,(turns  )  , len/1.1,-angle,depth-1);
      
      if( depth2 > 0) {
      drawSpiral_c(nextX ,nextY,turns * p  ,len,abs(mouseY)*angle/100 ,depth,depth2 -1,p);}
      //drawSpiral(nextX,nextY,-turns,len/1.1,-angle,depth-1);
      
      drawSpiral_c(nextX,nextY,turns,len/1.7,nextAngle ,depth-1,depth2,p);
   }
}
              
 
                
                                                                
