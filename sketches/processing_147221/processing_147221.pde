
//when mouse clicked on screen a random shape of random color and size will appear.

//shape variables
float x = 800;
float y = 500;
float x1;
float y1;
float x2;
float w;
float h;
float start;
float stop;

//color variables
float r;
float g;
float b;

//shape chooser
int rShape = 0;

void setup(){
  size(500,300);
  background(200);
}

void draw(){
  if (rShape == 0){
    fill(r, g, b);
    ellipse(x, y, w, h);
  }
  else if (rShape == 1){
    fill(r, g, b);
    rect(x, y, w, h);
  }
  else if (rShape == 2){
    fill(r, g, b);
    triangle(x, y, x1, y1, x2, y);
  }
  else {
    fill(r,g,b);
    arc(x, y, w, h, start, stop);
  }
}
 
void mouseClicked(){
  x = mouseX;
  y = mouseY;
  x1 = mouseX + random(20,100);
  y1 = mouseY - random (20, 100);
  x2 = mouseX + random(50,200);
  start = radians(random(20,150));
  stop = radians(random(90,371));
  w = random(20,100);
  h = random(20,100);
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
  rShape = int(random(0,4));
}


