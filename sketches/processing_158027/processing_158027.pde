
int counter;
int x;
int y;

void setup() {  //setup function called initially, only once
  size(400,400);
  
}

void draw() {  //draw function loops 
  background(0)
  
  ellipse(x,y,30,30);
  if (key == 'd'){ // right
      x = x+3;}
  if (key == 's'){ // down
      y = y+3;}
  if (key == 'a'){ // left
      x = x-3;}
  if (key == 'w'){ // up
      y = y-3;}
  
  
  }

