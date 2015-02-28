
size(800, 800);
PFont serif = loadFont("Serif-24.vlw");
PFont sanSerif = loadFont("SansSerif-24.vlw");
int shapeHue = int(random(256));

for (int i=10;i>=0;i=i-1) {
  if (i%2==0) { //means it is divisible by 2, which means its an even number.
    textFont(serif);
  }
  else {
    textFont(sanSerif);
    textSize(50);
    textAlign(LEFT);
  }
  text("countingdown"+i, width/2, height - (i/10.0)*(height-24));
}

for (int i = 0;i<10000;i++) {
  fill(shapeHue, random(256), random(256), random(256));
  rect(random(width), random(height), random(width), random(height));
}


