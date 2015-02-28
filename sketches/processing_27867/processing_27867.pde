
void setup(){
  background(0);
  size(400, 400);
  smooth();
}
void draw(){
  noStroke();
  
  
  fill(255, 50);
  
  if( mousePressed){ 
  //fill(240, 10, 50, mouseY/2);
stroke(200, mouseX);
ellipse(mouseX, 200, 240, 240);

}else{
fill(0, 0, 0, 10);
  stroke(0,0,0, mouseX);

}
ellipse(200, mouseY, 200, 200);

}

