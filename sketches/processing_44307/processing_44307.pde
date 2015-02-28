
void setup(){
  size(500,500);
  background(200);  
} 
void draw(){
  background(20,20,100);
  drawCross(10,10,100,40,5);
  drawCross(10,470,40,40,5);
  drawCross(470,10,40,100,5);
  drawCross(470,470,40,5,1);
  drawCross(mouseX,mouseY,40,1,5);
if(mousePressed){
  stroke(60);
  fill(100,40,100);
}else{
  stroke(255);
  fill(255);
}  
} 
void drawCross(float x, float y,float mySize, int c, float w) {
  stroke(c);
  strokeWeight(w);
  ellipse(x,y,mySize/2,mySize/2);
  ellipse(x+mySize/2,y+mySize/2,mySize,mySize);
}

