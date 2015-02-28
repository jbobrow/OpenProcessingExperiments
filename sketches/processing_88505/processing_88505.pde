
int pixelSize ;void setup(){size(1000, 600);frameRate(15);noCursor();colorMode(HSB, 200);background(0);}void draw(){pixelSize = 10+(mouseY/10);
 background(0);for (int i=0; i < width; i=i+pixelSize) {for (int j=0; j < height; j=j+pixelSize) {strokeWeight(random(1));fill(mouseX/4.7, random(255), random(200));if (keyPressed == true) {ellipse(i, j, pixelSize, pixelSize);} else {rect(i, j, pixelSize, pixelSize);}}}}
