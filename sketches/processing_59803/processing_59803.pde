
void setup(){
  
  smooth();

  size(400,400);  
  background(157,255,208);
  
}

void draw(){
 if(mousePressed){
  
  noStroke();
  noCursor();
  fill(random(0,255), random(0,255), random(100));
 
 ellipse(mouseX,mouseY,mouseX,mouseX);
 }
 else{
   
  //background(157,255,208,30);
  noStroke();
  noCursor();
 
   
 }
}
