
void setup () {
  size(300,200);
  noLoop();
}

void draw(){

// Object Size
float oSize = 1;
  oSize *= random(10,50);

smooth();

noStroke();

float xCount = ( width / oSize ) + 1;
float yCount = ( height / oSize) + 1;

float fColor = 1;
      fColor *= random(1,255);
float fColor2 = 1;
      fColor2 *= random(1,255);
float fColor3 = 1;
      fColor3 *= random(1,255);
float fColor4 = 1;
      fColor4 *= random(1,255);
float fColor5 = 1;
      fColor5 *= random(1,255);
float fColor6 = 1;
      fColor6 *= random(1,255);

ellipseMode(CORNER);

for (int i = 0; i<xCount ; i++) {
  for (int j = 0; j<yCount ; j++) {
    if ((i+j)%2==0) {
      fill(fColor, fColor2, fColor3);
    }
    else {
      fill(fColor4, fColor5, fColor6);
    }
    strokeWeight(20);
    ellipse(i*oSize, j*oSize, oSize, oSize);
  }
}
}


void mouseClicked() {
  redraw();
}

