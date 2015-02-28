
int rad = 200;

void setup() {
  size(600, 600);
  smooth();
  
}

void draw() {
  background(0);
  
  translate(width/2, height/2);

  for ( int inc=0; inc < 360; inc +=1) {

    float angle1 = random(PI * 2);
    float angle2 = random(PI * 2);

    float x = cos(angle1) * rad;
    float y = sin (angle1) * rad;

    float x2 = cos(angle2) * rad;
    float y2 = sin(angle2) * rad;

    stroke(random(255), random(255), random(255));
    strokeWeight(1);
    line (x, y, x2, y2);
  }
}


