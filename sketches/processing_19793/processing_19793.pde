
//Variables & Conditionals; Bouncing Squares
//ethan dale

//four variables that establish vector and position
float directionx;
float directiony;
float x;
float y;
float directiona;
float directionb;
float a;
float b;


void setup(){
  size(490,350);
  
//initial vector  
  directionx = 1;
  directiony = 1;
  directiona = 1;
  directionb = 1;
}

void draw(){
  background(255);
  
  //red/yellow square
  
  //red rectangle
  fill(#9C1011);
  rect(x+35,y+35,35,35);
  
  //orange rectangle
  fill(#BA5F26);
  rect(x+35,y,35,35);
  
  //red rectangle
  fill(#BA5F26);
  rect(x,y+35,35,35);
  
  //orange rectangle
  fill(#9C1011);
  rect(x,y,35,35);
  
 
  
  
   //statements that establish motion
   x += directionx;
   y += directiony;
   a += directiona;
   b += directionb;
  
  //conditionals that sense the boundaries of the 'stage'
  //pong games start with these statements
  
  
 //red/orange square
   if(x + 70 > width) {
     directionx = -1;
   }
   if(y + 70 > height) {
     directiony = -1;
   }
   if(x < 0) {
     directionx = 1;
   }
   if(y < 0) {
     directiony = 1;
     
     
//blue/white square 
   if(a + 70 > width) {
     directiona = -1;
   }
   if(b + 70 > height) {
     directionb = -1;
   }
   if(a < 0) {
     directiona = 1;
   }
   if(b < 0) {
     directionb = 1;
   }
   }
}

