
void setup() {
  size(400,400);
  colorMode(RGB);
  background(255);
}

void draw() {
  for(int a= 20; a<height; a+=20) {
    for( int b=20; b<width; b+=40) {
      float rand = random(8);
      if (rand>4) {
        patch (a, b);
      }
      else {
        patch2(b,a);
      }}}
      
      noLoop();
}
//creates the first image which is not likely to be generated but sometimes does
void patch2(float x, float y){
  pushMatrix();
  translate(x,y);
  ellipseMode(CENTER);
  fill(random(100,300));
  ellipse(10,10,5,5);
  popMatrix();
}
//creates the rectangles which are generated in two sizes
//a large one
//and a small one
void patch(float x, float y) {
  pushMatrix();
  translate(x,y);
  noFill();
  strokeWeight(2);
  stroke(30);
  rectMode(CENTER);
  rect(x,y,20,20);
  popMatrix();
}

