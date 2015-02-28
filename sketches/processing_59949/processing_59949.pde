
// taken from Visual PRocessing for Artists 
// by Andrew Glassner

int MaxDepth=4;
float Theta=0;

void setup() {
  size(500,500);
  noStroke();
}

void draw() {
  background(119,112,127);
  translate(250,250);
  scale(240.0);
  drawCircles(1);
  Theta+=radians(1);
}

void drawCircles(int depth) {
  switch(depth) {
    case 1: fill(color(89,2,21)); break;
    case 2: fill(color(148,14,35)); break;
    case 3: fill(color(181,86,70)); break;
    case 4: fill(color(199,172,115)); break;
    default: return;
  }
  ellipse(0,0,2,2);
  
  for (int i=0; i<3; i++) {
    pushMatrix();
    rotate(Theta+radians(i*120));
    translate(0,0.6);
    scale(0.4);
    drawCircles(depth+1);
    popMatrix();
  }
}

