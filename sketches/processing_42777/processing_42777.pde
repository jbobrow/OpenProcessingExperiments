
float x;
float y;
float pmouseY;
float pmouseX;
float easing = 0.1;

void setup(){
  size(500,500);
  background(255);
  smooth();
  }

void draw(){
  if (mousePressed && (mouseButton == LEFT)){
    fill(0);
    strokeWeight(1);
    stroke(0,50);
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
   line(mouseX, mouseY, pmouseX, pmouseY);
   pmouseY = y;
   pmouseX = x;
}

  if (mousePressed && (mouseButton == RIGHT)){
    fill(255,10);
    noStroke();
    rect(0,0,500,500);
    
  }
  

}

