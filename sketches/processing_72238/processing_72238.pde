
float myNum;//declare
float x;
float dir;

void setup(){
  //runs once @ startup
  size(360,360);
  colorMode(HSB, 230,96,93);
  dir= 2;
  
}

void draw(){ //
  background(255);
  //shapes
  myNum = myNum +1;
 x +=dir;
 println (dir);
  ellipse(x,100,50,50);
  if( x > width){
    dir = -2;
  if( x < 0);
   
 
    
  }
}
