
//circles of random size and random color appear where mouse clicked

//shape varilables
float x = 800;
float y = 500;
float w;
float h;

//color variables
float r;
float g;
float b;

void setup(){
  size(700,400);
  background(200);
}

void draw(){
  fill (r, g, b);
  ellipse(x, y, w, h);
}

void mouseClicked(){
  x = mouseX;
  y = mouseY;
  w = random(20,150);
  h = random(20,150);
  r = random(0,255);
  g = random(0, 255);
  b = random(0,255);
}


