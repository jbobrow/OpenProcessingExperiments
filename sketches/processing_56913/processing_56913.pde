
int h = (300);
int w = (400);
int x = 10;
PImage img,maskImg; 
float xpos, ypos;       

float xspeed = 2.8;  
float yspeed = 2.2;  

int xdirection = 1;  
int ydirection = 1;  


void setup(){
  frameRate(30);
  imageMode(CENTER);
  size(800, 600);

//  p = loadImage("on.jpg");
  
  img = loadImage("on.jpg");
  maskImg = loadImage("off.jpg");
    img.resize(400,300);
  maskImg.resize(400,300);
  img.mask(maskImg);
//  image(img, 0, 0);
//  image(img, 25, 0);
//  

   xpos = width/2;
  ypos = height/2;
}

void draw (){
  background(255);

  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width-w/3 || xpos < 0+w/3) {
    xdirection *= -1;
  }
  if (ypos > height-w/3 || ypos < 0+w/3) {
    ydirection *= -1;
  }
  
  
  
  
  
  
  
  image(img, xpos, ypos);
}




