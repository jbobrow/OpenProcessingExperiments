
void setup(){
  size(300,300);
 
}

void draw(){

  
 
  

int numberofrect = 4;


  background(255);
rectMode(CENTER);
 rect (150,150,width,height);
  for(int i=0; i < numberofrect; i++){
    rect(random (0,width), 150, 150, random(height)); 
  stroke(255,0,0); 
 noFill();}
 
 for(int i=0; i < 1; i++){
    rect(150,150, random(50,150), 100); 
  stroke(0);
 
 noFill();
 

  }
   

 
 
  }



