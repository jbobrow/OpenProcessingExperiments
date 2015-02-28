
void setup(){
  size(480,480);
  smooth();
}
void draw(){
  if (mousePressed){
  fill(20);
  }else{
  fill(255);
  }
  ellipse(mouseX,mouseY,80,80);
  noStroke();
  fill(165);
   rect(mouseX,mouseY,60,60);
 
}

