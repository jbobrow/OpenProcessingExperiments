
float x= 50;
float y;
float z;
float col;

void setup() {
  size(500, 500); 
  colorMode(HSB, 100);
  background(0);
  frameRate(10);
}

void draw() {
  background(0);
  for (int i=0; i<20; i=i+1) {
    fill(col, 255, 255);

    y=noise(x/100+z)*30+50;
    rect(x+20, y, 10, 10);
    x+=10;
  }
  for (int i=0; i<20; i=i+1) {
    fill(col, 255, 255);
    x=noise(y/100+z)*30+50;
    rect(x+200, y, 10, 10);
    y+=10;
  }
  for (int i=0; i<20; i=i+1) {
    fill(col, 255, 255);
    y=noise(x/100+z)*30+50;
    rect(x, y+200, 10, 10);
    x+=10;
  }

  for (int i=0; i<20; i=i+1) {
    fill(col, 255, 255);
    x=noise(y/100+z)*30+50;
    rect(x, y, 10, 10);
    y+=10;
  }


  col++;
  if (col>100) {
    col=0;
  }
  x=50;
  z++;
}


