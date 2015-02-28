
size(1000,600);
background(10);
smooth();
PImage sunriseImg = loadImage("sunrise.JPG");
 
int space = 15;
stroke(0);
strokeWeight(1);

for (int x = space / 2; x < width;x = x + space) {
  for (int y = space / 2; y < height;y = y + space) {
    color col = sunriseImg.get(x,y);
    fill(col,random(200,255));
    ellipse(x,y,space+10,space);
  }
}

