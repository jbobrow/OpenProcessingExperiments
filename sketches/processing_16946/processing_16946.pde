
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
   ellipse(width/2,height/2,20,20);
   stroke(238,230,133);
   i = 0;
    
  
    
   stroke( 95,95,227)
   
   i = 0;
   
   ellipse( width/2, height/2, 34,34);
   
   stroke(255,0,0);
   
    i = 0;
   angleAround = PI/4;
   
   while(i < numRays) {
     // funct( width/2 , height/2 ,30, angle + angleAround,y/50,2);
      funct( width/2,height/2, 30, y/50, angle + angleAround ,5);
      i++;
      angleAround += PI/20;
   }
   
  
    
  
    
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
  
  
void funct(float x, float y, float len, float xAxisAngle, float lineAngle, int depth){
  
if( depth > 0){
    
   
   line( x , y, x + len*cos(xAxisAngle + lineAngle), y - len*sin(xAxisAngle + lineAngle), xAxisAngle, lineAngle );
     
   line( x , y, x + len*cos(xAxisAngle - lineAngle), y - len*sin(xAxisAngle - lineAngle), xAxisAngle, lineAngle );
     
  
     
   funct( x + len*cos(xAxisAngle + lineAngle), y - len*sin(xAxisAngle + lineAngle), (float) len/1.5, xAxisAngle + lineAngle + PI/10, lineAngle - PI/10, depth - 1);
     
     
   funct( x + len*cos(xAxisAngle - lineAngle), y - len*sin(xAxisAngle - lineAngle), (float)len/1.5, xAxisAngle - lineAngle - PI/10, lineAngle - PI/10, depth - 1);
     
     
     
}
     
  
}
                 

                
                                                                

                
                
