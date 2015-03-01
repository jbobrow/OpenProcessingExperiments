

float a=0;

void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){
//Two sets of lines appearing from both corners
line(a,a,0,230);
line(200,0,a,a);
//Adding 2 pixels to the the a coordinate
a=a+2;
stroke(a);

}


