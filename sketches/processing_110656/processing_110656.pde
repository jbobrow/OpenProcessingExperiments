
void setup(){
  size(400,400);
  background(225);
  puntos_aleatorios();
  noFill();
  rect(10,10,380,380);
}
void puntos_aleatorios(){
  
 for(int i=0; i < 300; i++){
 float x= random(22,389);
  float y= random(22,389); 

fill(0); 
 ellipse(x,y,2,2);
 } 
}
