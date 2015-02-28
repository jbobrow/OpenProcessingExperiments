
float rotation = 0;

void setup() {
  size(600, 600);
  //noLoop();
}


void draw() {
  fill(255,255,0,10);
  pushMatrix();
  translate(200,200);
  rotate(radians(rotation));
  rect(15,15,50,50);
  rect(0,150,100,100);
  rotation += 5;
  popMatrix();
  }
