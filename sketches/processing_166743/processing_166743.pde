
float heightMiddle;
float H=0;
float S=0;
float B=0;
boolean click=false;


void setup() {
  colorMode(HSB, 360, 100, 100);
  size(500, 700);
  background(0);
}

void draw() {
  if (click==true) {

    frameRate(2);
    for ( int i=0; i<height-70; i+=20) {
      drawG2(120, 380, 70+i, 10+i);
    }
  }
}

void drawG2(int widthStart, int widthEnd, int heightMax, int heightLow) {
  noFill();
  heightMiddle=(heightMax+heightLow)/2;
  beginShape();
  for (float w=widthStart; w < widthEnd; w=w+15) {
    if (w < widthStart+30) {
      vertex(w, heightMiddle);
    } else if (w>widthEnd-30) {
      vertex(w, heightMiddle);
    } else {
      float h=random(heightLow, heightMax);
      H=map(h, 0, height, 130, 359);
      S=map(h, 0, height, 30, 80);
      B=map(h, 0, height, 30, 80);
      stroke(H, 100, B, 100);
      strokeWeight(1);
      vertex(w, h);
    }
  }
  endShape();
}

void mouseClicked(){
  click=true;
}


void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}

void keyPressed() {
  saveFrame("colorPattern-#####.png");
}



