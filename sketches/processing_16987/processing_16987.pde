
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
float [][] platforms;
int numPlats;
float platHeight;
float platLeftSide;
float platRightSide;
  
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
  numRays = 6;
  angleAround = 0;
  falling = true;
  platforms = new float[10][3];
  
  
  platforms[0] = {210,50,150);
  platforms[1] = {200, 170, 200);
  platforms[2] = {170, 160,width);
  platforms[3] = {50,40,70);
  platforms[4] = {140,0,160);
  numPlats = 5;
  
}
  
void draw() {  //draw function loops
   background(255);
     
  //line( 0,210,150,210);
   i = 0;
   while( i < numPlats){
      line(platforms[i][1], platforms[i][0],platforms[i][2],platforms[i][0]);
      i++;
   
   }
   i = 0;
   /*line( width/2, height/2, width/2 + 20*cos((float)y/10), height/2 + 20*sin((float)y/10));*/
     
    stroke(249,20,45);
    noFill();
   //funct( width - 20, 20,30, PI/2,height-y/50,5);
   stroke(114,200,200);
  // ellipse(width/2,height/2,20,20);
   stroke(238,230,133);
    
   
    
   stroke( 95,95,227)
   
   i = 0;
   
   
    
   i = 0;
   angleAround = 0;
    
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
    
    i = 0;
    
 while( i < numPlats){
    platHeight    = platforms[i][0];
    platLeftSide  = platforms[i][1] - 10;
    platRightSide = platforms[i][2];
    
  if( y < platHeight && ( (y - yv) > platHeight ) && x >= platLeftSide &&  x <=platRightSide ){
     yv = -yv;
  }
    
  
  if( y > platHeight - 10 && ( (y-yv) < platHeight - 10 ) && x  >= platLeftSide && x <= platRightSide){
     yv = 0;
     y = platHeight - 10;
     falling = false;
       
       
  }
  i++;
}
    
  if( keyPressed && !falling ){
      
     yv = yv -2;
       
  }
    
  
     
  
     
     
}
  
  
void funct(float x, float y, float len, float xAxisAngle, float lineAngle, int depth){
  
if( depth > 0){
    
   
   line( x , y, x + len*cos(xAxisAngle + lineAngle), y - len*sin(xAxisAngle + lineAngle), xAxisAngle, lineAngle );
     
   line( x , y, x + len*cos(xAxisAngle - lineAngle), y - len*sin(xAxisAngle - lineAngle), xAxisAngle, lineAngle );
     
  
     
   funct( x + len*cos(xAxisAngle + lineAngle), y - len*sin(xAxisAngle + lineAngle), (float) len/2, xAxisAngle + lineAngle + PI/10, lineAngle - PI/10, depth - 1);
     
     
   funct( x + len*cos(xAxisAngle - lineAngle), y - len*sin(xAxisAngle - lineAngle), (float)len/2, xAxisAngle - lineAngle - PI/10, lineAngle - PI/10, depth - 1);
     
     
     
}
     
  
}
                 

                
                
