
void setup() {
  size (1200,950);
  background(164,231,242);
}

void draw(){
  
  // sol
  
   for(int i=-80; i<800; i= i+3){
  for(int b=-80; b<800; b= b+3){
 
 
 fill(0,100,100);
  line(i,b,400,400);  
 
  
  stroke(20,random(255),50);
  strokeWeight(0);
  
  rotate(-45);
  noLoop();
  
  }
}
//fondo azul

  for(int i=0; i<1200; i= i+10){
  for(int b=0; b<1200; b= b+10){
 

 stroke(0,50,random(255),100);
  strokeWeight(0);

  line(i,b,1300,1300);  
  
  rotate(45);
  

  noLoop();
  
}
  }
}
