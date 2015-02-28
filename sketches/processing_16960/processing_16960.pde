
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
  size(600, 450);
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

turns = 1.5*cos(phi);

drawSpiral(width/2 - 100,height/2,turns, 40, 0,9);

phi = phi + 0.001;

/*if( increasing){
   
phi = phi + 0.001;

} 


if ( !increasing ){
   phi = phi - 0.001;
}

if( phi > PI/2.0001 ){
   phi = PI/2.0001;
   increasing = false;
}

if( phi < -PI/2.0001 ){
   phi = -PI/2.0001;
   increasing = true;
   
}
*/


coeff = coeff + 0.01;
   







}

void drawSpiral(float x, float y, int turns, float len, float angle, int depth){
   
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
      drawSpiral(nextX ,nextY ,turns+ 4 , len/2,-angle,depth-1);
      
      drawSpiral(nextX,nextY,turns,len + (float)180/len,nextAngle,depth-1);
   }
}
      
      
      

                
                
