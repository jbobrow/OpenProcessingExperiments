
float x = 100;
float speed =0.5;
int direction = 1;
int radius = 50;

void setup(){
  size(440,440);
  smooth();
  ellipseMode(RADIUS);
  //noLoop();
}

void draw(){
 background(135,206,350);
 fill(255,255,0);
 //arc(x,40,40,40,1.5,4.58); //set moon parameters
 
 x+= speed * direction; //move moon across the screen
 
 if((x>width-100) || (x<100)) { // change direction
   direction = -direction;  
 }
 
 if (direction == 1) {
   arc(x,60,radius,radius,0.52,5.76); //turn right
 } else {
   arc(x,60,radius,radius,3.67,8.9); //turn left
 }
}


