
PImage img;
int x;
int y;
 
color pix;
float pointillize = 10;
 
float lerp;
boolean colorchange;
 
void setup() {
  size(430, 570);
  img = loadImage("cristiano-ronaldo-1-435.jpg");
  imageMode(CENTER);
  noStroke();
  colorchange= false;
}
 
void draw() {
  
  background(0);
  for (y = 0; y < img.height; y+=7) {
    for (x = 0; x < img.width; x+=7) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        fill(pix);
         

        if (dist(mouseX, mouseY, x, y) <= 1.9) {
          pointillize=50;
        }
        else {
          pointillize=13;
        }
     
        ellipse( x, y, pointillize, pointillize);
      }
    }
  }
fill(255,255,255);
 
 
 if (!colorchange) {
      lerp-=0.1;}
      else if (colorchange) {
        lerp-=0.1;}
        if (lerp <=0.001 || lerp >=0.999)
        {colorchange =!colorchange;
   }
 
 
 
 if (mousePressed==true) {
    ellipse(mouseX, mouseY, 80, 80);
    
    }
 
stroke(0);
for (int i = 0; i < height; i = i+50) {
line(mouseX, i, mouseY, i);
}
for (int i = 0; i < width; i = i+50) {
line(i, mouseX, i, mouseY);
 
}
}



