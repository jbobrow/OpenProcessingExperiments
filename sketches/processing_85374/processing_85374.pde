
void setup() {
  size(600 , 600);
  smooth();
  frameRate(24);
}

void draw() {
  float a;
  float b;
  float c;
  a = random(255);
  b = random(255);
  c = random(255);
  ellipse(mouseX,mouseY,random(80),random(80));
  if (keyPressed){
    background(random(255));
    fill(random(255));
    ellipse(300,300,random(300),random(300));
  }
  if (mousePressed){
    fill(a,b,c);
  } else {
    fill(random(255));
  }
  //ellipse(mouseX,mouseY,random(80),random(80));
  if (keyPressed){
    fill(a,b,c);
    ellipse(300,300,random(100),random(100));
  }
}


