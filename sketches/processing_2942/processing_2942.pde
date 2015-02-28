
float a, b;

void setup(){
  a= 4;
  b= 20; 
  background(255);
  size(700,400); 
  smooth(); 
  
} 



void draw (){ 
  //background(250); 
  for (float x=b; x < width; x=x+50){ 
    for (float y=b; y < height; y=y+50){ 


      //fill(0,10); 
      //noStroke(); 
      //ellipse(a,a,mouseX,mouseY); 

      fill(34,232,237,10); 
      //noStroke(); 
      // ellipse(m,n,a,a); 
      ellipse(x,y,mouseX,mouseX); 
    } 
  } 
} 




