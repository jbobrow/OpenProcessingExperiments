
//Inspiration: Nature of Code
//Week 1 Assignment
//Keith Pomana



//Declare Variables
int x = 0;
int y = 0;
void setup() {
 //executed only once
size(500,500);
frameRate(60);
}

void draw(){
  //executed every frame
  background(225, 204, 0);
  fill(159, 10, 159);
  rect(x,y,100,100);
  x= x + 1;
  y= y + 1;
  println(x);
}


