
//Guilherme Vargas Garcia


float x;
float y;
float easing = 0.01;

void setup() {
  size(500, 500); 
  noFill();
}

void draw() { 
  background(20);
  
  float distanceX = mouseX - x;
  if(abs(distanceX) > 1) {
    x += distanceX * easing;
  }
  
  float distanceY = mouseY - y;
  if(abs(distanceY) > 1) {
    y += distanceY * easing;
  }
  
  for (int a = 0; a <= width; a += 50){
    for (int b = 0; b <= height; b += 50){
      float distance = dist(a,b,mouseX,mouseY);


      stroke(y,x,b,60);
      ellipse(a,b,distance+x,distance+y);

    }
  }  
}
