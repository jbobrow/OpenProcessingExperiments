
int diam = 50;
int q = 255;
int[]red = new int[q];
int[]blue = new int[q];

void setup() {
  size(500, 500);
  for (int x=0; x<q; x++) {
    red[x] = 0;
    blue[x] = 0;
  }
}

void draw() {
  background(0);
  println(frameCount);

  for (int x=0; x<q -1; x++) {
    red[x] = red[x+1];
    blue[x] = blue[x+1];
  }

  red[q-1]=mouseX;
  blue[q-1]=mouseY;

  
      for (int x=0; x<q; x++) {
        noStroke();
        fill(red[x], 0, blue[x]);
        ellipse(random(width), random(height), diam, diam);
     
  }
}



