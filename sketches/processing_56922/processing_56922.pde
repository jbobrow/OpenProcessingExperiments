
int w = 150;
int h = 200;
PImage img, masking;
float xpos, ypos;    
float xspeed = 2.8; 
float yspeed = 2.2; 
int xdirection = 1;  
int ydirection = 1;

void setup () {
  background(255);
  size(900, 900);
  frameRate (30);
  noStroke();
  imageMode(CENTER);
img = loadImage("on.jpg");
masking = loadImage("off.jpg");
img.mask(masking);
//image(img, 0, 0);
//image(img, 25, 0);
 xpos = width/2;
  ypos = height/2;
}

void draw() {
  
  
  background(255);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  

  if (xpos > width-w/3 || xpos < 0+w/3) {
    xdirection *= -1;
  }
  if (ypos > height-h/3 || ypos < 0+w/3) {
    ydirection *= -1;
  }
  
 
image(img, xpos, ypos);

}




