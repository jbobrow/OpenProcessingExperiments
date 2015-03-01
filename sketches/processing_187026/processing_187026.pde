
ivoid setup() {
  size (600,600);
  background(255);
}
 
void draw(){
   
  //sol
   
   for(int i=70; i<2000; i= i+3){
  for(int b=70; b<2000; b= b+3){
  
  
 
 ellipse(i,b,200,400); 
  
   
  stroke(20,random(255),50);
  strokeWeight(2);
   
  rotate(90);
  noLoop();
   
  }
}
//fondo azul
 
  for(int i=0; i<1200; i= i+20){
  for(int b=0; b<1200; b= b+20){
  
 
 stroke(0,50,random(255),100);
  strokeWeight(0);
 
  ellipse(i,b,1300,1300); 
   
  rotate(45);
   
 
  noLoop();
   
}
  }
}

