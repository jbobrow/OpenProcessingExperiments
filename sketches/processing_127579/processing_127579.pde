
int x = 50;        // variables
int y = 50;

int dx = 9;        // velocity (9,5)
int dy = 5;

void setup() {  //setup function called initially, only once
  size(500, 250);
  background(255);  //set background white

}

void draw() {  //draw function loops 
  background(255);
  ellipse(x,y,20,20);
  x = x + dx;
  y = y + dy;
  
 if(mousePressed){
  x = mouseX;
 y = mouseY; 
  }
if (x > 500) {
dx = -9; 
}

else if (x < 0) {
dx > 9 }
}
  
if (y > 250) {
dy *= -1 ;
}
