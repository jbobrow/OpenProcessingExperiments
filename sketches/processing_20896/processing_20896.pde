
float a = 0; // a integer - rectangle
float sw=0.5; // stroke weight (no defined stroke weight)
float b = 50; // b integer - rectangle 

 
void setup(){
  size(250, 250);
  smooth();
}
 
void draw(){
  background(0);
  strokeWeight(sw); // weight of the stroke 
  noFill();
  frameRate(15); // rate from which the rectangles will repeat themselves
   
  stroke(#E02D39, 150); 
  rect(pmouseX, pmouseY, a, random(100));
  stroke(#F7760C, 150);
  rect(pmouseX, pmouseY, a, random(100));
  stroke(#F7F00C, 150);
  rect(pmouseX, pmouseY, b, random(100));

  a += 4; // rectangle will increase to the right  + Value
  b += 4; 
     
  if(b > 100){ //if statements
  b = -30;  
  }
  if(a > 100){
    a = -30;

  }
}
 
void mouseDragged(){
  sw+=0.5; //dragging increases stroke weight //cred: m. chan
}
 
void mouseReleased(){
  sw = 0.1; //releasing restarts stroke weight//cred: m. chan
  a = 0;
  
  sw = 0.1;
  b=0;
}


