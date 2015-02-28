
void setup(){
  size(250,250);
  background(255);
  smooth();
}
void draw(){
  if(mousePressed==true){
    fill(0,100);
    strokeWeight(random(.5));
    stroke(random(200),random(200),random(255),random(255));
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
  background(255);
}
           
                
