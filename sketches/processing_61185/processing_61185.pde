
void setup(){
size(840,500);
background(0);
smooth();
 }
  
void draw(){
if (mousePressed) {
  stroke(255,255,255,60);
  line (width/2, height/2, mouseX, mouseY);
  
   
}
else{
  noFill();
  stroke(255,255,255,10);
  strokeWeight(1);
  bezier(0, 250, mouseX,mouseY,mouseX,mouseY,width/2, height/2);
  bezier(840, 250, mouseX,mouseY,mouseX,mouseY,width/2, height/2);
   bezier(420, 0, mouseX,mouseY,mouseX,mouseY,width/2, height/2);
  bezier(420, 500, mouseX,mouseY,mouseX,mouseY,width/2, height/2);
}
}     


