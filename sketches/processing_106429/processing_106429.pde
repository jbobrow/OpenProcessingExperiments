
int x = 5;
int y = 5;
int dx = 0;
int dy = 0;


void setup() {  //setup function called initially, only once
  size(1000, 500);
}

void draw() {  //draw function loops 
  background (255,255,255);
  rect (0,0,1000,500);
  rect (50,50,300,200);
  ellipse (x,y,10,10);
  
  if (key == 'd'){
      dx = 1;
  }
  if (key == 'a'){
      dx = -1;
  }
  if (key == 'w'){
      dy = -1;
  }
  if (key == 's'){
      dy = 1;
  }
  x=x+dx;
  y=y+dy;
   if (key == ' '){
      dx = 0;
      dy = 0;
  }
  if (x>1000 && x<0 && y>500 && y<0){
      dx = 0
      dy = 0
  }
 

}
  

