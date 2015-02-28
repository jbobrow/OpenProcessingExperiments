
size(1000,600);
background(255);
smooth();
PImage medineImg = loadImage("md6.jpg");
  
int space = 10;
strokeWeight(0);
 
for (int x = space ; x < width; x = x + space) {
  for (int y = space ; y < height;y = y + space) {
    color col = medineImg.get(x,y);
    fill(col,random(500,40));
    rect(x,y,space,space);
  }
}

