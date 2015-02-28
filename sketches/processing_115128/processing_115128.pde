
/* @pjs preload= "katenude.jpg"; */
PImage img;
int x;
int y;
color pix;
float pointillize = 5.5;

void setup() {
  size(470, 664);
  img = loadImage("katenude.jpg");
  imageMode(CENTER);
  noStroke();
}

void draw() { 
  //image(img,width/2, height/2); // We don't need this anymore becayse we are drawing our own pixels
  background(0);
  for (y = 0; y < img.height; y+=5.5) {
    for (x = 0; x < img.width; x+=5.5) {
      pix = img.get(x, y);
      if (pix != color(0, 0, 0)) {
        noStroke();
        fill(pix);


        if (dist(x, y, mouseX, mouseY) <= 40) {
          pointillize=10;
        }
        else {
          pointillize=4;
        }
        if (dist(pmouseX, pmouseY, x, y) <= 30) {
          pointillize=3.5;
          textSize(30);
          text("No", mouseX/6,200); 
          fill(pix/10);
          textSize(30);
          text("You are violating my privacy!", mouseX/6,100); 
          fill(pix*3);
           textSize(300);
          text("GO", mouseX/15,400); 
          fill(pix/5);
          textSize(10);
          text("Bitch!", mouseX,30); 
          fill(pix/8);
          textSize(150);
          text("AWAY!", mouseX/70,600); 
          fill(pix/4);
        }
        ellipseMode(CENTER); 
        ellipse(x, y, pointillize, pointillize);
      }
    }
  }
}



