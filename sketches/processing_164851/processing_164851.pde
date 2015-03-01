
float x = 0.0;
float y = 0;
float easing = 0.03;


void setup (){
  size (300, 300);
 smooth ();
 background (255);
 noStroke ();
 
}

void draw (){
  background (255);
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y =+ (targetY- y) * easing;
  fill (140, 50, 67);
  rect (mouseX, mouseY, 100, 270);
  fill (30, 140, 76, 20);
  rect (x, y, 100, 270);
  
}

  


