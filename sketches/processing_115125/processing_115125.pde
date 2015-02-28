
/* @pjs preload= "katenude.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 4;

void setup() {
  size(470,664);
  img = loadImage("katenude.jpg");
  imageMode(CENTER);
  noStroke();
}

void draw() { 
//image(img,width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
  background(0);
  for (y = 0; y < img.height; y+=4.5) {
    for (x = 0; x < img.width; x+=4.5) {
      pix = img.get(x, y);
      if (pix != color(0,0,0,15)) {
        noStroke();
        fill(pix);
        

       if (dist(x, y,mouseX, mouseY) <= 35) {
     pointillize=10;
       }
       else {
          pointillize=4;
       }
        if (dist(pmouseX, pmouseY,x,y) <= 35) {
     pointillize=20;
      textSize(30);
          text("STOP", 210, 158); 
          fill(pix);
       }
        ellipseMode(CENTER); 
        ellipse(x, y, pointillize, pointillize);
        

       
      }
    }
  }
}



