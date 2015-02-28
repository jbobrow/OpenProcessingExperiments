
//SKETCH BOOK//

float x=constrain(10,5,5);
float y=0;



void setup(){
  size(600,600);
  background(255);
}
void draw(){
  
  if(mousePressed){
    fill(0);
      }
      
  else {
        fill(255);
    
  }
  rect(mouseX,mouseY,x,y);
  
  if(mousePressed){
    
    stroke(0);
  }
  
  else{
    
    noStroke();
    
  }
  
}
