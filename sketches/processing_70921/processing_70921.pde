
void setup(){
  smooth();
  size(600,750); 
 
 


}


void draw(){
  background(map(mouseY,0,750,0,255),map(mouseX,0,600,0,255),70);
  
  
  
  
  //WITH INTERACTIVE COLORS
  //vertical large rectangle
  fill(map(mouseX,0,600,0,255),map(mouseY,0,750,0,255),150);
  noStroke();
  rect(125,50,350,625);
  
  //first black rect
  fill(0, map(mouseX,0,600,0,255));
  rect(50,100,500,125);
  
  //second black rect
  fill(0, map(mouseY,0,750,0,255));
  rect(50,300,500,125);
  
  //third black rect
  fill(0, map(mouseX,0,600,0,255));
  rect(50,500,500,125); 
  
  

}
