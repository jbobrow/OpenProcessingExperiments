
size(800, 600);
colorMode(RGB, 256);
background(255);
noStroke();
smooth();

for(int y = 0; y < 256; y++){
  for(int x = 0; x < 256 ; x++){
    fill(0, 255-y*1, 255);
    rect(x, y, 800,600);
  }
}

