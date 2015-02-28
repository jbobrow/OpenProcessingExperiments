
int eSize = 3;

   size(510,510);
   background(0,0,0);

for(int i = 0; i < 255; i = i + 1){
  noStroke();
  fill(i,100,i,1);
  ellipse(250,250,i-50,i-50);
  
  fill(100,100,i,1);
  ellipse(250,250,i,i);
}

for(int y = 0; y <= height; y += 30){
for(int x = 0; x <= width; x += 30){
    stroke(255,255,255);
    ellipse(x, y, eSize, eSize);
  }
}



