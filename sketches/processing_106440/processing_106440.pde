
int x = 20;
int y = 20;
int counter;
int dx = 0;
int dy = 0;

void setup() {  //setup function called initially, only once
  size(300, 400);
  background(255,200,0);  //set background white
}

void draw() {  //draw function loops 
  ellipse (x,y,20,20);
  fill(20,100,255,50);
  rect (100,100);
if (key == 'd' ) {
    x = x + 1;
 }

if (key == 'a' ) {
    x = x - 1;
 }

if (key == 'w' ) {
    y = y - 1;
 }

if (key == 's' ) {
    y = y + 1;
 }
  
}
