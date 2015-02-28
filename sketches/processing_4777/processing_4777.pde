

  int x = 0;

void setup(){
  size(400,400);
  background(0);
  stroke(255);
  noFill();
 smooth();

}

void draw(){
  strokeWeight(1);
  stroke(random(100,255),random(100,255),random(100,255));
  ellipse(width/2,height/2,x,x);
  stroke(0);
  strokeWeight(3);  // strokeWeight has to be heavier to erase aliased bits of previous line
  ellipse(width/2,height/2,x-10,x-10);
  x = x + 5;
if (mousePressed && (mouseButton == LEFT)) {
  x = 0;
  }
}



