
void setup (){
  size (500,500);
  background(0);
  frameRate(20); 
}
  void draw() {
    stroke(20);
    fill(0,0,255);
    rectMode(CENTER);
    rect(mouseX,mouseY,100,20);
    
    stroke(20);
    fill(0,0,255);
    rectMode(CENTER);
    rect(mouseX+250,mouseY,200,100);
    
    stroke(20);
    fill(0,0,255);
    rectMode(CENTER);
    rect(mouseX,mouseY+100,200,100);
    
    stroke(20);
    fill(0,0,255);
    rectMode(CENTER);
    rect(mouseX,mouseY+200,40,150);
  } 


