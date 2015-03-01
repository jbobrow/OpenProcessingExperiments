
void setup() {
  size (1200,950);
  background(255);
}

void draw(){
  
  // sol
  
   for(int i=70; i<800; i= i+3){
  for(int b=70; b<800; b= b+3){
 
 

  rect(i,b,400,400);  
 
  
  stroke(20,random(255),50);
  strokeWeight(2);
  
  rotate(45);
  noLoop();
  
  }
}
//fondo azul

  for(int i=0; i<1200; i= i+20){
  for(int b=0; b<1200; b= b+20){
 

 stroke(0,50,random(255),100);
  strokeWeight(0);

  line(i,b,1300,1300);  
  
  rotate(45);
  

  noLoop();
  
}
  }
}
