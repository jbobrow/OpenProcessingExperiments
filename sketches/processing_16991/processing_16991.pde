
void setup(){
  size(900,500);
  background(0);
  smooth();
}
void draw(){
  if(mousePressed==true){
    fill(0,100);
    strokeWeight(random(1));
    stroke(random(255),random(255),random(255),random(255));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    strokeWeight(random(1.5));
    stroke(random(255),random(255),random(255),75);
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    strokeWeight(random(2));
    stroke(random(255),random(255),random(255),75);
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
    line(mouseX,mouseY,random(width),random(width));
  }
}
void keyPressed(){
  background(0);
}


