
void setup(){
  size(400,400);
  background(0,0,0);
}

void draw(){
  for (int c = 10; c<height; c+=30){
    for (int i = 20; i<width; i+=50){
    float r = random(3);
    if (r>1){
      squares(i,c);
    }
    else{
    circle(i,c);
  }
    }
  }
  noLoop();
}
//yellow circle
void circle(float x, float y) {
  pushMatrix();
  translate(x,y);
  fill(255,255,0);
  noStroke();
  ellipseMode(CENTER);
  ellipse(0, 0, 30, 30);
  popMatrix();
}
//white square
void squares(float x, float y){
  pushMatrix();
  translate(x,y);
  fill(255);
  rectMode(CENTER);
  rect(0,0,20,20);
  popMatrix();
}

