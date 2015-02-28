
void setup(){
  size(500,500);
  noStroke();
  background(255);
}
 
void draw(){
}
 
void mousePressed(){
float p=random(250);
fill(random(255), 100, 255, 50);
rect(mouseX,mouseY,p,p);
}
 
void mouseReleased(){
float t=random(255);
fill(random(255), 100, 255, 50);
rect(mouseX,mouseY,t,t);
}
 
void keyPressed(){
  background(255);
}
