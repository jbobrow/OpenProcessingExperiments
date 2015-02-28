
void setup() {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {                               
 
  fill(0);                                   //bg sparse dots
  for (int i = 30; i <= width-30; i += 10) {
    for (int j = 30; j <= height-30; j += 20) {
      point(i,j);
    }
  }
  fill(0);                                   //diagnol dots
  for (int i = 0; i <= width; i += 10) {
    for (int j = 0; j <= height; j += 10) {
      point(i++,j++);
    }
  }
  fill(0);                                  // more diagnol dots
  for (int i = 20; i < width-20; i += 20) {
    for (int j = 20; j < height-20; j += 20) {
      point(i++,j++);
    }
  }
  fill(0);                                  // more diagnol dots
  for (int i = 40; i < width-40; i += 30) {
    for (int j = 40; j < height-40; j += 30) {
      point(i++,j++);  
    }
  }
  fill(0);                                  // more diagnol dots
  for (int i = 80; i < width-80; i += 40) {
    for (int j = 80; j < height-80; j += 40) {
      point(i++,j++); 
    }
  }
  fill(0);                                  // more diagnol dots
  for (int i = 100; i < width-100; i += 50) {
    for (int j = 100; j < height-100; j += 50) {
      point(i++,j++); 
    }
  }
  fill(0);                                  // more diagnol dots
  for (int i = 120; i < width-120; i += 60) {
    for (int j = 120; j < height-120; j += 60) {
      point(i++,j++); 
    }
  }
  fill(0);                                  // more diagnol dots
  for (int i = 140; i < width-140; i += 70) {
    for (int j = 140; j < height-140; j += 70) {
      point(i++,j++); 
    }
  }
   fill(0);                                  // more diagnol dots
  for (int i = 150; i < width-150; i += 80) {
    for (int j = 150; j < height-150; j += 80) {
      point(i++,j++); 
    }
  }
  fill(0);                                  // more diagnol dots
  for (int i = 160; i < width-160; i += 90) {
    for (int j = 160; j < height-160; j += 90) {
      point(i++,j++); 
    }
  }
  fill(0);                                  // more diagnol dots
  for (int i = 170; i < width-170; i += 100) {
    for (int j = 170; j < height-170; j += 100) {
      point(i++,j++); 
    }
  }
}


