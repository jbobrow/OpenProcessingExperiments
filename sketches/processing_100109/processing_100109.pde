
float px = width/2;
float py = 240;
float dx = random(width);
float dy = -10;
float easing = 0.3;
color dColor = color(#C6724A);
color pColor = 255;

void setup() {
  size(480, 320);
  smooth();
  noStroke();
  frameRate(24);
}
void draw() {  
  background(#A7C6F0);
  drop();
  fill(#4AC653);
  rect(0, 250, width, 75);
  player();
  collision();

}

void player(){
  float targetX = mouseX;
  px += (targetX - px) * easing;
  fill(pColor);
  ellipse(px, py, 35, 35);
}

void drop(){
  fill(dColor);
  ellipse(dx, dy, 25,25);
  float targetY = 400;
  dy += (targetY - dy) * easing/5;
  if(dy >=350){
    dy = 0;
    dx = random(width);
    dColor = color(#C6724A);
  }
}

void collision(){
  float pDist = dist(px,py,dx,dy);
  if(pDist <= 30){
    dColor = color(#A7C6F0);
    pColor = color(#FFF581);
  }
  else{
    pColor = 255;
  }
}


