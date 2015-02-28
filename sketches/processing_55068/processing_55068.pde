
int counter;

void setup() {
  size(900,450);
  colorMode(HSB);
  counter = 0;
  noStroke();
}

void draw() {
noStroke();
  fill(random(100,255),random(100,255),random(100,255),random(128,255));
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 20, 20);
    fill(0,0,150);
    rect (width*3/4,height*3/4,width,height);
  }
  if(keyPressed (1) == true && mousePressed == true) {
    ellipse (mouseX, mouseY, 10,10);
  }
    fill(0,0,150);
    rect (width*3/4,height*3/4,width,height);
    fill(0);
    text ("Spray Paint Can", width*3/4+30,height*3/4+40);
}
