

float a=0;

void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){
background(0);
 //circle with expanding size 
ellipse(100,100,a,a);
a=a+0.5;

}


