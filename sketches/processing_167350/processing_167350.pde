
 
float a=0;
float r = 0;


void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){
translate(0,0);  
stroke(204, 102, 0);
  rect(a,a,50, 50); 
a=a+2;

resetMatrix();

translate(0,200);  
stroke(204, 102, 0);
  rect(a,-a,50, 50); 
a=a+2;

resetMatrix();

}


