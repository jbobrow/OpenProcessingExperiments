
int abstand = 8;

void setup(){
  size(600, 600);
  smooth(6);
  background(230);
  rectMode(CENTER);
}

void draw(){

for (int i = 0; i<300; i++){
  
  float x = random(0, width);
  float y = random(0, height);
  float d = abstand*round(random(5, 15));

  stroke(73, 117, 101);
  strokeWeight(1);
  fill(230);
  while (d > abstand){
    d -= abstand;
    polygon(x, y, d, 7);
  }


  noFill();
  stroke(230);
  strokeWeight(160);
  rect(width/2, height/2, width, height);

  }

  stop();

}


void polygon(float x, float y, float radius, float npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

