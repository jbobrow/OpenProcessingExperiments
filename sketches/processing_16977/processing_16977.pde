
int counter;
int i;
int j;
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
  size(800, 400);
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
  j = 0;
  increasing = true;
  
}

int[] depths;

int i =0;

depths = new int[8];

while( i < 8){
   depths[i] = random(8) % 8;
   i++;
}

void draw() {  //draw function loops 
  

  //x= mouseX;
  //y = mouseY;
  
 background(255);
  
  
  
  
 i = 0;
j =0;
turns = 6;

while( j < 3){

   while( i < 8){
      drawSpiral((95)*i,height - 50 - j*100, 2+ mouseX/50, 20, PI/2,i,j+1);

      i++;
   }
   i = 0;
   j++;
}



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
  // stroke( 122,186,221);
   }
   else{
  // stroke (255,0,0);
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
      drawSpiral(nextX ,nextY,turns   ,len,(80+mouseY)*angle/100,depth,depth2 -1);}
      //drawSpiral(nextX,nextY,-turns,len/1.1,-angle,depth-1);
      
      drawSpiral(nextX,nextY,turns,len/1.7,nextAngle ,depth-1,depth2);
   }
}
 

                
                
