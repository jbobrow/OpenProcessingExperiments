
int t = -5;
int h = 350;
float r;

void setup(){
  size(600, 400);
  background(0);
  smooth();
  frameRate(80);
}

void draw(){
  stroke(255);
  line(0, height/2, width, height/2);
  t = t + 5;
  r = random(300);
  if (r > 150) { h = h + 5;
    stroke(255);
    line(t-5, h-5, t, h);
  } else { h = h - 5;
    stroke(255);
    line(t-5, h+5, t, h);
  }
  noStroke();
  fill(200, 0, 0);
  if (t > width) { background(0);
line(0, height/2, width, height/2);
    t = -5;
  }
  if (h > height) { h = 0;
  }
  if (h < 0) { h = height;
  }
}
