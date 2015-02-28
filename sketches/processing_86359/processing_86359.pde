
void setup(){
size(500,500);
noStroke();
}
void draw(){
  background(255);
  fill(0);
  translate(250,250);
  
  for(int j =0; j<2; j++){

    pushMatrix();
  for (int i=0;i<2; i++){
    
  rect(0,-15,10,120);
  rect(20,-15,10,120);
  translate(60,0);
  
  }
  
  popMatrix();
  
  rotate(radians(-90));
  translate(-90,0);
  
  }
  
fill(255);
 rect(0,0,90,90);
  
}




