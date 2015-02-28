
size(793,430);
background(20);
smooth();
PImage sensemannImg = loadImage("sensemann.jpg");
 
int space = 15;
noStroke();

for (int x = space / 2; x < width;x = x + space) {
  for (int y = space / 2; y < height;y = y + space) {
    color col = sensemannImg.get(x,y);
    fill(col,random(150,255));
    ellipse(x,y,space,space+80);
  }
}

