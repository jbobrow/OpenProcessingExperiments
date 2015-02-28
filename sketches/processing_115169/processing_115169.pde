

int eSize =6;

size(800, 800);
background(0);
smooth();
noStroke();

for (int x=0; x<=width; x += 10) {
  for (int y=0; y<=height; y += 10) {
    line(x, 800, y, x);
    stroke(220,70);
    strokeWeight(0.2);

    line(x, 800, 3*y, x);

    line(x, 800, 6*y, x);

    line(x, 800, 9*y, x);
  }
}

for (int x=0; x<=width; x += 10) {
  for (int y=0; y<=height; y += 10) {
    //x%各波長の最低の値
    if (x%125 == 0) {  
      ellipse(x, y, eSize*3, eSize*3);
      fill(255, 100-x, 140-x, 90);  //Red
    }
    else if (x%100 == 0) {
      ellipse(x, y, eSize*3, eSize*3);
      fill(100-x, 255, 140-x, 90);  //Green
    }
    else if (x%90 == 0) {
      ellipse(x, y, eSize*3, eSize*3);
      fill(100-x, 140-x, 255, 90);  //Blue
    }
    ellipse(x, y, eSize, eSize);
    fill(240, 230, 160, 30);  //その他
  }
}



