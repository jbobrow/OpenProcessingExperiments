
class clouds{
//GLOBAL VARIABLES
 float x= 0;
 float y= 0;
 float speedX = 2;
 

// CONSTRUCTION
clouds(float _x, float _y){
  
  x = _x;
  y = _y;

}

//FUNCTION 
void run(){
  display(); 
  move();
  bounce();
}

void bounce(){
  if(x > 399) {
    speedX = speedX * -1;
  }
  if(x< 0) {
    speedX = speedX * -1;
  }
}

void move(){
 x += speedX;
}


void display() {
 fill(255);
  ellipse (x, 60, 25, 25);
    ellipse (x+60, 60, 25, 25);
    rect(x, 60-12.25, 60.5, 25.25);

}
}

