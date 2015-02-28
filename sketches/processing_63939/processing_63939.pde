
int hV,sV,sizeX,sizeY;

void setup(){
  size(500,500);
  colorMode(HSB,100);
  background(hV,sV,50);
  noLoop();
  sizeX = 50;
  sizeY = 50;
}

void mousePressed(){
  loop();
}

void mouseReleased(){
  noLoop();
}
  
void draw() {
  hV = mouseX/5;
  sV = mouseY/5;
 stroke(0);
 int a = mouseX-sizeX/2;
 int b = mouseY-sizeY/2;
 int c = mouseX+sizeX/2;
 int d = mouseY+sizeY/2;
 int e = pmouseX-sizeX/2;
 int f = pmouseY-sizeY/2;
 int g = pmouseX+sizeX/2;
 int h = pmouseY+sizeY/2;
 line(a,b,e,f);
 line(c,d,g,h);
 fill(hV,sV,50);
 rectMode(CENTER);
 rect(mouseX,mouseY,sizeX,sizeY);
 if (mousePressed && (mouseButton == LEFT)) {
  sizeX = sizeX+1;
  sizeY = sizeX;
 if (sizeX > 300) {
  sizeX = 300;
  }
  
 }
 if (mousePressed && (mouseButton == RIGHT)) {
  sizeX = sizeX-1;
  sizeY = sizeX;
  if (sizeX < 5) {
    sizeX = 5;
  }
  
 }
}

