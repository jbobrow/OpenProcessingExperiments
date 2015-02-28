
int squ = 80;
int ci = 40;
int r = 255;
int g = 255;
int b = 255;

void setup () {
 size (300,300);
 //translate(width/2, height/2);
}

void draw() {
  //translate(width/2, height/2);
  background (0);
  smooth();
  rectMode(CENTER);
  noStroke();
  fill(255);
  rect(mouseX, mouseY, squ, squ);
  fill(r,0,0);
  ellipse(mouseX-40, mouseY-40, ci, ci);
  fill(0,g,0);
  ellipse(mouseX+40,mouseY-40,ci,ci);
  fill(0,0,b);
  ellipse(mouseX-40,mouseY+40,ci,ci);
  fill(r,g,0);
  ellipse(mouseX+40,mouseY+40,ci,ci);
}

void mousePressed () {
  r=mouseX;
  g=mouseY;
  b=pmouseX;
}

