
void setup(){
  size(600,450);
  background(255,239,174);
  frameRate(20);
  noStroke();
}
 
void draw(){
if(mousePressed == true){
  float v = random(5,35);
  ellipse(mouseX+v,mouseY+v,v,v);
 
  fill(0,194,213,100);
}
}
                
                
