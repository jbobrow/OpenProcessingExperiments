
PImage hg, invisible;
float x, y;
float easing = 0.05;


void setup(){
  size(500, 500);
  hg = loadImage("hg.png");
  invisible = loadImage("invisible.png");
}

void draw(){
  if (mousePressed){
  } else {
    imageMode(CORNER);
    image(hg, 0, 0);
  }
  
  float targetX = mouseX;
  float targetY = mouseY;
  
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  
  imageMode(CENTER);
  image(invisible, x, y);
}


