
int x = 250;
int y = 250;
boolean moveup;
boolean movedown;
boolean moveleft;
boolean moveright;
void setup() {  //setup function called initially, only once
  
  size (500,500);
  background (255);
}

void draw() {  //draw function loops 
  noCursor()
  background (255);
  fill (random(0,255),random(0,255), random (0,255));
  if (moveup == true) {
  y+=5;
  ellipse (x, y,25,25);
  if (moveup == true) {
  y+=5;
  }
  }
  void keyPressed (){
  if (key== w){
  moveup == true;
  }
  }
