
int i = 100;
size(800, 800);
background(255);

  for(int y = 0; y <= height; y = y + i){
    for(int x = 0; x <= width; x = x + i){
      ellipse(x, y, 200, 200);
    }
  }


