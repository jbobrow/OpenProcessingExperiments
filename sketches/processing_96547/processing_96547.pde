
void setup() {
  size(200, 200);
  background(255);
}

void draw() {
  quad();
  float p = random(0, width);
  float y = random(0, height);

  if ((p>70 && p<120) && (y>70 && y<120)) {
    ;
  }
  else {
    noStroke();
    fill(p, y, 0);
    ellipse(p, y, 10, 10);

   
    }
     if (mouseX>=70 && mouseX<=120 && mouseY>=70 && mouseY<=120) {
      background(255);
      noLoop();
  }

}

void quad() {
  for (int x=70; x<120; x+=14) {
    line(x, 70, x+4, 70);
    line(70, x, 70, x+4);
    line(120, x, 120, x+4);
    line(x, 120, x+4, 120);
  }
}



