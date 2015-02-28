
void setup(){
    size(420,120);
background(300,25,70);
    smooth();
  }
  
void draw(){
  stroke(0,89,200);
    line(mouseX,100,mouseX,120);
    fill(32,78,90);
    stroke(0,200,100);
    rect(40,mouseY,100,mouseX);
    stroke(10,0,0);
    ellipse(mouseX,mouseY,10,10);

 }


