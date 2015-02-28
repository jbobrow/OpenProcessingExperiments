
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;

void setup() {  //setup function called initially, only once
  size(250, 250);
  
}

void draw() {  //draw function loops 
  ellipse(x,y,20,20);
  
  if (keyPressed){
      fill(0,0,255);
  }
  
  else {
  dy = 0;
  dx = 0;
      
      }
      
      if (key == 'd'){
          dx = 1;
          dy = 0;
          }
     
      else if (key == 'a'){
          dx = -1;
          dy = 0;
          }
          
    else {
      fill(255,0,0);
  }
  
      if (key == 's'){
      dy = 1;
      dx = 0;
      }
     
     else if (key == 'w'){
     dy = -1;
     dx = 0;
     }
     
  x = x + dx;
  y = y + dy;
  
  }
