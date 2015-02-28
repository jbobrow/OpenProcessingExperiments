
int bsc, bs, m;


void setup() {
  size(600, 600);
  bsc = 30;
  bs = 20;
  m = 40;
  background(255);
}



void draw() {
  for (int y=180; y<450; y+=bsc) {
    for (int x=180; x<450; x+=bsc) {
      fill(random(247, 254), random(6, 209), random(255), 5);
      stroke(255, 255, 255);
      ellipse(x, y, bsc, bsc);
    }
  }
  for (int a=0; a<100; a+=bs) {
    for (int b=0; b<width;b+=bs) {
      fill(random(250, 254), random(5, 209), random(260), 30);
      stroke(255, 255, 255);
      rect(a, b, bs, bs);
    }
  }

  for (int c=500; c<600; c+=bs) {
    for (int d=0; d<width;d+=bs) {
      fill(random(250, 254), random(5, 209), random(260), 30);
      stroke(255, 255, 255);
      rect(c, d, bs, bs);
    }
  }


  for (int e=100; e<500; e+=bs) {
    for (int f=0; f<100;f+=bs) {
      fill(random(250, 254), random(5, 209), random(260), 30);
      stroke(255, 255, 255);
      rect(e, f, bs, bs);
    }
  }


  for (int g=0; g<600; g+=bs) {
    for (int h=500; h<600;h+=bs) {
      fill(random(250, 254), random(5, 209), random(260), 30);
      stroke(255, 255, 255);
      rect(g, h, bs, bs);
    }
  }


  int x = mouseX  - (mouseX % bsc);
  int y = mouseY - (mouseY % bsc);
  fill(255);
  noStroke();
  ellipse(x, y, m, m);
}


