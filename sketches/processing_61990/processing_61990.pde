
void setup(){
size(840,500);
background(0,255,0);
smooth();
frameRate(60);
 }
   
void draw(){
if (mousePressed) {
  stroke(0,0,0,60);
  strokeWeight(5);
  line (width/2, height/2, mouseX, mouseY);
   
    
}
else{
 noFill();
  stroke(random(255),0,random(255),10);
  strokeWeight(5);
  bezier(0, 250, mouseX,mouseY,mouseX,mouseY,width/2, height/2);
  bezier(840, 250, mouseX,mouseY,mouseX,mouseY,width/2, height/2);
   bezier(420, 0, mouseX,mouseY,mouseX,mouseY,width/2, height/2);
  bezier(420, 500, mouseX,mouseY,mouseX,mouseY,width/2, height/2);
}
}  

