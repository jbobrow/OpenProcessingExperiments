
int abstand =20;


void setup(){
  size(500,500);
  smooth();
  frameRate(200);
 
  
  
}
void draw(){
  
  float s = sin(frameCount/30.0)*200;
  fill(255, 10);
  if (frameCount%20==0) rect(0, 0, width, height);
  
 

 for(int j = 0; j< height/abstand; j++) {
  for(int i = 0; i< width/abstand; i++) {
  
  fill(mouseX,pmouseY,random(200));  
  ellipse(abstand*i,abstand*j,10,10);
  fill(mouseY,pmouseX,random(200),30);
  ellipse(abstand*i+2,abstand*j+2,20,20);
  line(abstand*j+s,abstand*i+mouseX+s,height/3,width);
  }
 }
 
 
   
 if (mousePressed){
 for (int k = 0; k<height/abstand; k++){
   ellipse(abstand*k, mouseX,60,60);
   
   
 }
 }
 
}

