
PImage img;
void setup() {
  img=loadImage("face.jpg");
  size(1067, 800);
  background(0);
  
}

void draw(){
  for (int x=0;x<width;x+=5) {
    for (int y=0;y<height;y+=5) {
      color c=img.get(x, y);
      float b=map(brightness(c), 0, 256, 0, 50);

      if (b<=45) {
        pushMatrix();
        stroke(c);
        strokeWeight(b/35);
        line(x+b/25, y-b/25, x-b/50, y+b/50);
        popMatrix();
      }

      pushMatrix();
      translate(b/4, c/4);
      stroke(c);
      strokeWeight(b/50);
      line(x-b/2, y+b/2, x+b/10, y-b/10);
      popMatrix();

      pushMatrix();
      translate(b/10, c/10);
      stroke(c-b);
      strokeWeight(b/20);
      line(x-b/2, y+b/2, x+b/10, y-b/10);
      popMatrix();

      if (b>=10) {
        pushMatrix();
        translate(b/20, c/40);
        stroke(c);
        strokeWeight(b/30);
        line(x-b/2, y+b/2, x+b/20, y-b/20);
        popMatrix();
      }

      if (b>=45) {
        pushMatrix();
        translate(b/20-100, c/40-125);
        stroke(c*12);
        strokeWeight(b/40);
        line(x-b/2, y+b/2, x+b/20, y-b/20);
        popMatrix();
      }

      if (b>=45) {
        pushMatrix();
        stroke(c);
        strokeWeight(b/20);
        line(x+b/25, y-b/25, x-b/50, y+b/50);
        popMatrix();
      }
    }
  }
}


