

float a=0;

void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){
//4 sets of lines appearing from 2 corners
line(a,a,0,200);
line(200,0,a,a);
line(-a,a,200,200);
line(200,200,a,-a);
//Adding 1 pixel to the the a coordinate
a=a+1;
stroke(a*2);

}


