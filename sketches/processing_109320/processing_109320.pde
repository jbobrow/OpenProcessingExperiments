
int border = 50;
float jitter = .03;
float side;
int numPerRow = 12;
int space;

void setup() {
  size(400, 800);  
  background(193);
  noFill();
  smooth();
  side = ((width-(border*2))/float(numPerRow));  
  noFill();
  randomSeed(2);
}

void draw() {
  translate(width/2,height/2);
  scale(.86,.9);
  for(int y = border; y < height-border; y+=side) {
    for(int x = border; x < width-border; x+=side) {
      pushMatrix();
        float center = random(side);
        translate(x-width/2 + center,y-height/2 + center);
        rotate(random(-jitter, jitter));
        rect(-center,-center,side,side);
      popMatrix();
    }
    jitter*=1.28;
  }
  //saveFrame();
  noLoop();
}




