
int count;

void setup() {
  size(320,240);
  background(255);
  count = 0;
}

void draw() {
  //no action on draw
}

void mouseClicked() {
  //clear the screen after 100 rectangles
  if(count > 50) {
    background(255);
  }
  //creates a random fill color for the rectangle
  int r = int(random(0,255));
  int g = int(random(0,255));
  int b = int(random(0,255));
  fill(r,g,b,128);
  
  //random size of the rectangle
  int w = int(random(20,100));
  int h = int(random(20,100));
  rectMode(CENTER);
  
  println("r:"+r+" g:"+g+" b:"+b+" w:"+w+" h:"+h);
  rect(mouseX,mouseY,w,h);
  
  count++;
}

