
int size = 500;
void setup() {
  size(size, size);
  smooth();
  noStroke();
}

void draw() {
background(255);
vignette();
ellipse(width/2,width/2,33,99);
}

void vignette() {
  int firstcircleDiam= int(sqrt(2)*width);
  int lastCircleDiam = int(width*0.5);
  int qtyCircles = width;
  for (int i = 0; i < qtyCircles; i = i+1) {
 int black = 44;
 int alpha = int(map(i, 0, qtyCircles, 255, 0));
    stroke(black,alpha);
    noFill();
    ellipse(width/2, height/2, firstcircleDiam-i, firstcircleDiam-i);
    
  }
}
