

int squareSize = 75;
float squareX = 0;
float squareY = 0;


void setup(){
  size (600,600);
  squareX = width/2;
  squareY = height/2;
  background(0);
  rectMode(CENTER);
  
}

void draw() {
  stroke(255);
  float h = random(0, 300);
  colorMode(HSB, 360, 100, 100);
  rect(squareX,squareY, squareSize,squareSize);
  
  if (mouseX > squareX-75 && mouseX < squareX+75 && mouseY > squareY-75 && mouseY < squareY+75) {
      fill(h, 90, 90);
  } 
}


