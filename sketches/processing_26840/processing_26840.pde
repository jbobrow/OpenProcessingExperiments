
//Louisa  2011

//DECLARE VARIABLES
BlackDot dot1, dot2;

//INITIAL SETTINGS
void setup(){
   size(600,400);
   smooth();
   dot1= new BlackDot();
    dot2= new BlackDot();
   
}

//REPEAT
void draw(){
  background(204);
  dot1.showDot();
  dot1.moveDot();
  
  dot2.showDot();
  dot2.moveDot();
}

//EVENT HANDLERS

//CUSTOM FUNCTIONS

//CLASSES
class BlackDot{
  float xPos;
  float yPos;
  float speed;
  
  BlackDot(){
 xPos= random(20, width -20);   
 yPos= random(20, height - 20);
 speed= random (1,5);
  }
 
 void showDot(){
  fill(0);
 ellipse(xPos, yPos, 20,20); 
 }
 void moveDot(){
  xPos+= speed;
 if(xPos> width){
   xPos=0;
 } 
 }
 
}

