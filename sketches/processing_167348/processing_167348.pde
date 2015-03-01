
 
float a=0;
float s = 0;


void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){
  
//redraws the background so that shapes are not drawn ontop of old ones
background(255);

//determines the wavelenght
a=a+0.7;
//exhagerates the effect
s = cos(a)*15;

  translate(100, 100);

   // the sircle is stretched in one dimention 
  ellipse(0, 0, 50, 50+s); 




}


