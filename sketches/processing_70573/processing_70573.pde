
float rad = 50;
float inc = 0;

int ballSize = 100;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  translate(width/2, height/2);

  for ( int inc=0; inc < 720; inc +=10) {
    float angle = radians(inc);
    float x = cos(angle) * rad;
    float y = sin (angle) * rad;
    rotate(radians(45));
    rect(0, 0, x*10, y*20);
    
    stroke(random(255), random(255), random(255));
    noFill();
    ellipse (x, y, ballSize, ballSize);
    line(0, 0, x*10, y*10);
    ellipse (x, y, ballSize*3, ballSize*3);

  
  }
 
}


