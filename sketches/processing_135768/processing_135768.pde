
void setup(){
  size(500,500);
  smooth();
  background(20);
}
void draw(){
  frameRate(100);
  strokeWeight(20);
  float r=random(255);
  float m=random(255);
  if(mousePressed==true){
    if (mouseButton==LEFT){
      line(mouseX,mouseY,pmouseX,pmouseY);
    stroke(r/.5,m/.5,120);
  }
  if(mouseButton==RIGHT){
    fill (mouseX,mouseY,120);
    triangle(mouseX,mouseY,mouseX-10,mouseY-10,mouseX+20,mouseY+30);}
}}
