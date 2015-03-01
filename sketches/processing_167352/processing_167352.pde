

float a=0;

void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){
//Two sets of lines appearing from side and top
line(a,0,a,200);
//Blue line
stroke(0,0,200);
line(0,a,200,a);
//Green line
stroke(0,200,0);

//Adding 2 pixels to the the a coordinate
a=a+2;



}


