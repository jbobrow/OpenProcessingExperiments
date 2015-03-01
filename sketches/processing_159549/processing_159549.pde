
int x = 0;
int speed = 1; //speed and x intergers

void setup(){
size (400, 300);
rectMode(CENTER); //set it to center mode
}

void draw(){
  background (20, 40, 170);
  noStroke();
  fill (200, 30, 50);
  rect (x, height/2, 40, 40); //draw a square
  x = x + speed; //x is always adding the speed to itself
  if (x > width || x < 0){ //if x gets more than the width OR (||)
  //less than 0
    speed= speed * -1; //than the speed value becomes negative 
  } //therefore x will be ading negative to itself
}
  



