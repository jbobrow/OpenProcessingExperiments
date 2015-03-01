

float a = 5 + 10;
float b = 0;

void setup() {
  size(500, 500);
  background(250);
  //set the screen size
}

void draw(){
  rect(30,a,b,a);
  a = a+0.5;
  b = b+0.5;
  stroke(100,a,0);
  
  rect(a,50,b,a);
  a = a+0.5;
  b = b+0.5;
  stroke(100,0,b);
  }


