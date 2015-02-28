
float theta, sw, sw2, sz, sz2;
int min = 30, max = 350;

void setup() {
  size(500, 500);
  stroke(20);
}


void draw() {
  background(255);

  sz = map(sin(theta), -1, 1, min, max);
  sz2 = map(sin(-theta), -1, 1, min, max);
  sw = map(sin(theta), -1, 1, min, 50);
  sw2 = map(sin(-theta), -1, 1, min, 50);
  noFill();
  if (sz < min+10) fill(20);
  strokeWeight(sw);
  ellipse(width/2, height/2, sz, sz);
  noFill();
  if (sz2 < min+10) fill(20);
  strokeWeight(sw2);
  ellipse(width/2, height/2, sz2, sz2);

  theta += 0.0523/2;
  
  //if (frameCount%2==0 && frameCount <241) saveFrame("image-###.gif");
    
}

