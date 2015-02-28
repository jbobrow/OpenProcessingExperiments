
int x = 50;
int speedX = 1;
 
int x2 = 0;
int speed = 5;
 
void setup() {
  size(400, 400);
  background(70);
  smooth();
}
 
void draw() {
  background(70);
  noStroke();
  fill(20, 20, 20);
  rect(x, 200, 40, 40);
  
  
  if (keyPressed == true && keyCode == RIGHT) {
    if (x >= width) {
      // reset to 0
      x= 0;
    }
    if (x2 >= width) {
      // reset to 0
      x2= 0;
    }
    x= x+speedX;
    x2= x2+speed;
  }
    if (keyPressed == true && keyCode == LEFT) {
   x= x-speedX;
   if(x<0){x=600;}
   }
}


