
void setup(){
  size(400,300);
  
  
  
}

int xpos;
int ypos = 50;
boolean falling = true;
boolean rising = false;

void draw(){

  if (key == 'd' && keyPressed == true){
   
  xpos = xpos + 5;
  
 } 
 
 if (key == 'a' && keyPressed == true){
   
   xpos = xpos - 5;
  
 }
 
 if (rising == true){
   ypos = ypos - 5;
 }
 
 if (falling == true){
   ypos = ypos + 5; 
 }
   
 if (key == 'w' && keyPressed == true){
   rising = true;
   falling = false;
 }  
 
 if (rising == true && ypos < 100){
    rising = false;
    falling = true; 
 }
 
 if (ypos > 175){
    falling = false; 
 }
  
  background(0); 
  rect(xpos,ypos,50,50);
  rectMode(CENTER);
  rect(200,250,400,100);
 
}
