
int globalX = 0;
int globalY = 50;
int speed = 1;

void setup () {
  size(400, 400);
}

void draw () {
  background (200);
  
  //move
  //carMove(1);
  carMove(1);
  
  //bounce
  bounce();
  
  //display
  display(200, 200, 5);
  display(100, 10, 10);
  display(200, 100, 10);
  
  //distance
  distance();
}

void carMove (int speedF) {
  globalX = globalX + (speed * speedF);
}

void bounce () {
  if ((globalX > width) || (globalX < 0)) {
    speed = speed * -1;
  }
}

void display (int x, int y, int carSize) {
  rectMode(CENTER);
  noFill();
  stroke(0);
  rect(x, y, carSize*6, carSize*6);
  rect(x, y, carSize/2, carSize/2); 

}

void distance () {
  


}


                
                
