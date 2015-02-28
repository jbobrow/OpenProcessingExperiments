
int a = 400;
float r = 0;
float g = 0;
float b = 0;

void setup(){
  size(400,400); 
  background(0);
  
  smooth();
}

void draw(){
  noFill();
  rect(0,0,a,a);
 
  stroke(r,g,b,65);
  beginShape();
  vertex(random(0,400), mouseY*2);
  vertex(400- mouseX*2, random(0,400));
  vertex(random(0,400), 400-mouseY*2); 
  vertex(mouseX*2, random(0,400));
  endShape(CLOSE);
  
}

void mouseClicked() {
  if (r == random(0,100)) {
    r = random(0,100);
  } else {
    r = random(0,100);
  }
  
  if (g == random(0,100)) {
    g = random(0,100);
  } else {
    g = random(0,100);
  }
  
  if (b == random(0,100)) {
    b = random(0,100);
  } else {
    b = random(0,100);
  }
}





