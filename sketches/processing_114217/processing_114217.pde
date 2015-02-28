
int x=0;
int y=0;

void setup() {
  size(400, 400);
  background(255);
  frameRate(10);
}

void draw() {
  if (mousePressed) {
    fill(255);
    noStroke();
    rect(0, 0, width, height);
    fill(255, 200, 0);
    ellipse(mouseX, mouseY, x, y);
    if(x<=400){
    x+=10;
    y+=10;
    }
  } 
  else {
    fill(255);
    noStroke();
    rect(0, 0, width, height);
    fill(0, 200, 255);
    ellipse(mouseX, mouseY, x, y);
    if (x>=0){
    x-=10;
    y-=10;
    }
  }
}
