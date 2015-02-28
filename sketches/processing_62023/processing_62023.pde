
/*
Greater Than or Equal to Four Circles
Dan Olson, 2012
*/
 

int num = int(random(4,20));
int x[] = new int [num];
int y[] = new int [num];
//import processing.pdf.*;
void setup() {
size(500,500);
background(0);
//beginRecord(PDF, "filename.pdf");
for ( int i = 0; i < num; i++) {
x[i] = int(random(0,500));
y[i] = int(random(0,500));
num = int(random(4,20));
}
}
void draw() {
  fill(0);
  stroke(50,240,109);
  for (int i= 0; i < num; i++) {
  ellipse(x[i], y[i], mouseX, mouseY);
  }
 if (keyPressed) {
   if (key == 'l') {
  for (int i= 0; i < num; i++) {
    fill(0,50);
    stroke((random(255)),100,230);
    line(x[i],y[i],mouseX,mouseY);
  }
   }
 }
}
void mousePressed() {
  if (mouseButton == LEFT) {
  setup();
  loop();
  } else {
  noLoop();
  save("1.png");
  //endRecord();
  }
  }









