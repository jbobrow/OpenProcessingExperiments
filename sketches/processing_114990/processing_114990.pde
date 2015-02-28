

PImage img;
int x;
int y;

color pix;
float pointillize = 10;

float lerp;
boolean colorchange;

void setup() {
  size(580, 650);
  img = loadImage("bb.jpg");
  imageMode(CENTER);
  noStroke();
  colorchange= false;
}

void draw() { 
//image(img,width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
  background(0);
  for (y = 0; y < img.height; y+=7) {
    for (x = 0; x < img.width; x+=7) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        fill(pix);
        
///////////////////////////////////////////////////
        if (dist(mouseX, mouseY, x, y) <= 1.9) {
          pointillize=100;
        }
        else {
          pointillize=7;
        }
///////////////////////////////////////////////// This allows you to select a pixel color with the mouse coordinates
//        rectMode(CENTER);
//        rect( x, y, pointillize, pointillize);// rectagles work just as well, but remember to set the center mode.
//      
        ellipse( x, y, pointillize, pointillize);
      }
    }
  }
fill(45,83,248);


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
for (int i = 0; i < height; i = i+90) {
line(mouseX, i, mouseY, i); 
}
for (int i = 0; i < width; i = i+90) {
line(i, mouseX, i, mouseY);

}
}





