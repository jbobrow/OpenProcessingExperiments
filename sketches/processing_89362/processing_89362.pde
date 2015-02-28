
float x;

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);
  
  x = 100;
}

void draw() {
  background(255);
  
  fill(255);
  rect(100,150,200,100);
  
  if(x < 301){
    x++;
  }
  if(x > 300){
    x = 100;
  }
  
  fill(200);
  ellipse(x,200,30,30);
}
