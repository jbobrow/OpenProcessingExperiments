

/* @pjs font="Radley-Italic.otf"; */

int x=0; 
PFont rad; 
PImage hands; 

 


void setup(){ 
  size (500,500); 
  
rad = createFont("Radley-Italic.otf", 400); 
 
  hands = loadImage ("hands.jpg"); 

}
void draw(){ 
  image (hands, 0,0,width,height); 
    textFont (rad, 150); 
 fill (#E30707, 165); 
text ("My Love!", x, x);  
   textFont (rad, 40); 
  fill(255, 200); 
  textAlign(CENTER, CENTER); 
  text("everything carries me to you", width/2, x);


  x=x+2; 
  if (x>height){
    x=0; 
  }





} 



