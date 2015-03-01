
int x = 250;
int y = 250;
int gamestate = 1;
void setup() {  //setup function called initially, only once
  if (gamestate = 1){
  background (255);
  text ("Press Space to Play",200,300);
  }
  size (900,700);
  background (255);
}

void draw() {  //draw function loops 
  noCursor()
  background (255);
  fill (255,0,0);
  ellipse (mouseX,mouseY,25,25);
  }
  void keyPressed (){
  if ( key == ' ' && gamestate = 1){
  gamestate = 2;
  }
  }
  
