
int x  = 0;
int speed = 1;


void setup() {
  
 size(200, 200);
 smooth(); 
}

void draw(){
 background(255);
 x = x + speed;

 if((x > width) ||  ( x < 0) ) { // 0 > 200  o 0 < 0
  speed = speed * -1;
 }

 stroke(0);
 fill(175);
 ellipse (x, 100, 32, 32); 
  
}
