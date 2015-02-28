
size(500, 500);
background(0,0,0);
smooth();
noStroke();

for(int x = 1; x < 5; x++){
  for(int y = 1; y < 5; y++){
    int xspace = x*100;
    int yspace = y*100;
    fill(255, 0, 0);
    ellipse(xspace, yspace, 80, 80);
    fill(255, 255, 255);
    ellipse(xspace, yspace, 74, 74);
    fill(255, 0, 0);
    ellipse(xspace, yspace, 66, 66);
    fill(255, 255, 255);
    ellipse(xspace, yspace, 58, 58);
    fill(255, 0, 0);
    ellipse(xspace, yspace, 50, 50);
    fill(255, 255, 255);
    ellipse(xspace, yspace, 42, 42);
    fill(255, 0, 0);
    ellipse(xspace, yspace, 34, 34);
    fill(255, 255, 255);
    ellipse(xspace, yspace, 26, 26);
    fill(255, 0, 0);
    ellipse(xspace, yspace, 18, 18);
    fill(255, 255, 255);
    ellipse(xspace, yspace, 10, 10);
  }
}

