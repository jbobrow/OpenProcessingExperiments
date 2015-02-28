
//Zhaochang He  zhaochah@andrew.cmu.edu
// While Loop
// Copyright Zhaochang He 

  float x = 0;
  float y = 0;
  float a;

void setup() {
  size(400,400);
  smooth();
  background(255);
  frameRate(30);
}

void draw() {
  rectflow();
  rectmove();

}


//display rect
void rectflow(){
  float i = 1;
  
  while( i < height) {
    strokeWeight(1);
    stroke(a, 150, i, 80);
    noFill();
    rect(x, y, i, i*2);
    i = i*1.1;
  }
}

//move rect and set a different location when exceed the wall
void rectmove(){
  if (x> width){
    x=0;
    x=x+5;
  }else{
  x = x + 5;
  }
  
  if (y> height){
    y=0;
    y= y+9;
  }else{
    y=y+7;
  }
}

//press space bar to clear
void keyPressed() {
  if(key ==' '){
    background(255);
  }
}

//mouse click to change color
void mousePressed() {
  a = random(50, 200);
}

