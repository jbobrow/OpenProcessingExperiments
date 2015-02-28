
void setup(){
  size(300,300);}
  
  void draw(){
    if (mousePressed) {
fill(0);
} else {
    
  
    float x= mouseY;
    float y= mouseX;
    smooth();
  background(247,214,130);  
    
    noStroke();
    fill(34,56,78,70);
    ellipse(mouseX,mouseY,50,50);}
  }

