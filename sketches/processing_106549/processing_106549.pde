
int counter;
int x = 20;
int y = 20;

int dx = 5;
int dy = 8;

void setup(){
  size(600,500);  
  background(0);
  frameRate(60);
}

void draw() {  //draw function loops 
 
 background (255,255,255) ;
 
 fill(255,255,6);
    rect(x,y,25,25,5);
 
    x = x + dx;
    y = y + dy;
 
    if ( x< 0 || x > 475){
       dx = -1 * dx;
    }
 
    if ( y < 0 || y > 475){
       dy = -1 * dy;  
    }
  if (mousePressed) {
  
     x=mouseX
     y=mouseY
  }
 }
