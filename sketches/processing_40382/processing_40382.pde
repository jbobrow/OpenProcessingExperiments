
size (600, 600);
background(0);
colorMode(HSB, height);
 
 
int sw = 0;
 
 
for (int i=10;i<height;i+=10) {
 
 
  strokeWeight(sw+1);
 
 
  stroke(i, height, height);
 
 
  line(i, 0, 300, width);
 
 
}

