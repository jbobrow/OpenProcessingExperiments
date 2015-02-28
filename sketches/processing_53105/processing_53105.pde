
//I used things we learned in class
//also borrowed some code from a happy accident Nina found in class last week
//hope she doesn't mind.

void setup(){
  size(600,600);
  smooth();
  background(0);
  fill(0,100,100,59);
  noStroke();
}

void draw(){
  background(0);
  float ellSize=10;
  for(int x = 0; x <width; x+=10){
    for(int y = 0; y < height; y+=10){
      ellSize=sin(x*y)*random(50-mouseY);
      rect(x,y,ellSize,ellSize);
    }
  }
}

