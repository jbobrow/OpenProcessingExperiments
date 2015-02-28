
int counter;
int i;
int turns;
float angle;
float nextX;
float nextY;
float len;
float phi;
float coeff;
boolean increasing;

float x;
float y;

void setup() {  //setup function called initially, only once
  size(600, 250);
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
  increasing = true;
  
}

void draw() {  //draw function loops 
  

  //x= mouseX;
  //y = mouseY;
  
 background(255);
  
  
  
  
 i = 0;

turns = 6;

drawSpiral(width/2-200,height/2, 2+ mouseX/100, 25, PI/2,1,2);

drawSpiral(width/2-120,height/2,2 + mouseX/100, 20, PI/2,2,2);


drawSpiral(width/2-40,height/2,2+ mouseX/100, 20, PI/2,3,2);

drawSpiral(width/2 + 40,height/2,2+mouseX/100, 20, PI/2,4,2);

drawSpiral(width/2 + 120,height/2,2+mouseX/100, 20, PI/2,5,2);

drawSpiral(width/2 + 200,height/2,2+mouseX/100, 20, PI/2,6,2);




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

void drawSpiral(float x, float y, int turns, float len, float angle, int depth,int depth2){
   
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
      drawSpiral(nextX ,nextY,turns  ,len,mouseY*angle/100 ,depth,depth2 -1);}
      //drawSpiral(nextX,nextY,-turns,len/1.1,-angle,depth-1);
      
      drawSpiral(nextX,nextY,turns,len/1.7,nextAngle ,depth-1,depth2);
   }
}
      
                
