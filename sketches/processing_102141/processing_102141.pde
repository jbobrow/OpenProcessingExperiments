
int x = 0;
int y = 0;

int speed = 5;
int state = 0;

void setup() {
 size(200, 200); 
}

void draw() {
 background(100);
 noStroke();
 
 fill(255);
 rect(x, y, 50, 50);
 if (state == 0) {
  
   x = x + speed;
   if(x > width - 50) {
     x = width - 50;
     state = 1;
   }
 } else if (state == 1) {
   y = y + speed;
   if (y > height - 50) {
     y = height - 50;
     state = 2;
   }
 } else if (state == 2) {
   x = x - speed;
   if( x < 0) {
     x = 0;
     state = 3;
   }
 } else if (state == 3){
   y = y - speed;
   if (y < 0) {
     y = 0;
     state = 0;
   }
 }
}
