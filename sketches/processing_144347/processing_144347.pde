
float x;
float y;
float px;
float py;
float easing = .05;

void setup(){
  size(1000, 1000);
  smooth();
  stroke(3, 97, 255, 100);
}

void draw(){
  noCursor();
  background(255);
  fill(255);
      
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px, py);
  strokeWeight(weight*100);
  
for(int i = 50; i < 1000; i += 100){
  for(int d = 50; d < 1000; d += 100){

ellipse(i, d, 50, 50);
   
py = y;
px = x;
}
}
}



