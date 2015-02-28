
int parts=1000;
float[] coordinates = new float[1000];

void setup () {
  size(600, 600);
  background(255);
  fill (255, 0, 0);
  smooth();
  noStroke();
  frameRate(20);
  for (int i=0;i<parts;i=i+1) {
    coordinates[i]=random(600);
  }
}

void draw() {
  fill(255);
  rect(0, 0, 600, 600);
  fill(255, 0, 0);
  for (int q=0;q<parts;q=q+2) {
    if (coordinates[q]+10>mouseX&&coordinates[q]-10<mouseX) {
    }
    else {
      coordinates[q]=followX(coordinates[q], coordinates[q+1]);
    }
  }

  for (int r=1;r<parts;r=r+2) {
    if (coordinates[r]+10>mouseY&&coordinates[r]-10<mouseY) {
    } 
    else {
      coordinates[r]=followY(coordinates[r-1], coordinates[r]);
    }
  }
  for (int z=0;z<parts;z=z+2) {
    ellipse(coordinates[z], coordinates[z+1], 10, 10);
  }
}


float followX (float x, float y) {
  x+=8*cos(atan2(mouseY-y, mouseX-x));
  return x;
}

float followY (float x, float y) {
  y+=8*sin(atan2(mouseY-y, mouseX-x));
  return y;
}

void mouseClicked() {
  if (mouseButton==LEFT) {
    parts=int(random(1000));
    while (parts%2!=0) {
      parts=int(random(1000));
    }

    for (int i=0;i<parts;i++) {
      coordinates[i]=random(600);
    }
  }
}



