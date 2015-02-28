
int eSize = 3;

void setup() {
 size(800, 800);
  frameRate(30);
  smooth();
  noStroke();
 
  background(0);
}

void draw() {
background(0);
for ( int y = 0; y <= height; y+=random(400)) {
    for ( int x = 0 ; x<= width; x+=random(400)) {
      rect(random(800), random(800), random(30,400), random(30));
      rect(random(800), random(800), random(30), random(30,400));
      ellipse(random(800), random(800), random(100,250), random(100,250));
       fill(random(x,y),random(x,y),random(0),random(75));
    }
  }
}


