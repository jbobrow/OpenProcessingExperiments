

float a=1;

void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){
 //circle with expanding size 
ellipse(100,100,a,a);

a=a+1;

}


