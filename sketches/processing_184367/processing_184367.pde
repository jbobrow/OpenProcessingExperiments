
void setup() {
  size(500,500);
  background(255);}
  
  void draw() {
    int x = 255; 
    noStroke();
    fill(x,0,0);
    rectMode(CENTER);
    rect(250,250,200,200);
    
    if(mouseX>150 && mouseX<350 && mouseY>150 && mouseY<350) 
    {fill(0,0,x); rect(250,250,200,200);}
    
    
  }
    


