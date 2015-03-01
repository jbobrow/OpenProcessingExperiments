
float x, y, theta, cor;

void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB);
  stroke(255, 255, 255);
  rectMode(CENTER);
  strokeWeight(2);
}

void draw() {
  translate(width/2, height/2);
  fill(0, 0.05);
  noStroke();
  rect(0, 0, width, height);
  noFill();
  snake();
}

void snake() {

  strokeWeight(map(sin(theta), -1, 1, 2, 30));
  theta+=TWO_PI/360;
  stroke(cor, 255, 255);
  if (cor < 255) { 
    cor+=1;
  } 
  else {
    cor = 0;
  }

  for (int i = 0; i < 100; i++) {
    point(x, y);
    y+=random(-1, 1);
    x+=random(-1, 1);
  }

  if (x < -width/2 || x > width/2 || y < -height/2 || y > height/2) {
    //saveFrame("min-####.tif");
    background(0);
    y=0;
    x=0;
  }
}

