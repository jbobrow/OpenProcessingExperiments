

int eSize =6;

size(800, 800);
background(0);
smooth();
noStroke();

for (int x=0; x<=width; x += 10) {
  for (int y=0; y<=height; y += 10) {
    //x%各波長の最低の値
    if (x%125 == 0) {  
      ellipse(x, y, eSize*3, eSize*3);
      fill(255, 130, 170, 80);  //Red
    }
    else if(x%100 == 0) {
      ellipse(x, y, eSize*3, eSize*3);
      fill(170, 255, 170, 80);  //Green
    }
    else if (x%90 == 0) {
      ellipse(x, y, eSize*3, eSize*3);
      fill(130, 170, 255, 80);  //Blue
    }
    ellipse(x, y, eSize, eSize);
    fill(240, 230, 160, 30);  //その他
  }
}



