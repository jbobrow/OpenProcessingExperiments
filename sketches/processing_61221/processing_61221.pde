
int diam = 20; // trt diam = 600
size(800, 800);
noStroke();
background(175);

// x,y rects
for (int x =0; x<= width; x=x+diam-1) {
  for (int y = 0; y<= height; y=y+diam) {
    fill(random(255), random(255), random(255),100);
    rect(x,y, diam, diam);
  }
}

//little lines

for (int x =0; x<= width; x=x+5) {
  for (int y = 0; y<= height; y=y+5) {
    strokeWeight(0.5);
    stroke(0,0,0,35);
    line(x,y,x+5,y+5);
  }
}
