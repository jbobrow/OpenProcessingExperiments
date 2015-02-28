
float x = 0;
float y = 0;
float s = 0;
float col = 20;

void setup() {
  background(47, 86, 137);
  size(400, 400, P2D);
  smooth(4);
}

void draw(){
   
  if(mousePressed && x < width) {
   
  stroke(0);
  strokeWeight(s);  
  ellipse(width/2, height/2, x, y);
  x++;
  y++;
  s = s + 0.05;
  col++;
  } 
    
    fill(0, col, 0);
  ellipse(width/2, height/2, x, y);
  
  }
  
  void mouseReleased(){
    x = 0;
    y = 0;
    s = 0;
    col = 20;
    background(47, 86, 137);
  }
