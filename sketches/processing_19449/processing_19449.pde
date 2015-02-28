
PFont font;

void setup() {
  size(250,250);
  background(0);
  font=createFont("Futura",40);
}

void draw() {
  noStroke();
  fill(0,0,0,250);
  rect(0,0,width,height);
  for (int h=0;h<250;h+=37) {
    for (int i=0;i<250;i+=10) {
      fill(0+i);
      textFont(font,10);
      text("L2R 3R9",h,i);
      if (mouseX==h||mouseX>h&&mouseY==i||mouseY>i) {
        fill(0,255,0,i);
        text("L2R 3R9",h,i);
      }
      else {
        fill(0,0,255,i);
        text("L2R 3R9",h,i);
      }
    }
  }
}


