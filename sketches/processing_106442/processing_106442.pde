
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;

void setup() {  //setup function called initially, only once
  size(300, 400);
  
}

void draw() {  //draw function loops 
  background(255,500,
 0);

  fill (800,8,9)
  ellipse (x,y,50,50);
  
  rect (500,300,300,100);
  if (key == 'd'){
      dx= 1;
  }
  if (key == 'a'){
      dx = -1;
  }
  if (key == 'w'){
      dy= -1;
  }
  if (key == 's'){
      dy = 1;
  }
  if (key == ' '){
      dx= 0;
      dy= 0;
  }
  x = x + dx
  y = y + dy
  }
