
int counter;
float xv;
float x;
float y;
float yv;
float ya;
int i;
float angle;
float angleAround;
int numRays;
boolean falling;
  
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  x = 20;
  xv = 1;
  y = 4;
  yv = 0;
  ya = 0.05;
  i = 0;
  angle = 0;
  numRays =2;
  angleAround = 0;
  falling = true;
}
  
void draw() {  //draw function loops
   background(255);
     
   line( 0,210,150,210);
   
     
    stroke(249,20,45);
    noFill();
  
   
   
   stroke(114,200,200);
   fill(114,200,200);
   ellipse(width/2,height/2,20,20);
   noFill();
   stroke(238,230,133);
   i = 0;
    
  
    
   stroke( 95,95,227)
   
   i = 0;
   
   
   ellipse( width/2, height/2, 34,34);
   
   stroke(255,0,0);
   
    i = 0;
   angleAround = PI/4;
   
  
      drawSpiral( width/2,height/2,0.5+x/100,20,PI/2,3,7, 150- ( height-y));
      drawSpiral( width/2,height/2,-0.5-x/100,20,PI/2,3,7,150 - height - y);
      
   
   
  
    
  
    
   angle = angle + PI/300;
    
   stroke(0,0,0);
   rect(x,y,10,10);
    
    
 
   x = x + xv;
     y = y + yv;
     
    
  
    
  if( x > width - 10){
     x = width - 10;
     xv = -xv;
  }
    
  if( x < 0 ){
     x = 0;
     xv = -xv;
  }
    
  if( falling ){
     yv = yv + ya;
  }
    
  if( y > height - 10){
     yv = 0;
     y = height - 10;
     falling = false;
  }
    
  if( y < height - 10){
     falling = true;
  }
    
    
    
    
    
  if( y < 210 && ( (y - yv) > 210 ) && x <150 ){
     yv = -yv;
  }
    
  if( y > 200 && ( (y-yv) < 200 ) && x < 150){
     yv = 0;
     y = 200;
     falling = false;
       
       
  }
    
  if( keyPressed && !falling ){
      
     yv = yv -2;
       
  }
    
  
     
  
     
     
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
      drawSpiral(nextX ,nextY,abs(turns)  ,len,p*angle/100 ,depth,depth2 -1,p);}
      //drawSpiral(nextX,nextY,-turns,len/1.1,-angle,depth-1);
      
      drawSpiral(nextX,nextY,turns,len/1.7,nextAngle ,depth-1,depth2,p);
   }
}        
                                                                


                
                
