
int x = 10; 
int y = 10;

void setup() {  //setup function called initially, only once
  size(640, 480);
  background(255);  //set background white
}

void draw() {  //draw function loops 
  background(x/3);
  x = mouseX;
  y = mouseY;
  rectMode(CENTER);
  fill(255,255,0);
  rect(x,y,100,100);
  fill(255);
  ellipse(x-30, y -20, 10,10);
  ellipse(x+30, y -20, 10,10);
  
}
