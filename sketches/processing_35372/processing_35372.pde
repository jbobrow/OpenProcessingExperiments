
void setup () {
  size(200, 200);
  //colorMode(HSB, 100);
  background(220);
}


int x=0;

void draw() {
  x++;
  rectMode(CORNERS);
   fill(255,30);
   rect(0,0,width,height);
   
   noFill();
   stroke(0);
   ellipse(mouseX,mouseY,20,20);
   x++;
   

  ellipse(x,mouseY,50,50);
}

void mouseDragged() {
  noFill();
   stroke(mouseY,mouseX,20);
   ellipse(mouseY/width, mouseX/width, mouseX, mouseX);

  noFill();
   stroke(mouseY,0,mouseX);
   rect(mouseY,mouseY,mouseX,mouseX);
}


