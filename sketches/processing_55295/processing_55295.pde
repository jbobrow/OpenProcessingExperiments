
SlowBall george;

void setup(){
  size(800,600);
  george = new SlowBall();
  
  smooth();
  
}

void draw (){
  background(100);
  george.move();
  george.display();
}

