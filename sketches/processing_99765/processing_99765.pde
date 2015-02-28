
void setup(){
size(500,500);
background(255);
noStroke();
smooth();
}
 
void draw(){
background(255);
fill(255,0,mouseX/2,100);
  rect(0,0,mouseX,mouseY);
  fill(mouseX/2,255,0,100);
  rect(0,0,mouseX,mouseY);
  fill(0,mouseX/2,255,100);
  rect(mouseX/2,height/5,mouseX,mouseY);
}
