
int x = 100;
int y = 120;

int dx = 0.8;
int dy = 12;

void setup() {  //setup function called initially, only once
  size(750, 300);

}

void draw() {  //draw function loops 
  
  fill(x,255,y);
  ellipse(x,y,100,100);
  y = y+ dy;
  x = x+ dx;
    
  if (y > 280) {
      dy = -dy;
  }
  if (y < 0){
      dy = -dy;
  }
  if (x > 750){
      dx = -dx;
  }
  if (x < 0){
      dx = -dx;
  }
  
  
  if (mousePressed){
      x = mouseX;
      y = mouseY;
  }
  
  
  }
