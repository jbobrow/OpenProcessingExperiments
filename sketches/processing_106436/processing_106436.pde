
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;
void setup() {  //setup function called initially, only once
  size(500,600);
 
}

void draw() {  //draw function loops 
  background(255,200,100);
  fill(255,200,100);
  ellipse(x,y,20,20);
  
 
  if (key == 'd' && keyPressed){
     dx = 1;
  }
  
  if (key == 'a' && keyPressed){
     dx = -1;
  }
  if (key == 's' && keyPressed){
     dy = 1;
  }
  if (key =='w' && keyPressed){
     dy = -1;

  }
  fill(0,0,0);
  rect(100,100,25,300);
  if(x>100 && x<125 && y>100 && y<400){
     dx = 0;
     dy = 0;
  }
  x = x+dx;
  y = y+dy;
  
  
 
}
