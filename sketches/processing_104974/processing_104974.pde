
float x = 0;
float y = 0;
float xPos = 2;
float yPos = 1.5;

void setup(){
  size(600,600);
  smooth();
}

void draw(){  
  noStroke();
  background(0);
  fill(0,0,200);
  
  x = x + xPos;
  y = y + yPos;
  
if ((x >width) || (x < 0)) {
  xPos = xPos * -1;
}

if ((y > height) || (y < 0)){
  yPos = yPos * -1;
}

ellipse(x, y, 50, 50);

}
