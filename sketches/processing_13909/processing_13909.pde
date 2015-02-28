
void setup(){
  size(500,400);
  background(400,150,50);
  frameRate(50);
  strokeWeight(10);
  stroke(255)
}
  
void draw(){
if(mousePressed == true){
  float v = random(23,57);
  ellipse(mouseX+v,mouseY+v,v,v);
  
  fill(120,115,265,320);
}
}
                

                
                                                
