
float a = radians(random(-360, 360));
float b = random(width);
float c = width/2;



void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
  frameRate(30);
}

void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
  noFill();
  smooth();
  for (float i = 0; i < 360 ; i +=1) {
    stroke(i,i,i, 100);
    smooth();
    strokeWeight(random(10));
    //    arc(b, b, i, i, 0, TWO_PI);
    arc(random(500),random(500) , i, i, 0, TWO_PI);
  }
  saveFrame("0703.png");
}



