
 
float a=0;
float s = 0;
float r = 0;

void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){
  
//redraws the background so that shapes are not drawn ontop of old ones
background(255);


a=a+0.4;
  translate(100, 100);
  
     s = cos(a)*2;
 scale(s);
  rotate(r);
  ellipse(0, 0, 50, 50); 

  
r=r+0.1;




}


