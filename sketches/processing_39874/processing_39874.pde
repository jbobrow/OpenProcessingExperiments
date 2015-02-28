
float x = 10.5;

void setup(){
  size(100,100);
  smooth();
}

void draw(){
 background(135,206,350);
 fill(255,255,0);
 arc(x,40,40,40,1.5,4.58); //set moon parameters
 
 x++; //move moon across the screen
 
 if(x>100) { // if the moon goes beyond the screen
   x=0;      //start again at 0
 }
}

