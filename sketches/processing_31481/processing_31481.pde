
int rabbit = 50;
int y = 250;

void setup(){
  size(500,500);
  noFill();
  loop();
  background(0);


}

void draw(){;
  
//  while(rabbit < 500){
  stroke(255);
  strokeWeight(3);
  noFill();
  ellipse(250, y, rabbit, rabbit);
  rabbit = rabbit + 25;

}

