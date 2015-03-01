
float theta;
int nx = 100, frames=120;

void setup() {
  size(540, 400);
  smooth(4);
  stroke(20);
  fill(255);
  rectMode(CENTER);
}

void draw() {
  background(20);
  float angle=0, r = 0, sz;
  for (int x=0; x<nx; x++) {
    float offSet=TWO_PI/nx*x;
    noFill();
    stroke(255,200);
    float d = map(sin(theta+offSet),-1,1,50,100);
    //d=100;
    float px = map(x, 0, nx-1, width*.15, width*.85);
    float py = height/2 + cos(angle)*d;
    sz= map(sin(theta+offSet),-1,1,15,30);
    pushMatrix();
    translate(px,py);
    rotate(r+theta); 
    rect(15,0,sz,sz*2.5,5);
    popMatrix();
    r += TWO_PI/(nx/2);
    angle+=PI/nx;
  }
  
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

