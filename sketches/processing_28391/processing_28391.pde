
float c1 = 254;
float c2 = 1;

float c1speed = -1;
float c2speed = 1;

void setup() {
  size(200,200);
  frameRate(50);
}

void draw()  {
  stroke(255);
  fill(c1);
  rect(0,0,100,200);
  stroke(255);
  fill(c2);
  rect(100,0,100,200);
  c1 = c1 + c1speed;
  c2 = c2 + c2speed;
  
  if(c1 == 0 || c1 == 255){
    c1speed = c1speed * -1;
  }
  if(c2 == 255 || c2 == 0){
    c2speed = c2speed * -1;
  }
}

