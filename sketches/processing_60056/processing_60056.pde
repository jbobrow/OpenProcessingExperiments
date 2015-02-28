
void setup(){
  size(400,300);
  background(29,77,113);
  frameRate(5);
  rectMode(CENTER);
  smooth();
  noCursor();
}

void draw(){
  noStroke();
  fill(random(0,255));
    ellipse(mouseX,mouseY,20,20);
    ellipse(mouseX+20,mouseY,20,20);
    ellipse(mouseX-20,mouseY,20,20);
    ellipse(mouseX,mouseY+20,20,20);
    ellipse(mouseX,mouseY-20,20,20);
    
  if(mousePressed){
    fill(225,255,8);
      ellipse(mouseX,mouseY,20,20);
    fill(196,8,255);
      ellipse(mouseX+20,mouseY,20,20);
    fill(8,255,166);
      ellipse(mouseX-20,mouseY,20,20);
    fill(225,99,8);
      ellipse(mouseX,mouseY+20,20,20);
    fill(255,8,144);
      ellipse(mouseX,mouseY-20,20,20);}
      
      }
