
int eSize = 20;
size(510, 510);
background(255);
smooth();
 
fill(0);
 
for(int y = 0; y <= height; y += 30){
for(int x = 0; x <= width; x += 30){
    stroke(255,255,255);
    fill(x/2, 200, y/2);
    ellipse(x, y, eSize, eSize);
  }
}



