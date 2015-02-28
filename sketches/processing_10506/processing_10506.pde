
void setup() {
  size(200,200);
  frameRate(random(10,25));
  smooth();
  colorMode(HSB,100);
  //sitanokao
    noStroke();
    ellipse(100, 100, 180, 180);
    stroke(0);
    fill(0);
    ellipse(60, 60, 30, 30);
    ellipse(140, 60, 30, 30);
    noFill();
    strokeWeight(2);
    arc(100, 100, 100, 100, 0, PI);
}


void draw() {
  smooth();
  translate(random(width),random(height));
  rotate(random(-PI/6,PI/6));
  scale(random(0.2,2.0));
  drawSmile(0, 5);
}


void drawSmile(int x, int y){
    noStroke();
    fill(random(75,90),99,99,80);
    ellipse(x , x , x +60, x +60);
    strokeWeight(1);
    stroke(0);
    fill(0);
    ellipse(x -10, x -10, y, y);
    ellipse(x +10, x -10, y, y);
    noStroke();
    arc(x, x, 30, 30,0, PI);
}


