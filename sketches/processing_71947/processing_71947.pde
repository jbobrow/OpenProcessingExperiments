
size(400, 400);
colorMode(HSB,100);
noStroke();

for (int x=0;x<width;x+=40) {
  for (int y=0;y<height;y+=40) {
    
    fill(random(40),80,80);
    rect(x, y, 40, 40);
  }
}

for (int x=0;x<width/2;x+=20) {
  for (int y=0;y<height/2;y+=20) {
    
    fill(random(40)+20,80,80);
    rect(x, y, 20, 20);
  }
}

for (int x=0;x<width/4;x+=10) {
  for (int y=0;y<height/4;y+=10) {
    
    fill(random(40)+40,80,80);
    rect(x, y, 10, 10);
  }
}

for (int x=0;x<width/8;x+=5) {
  for (int y=0;y<height/8;y+=5) {
    
    fill(random(40)+60,80,80);
    rect(x, y, 5, 5);
  }
}

