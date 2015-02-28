


void setup(){
  size(800, 800);
  background(255);
  noStroke();
  frameRate(60);
  smooth();
}
void draw(){

}

void mouseDragged(){

float  r = random(255);
float  g = random(255);
float  b = random(255);
float  a = random(100);
fill(r, g, b, a);
  

for(int i = 0; i < 20; i ++){

float x2 = random(10);
float y2 = random(-5);
float x3 = random(10);
float y3 = random(-5);

  triangle(mouseX, mouseY, x2*i , y2*i, x3*i, y3*i);
}
}

