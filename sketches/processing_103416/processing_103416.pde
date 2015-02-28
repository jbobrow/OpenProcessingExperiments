
int counter = 0;

void setup(){
  size(1500,500);
  background(0);
}

void draw(){
 translate(-400, -100);
 rotate(.25*PI * (.01 *(counter0)));
  stroke(random(255), random(255), random(255), 50+random(50));
  noFill();
  drawShape();
  counter++;
}

void drawShape(){
  beginShape();
  for (int i =0; i < width; i++){
    vertex(random(width*3), random(height*3));
  }
  endShape(CLOSE);
}
