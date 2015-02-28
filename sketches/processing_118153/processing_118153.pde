
int eSize=3;

size(510,510);
background(255,240,245);
smooth();


int  x, y, i;

noStroke();

for (i = 0; i < 70; i=i+8 ){  
 for(x = 0; x < width; x +=70 ){
  for(y = 0; y < height; y += 70 ){
fill(240, x/2, y/2, 100);
    ellipse(x, y, i, i);
  }
 }
}




