

float a=1;

void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){

 //circle with expanding size 
ellipse(100,100,a*2,a*2);
ellipse(100,100,a,a);
ellipse(100,100,a/2,a/2);
//a increases by 1
a=a+1;
//redraws the circles once the forst circle reaches that limit
 if (a >300) {
   a=0;
 }


}


