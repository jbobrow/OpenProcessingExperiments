
void setup() {  //setup function called initially, only once
  size(250, 125);
  background(98);
}

void draw() {  //draw function loops 
//labels first
//textSize(20);
fill(255,0,0);
text("Off",30, 20);
//then the buttons
fill(255,0,0);
rect(30, 30, 55, 55, 7);
//drawRect(255, 0, 0, 30, 30, 55, 55, 7);
//drawRect(0,255,0, 140, 30, 55, 55, 7);
fill(0, 255, 0);
text("On",140, 20);
fill(0, 255, 0);
rect(140, 30, 55, 55, 7);
}

/*
void drawRect(int, red, int green, int blue, int x, int y, int width, int height, int corner){
fill(red,green,blue);
rect(x, y,width, height, corner);
}
*/
