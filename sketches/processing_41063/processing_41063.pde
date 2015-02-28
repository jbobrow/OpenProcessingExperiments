
float x=0;
float y=0;
int m=3;

void setup() {
  size(400, 400);
  y=height/2;
  noStroke();
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);

  fill(255);
  ellipse(x, y, 20, 20);

  if(x>width){
    m=m*(-1);
  }
  
  if(x<0){
    m=m*(-1);
  }
  
  x+=m;
}


