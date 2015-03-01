
PImage p0, p1;

void setup(){
  size(900,600);
  p0 = loadImage("3.png");
  p1 = loadImage("adventure_time_background_by_fleecy718-d51l18c.jpg");
  imageMode(CENTER);
}

void draw(){
  background (p1);
  image(p0, mouseX, mouseY);
  
}

void mouseMoves(){
  
}


