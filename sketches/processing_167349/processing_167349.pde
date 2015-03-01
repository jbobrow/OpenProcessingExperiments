
 
float a=0;
float s = 0;


void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){
  

scale(s);
s=s+3;
stroke(204, 102, 0);
  rect(0, 0, 50, 50); 


}


