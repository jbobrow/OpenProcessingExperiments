
int w= 150;
int h = 200;
PImage img, maskImg;
float xpos, ypos;    
float xspeed = 3.8;  
float yspeed = 3.2;  
int xdirection = 1;  
int ydirection = 1;  

void setup() {
  size(600, 600);                        
  smooth();                             
  imageMode(CENTER);  
  noStroke();  
  frameRate (30);  
  img = loadImage("duck_web_4.jpg");
  maskImg = loadImage("duck_web_3.jpg");
  img.resize(w, h);
  maskImg.resize(w, h);
  img.mask(maskImg);

  xpos = width/2;
  ypos = height/2;
} 
void draw () {
  //image(img,mouseX,mouseY);
  background(0);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width-w/3 || xpos < 0+w/3) {
    xdirection *= -1;
  }
  if (ypos > height-h/3 || ypos < 0+h/3) {
    ydirection *= -1;
  }
  image(img, xpos, ypos, w, h);
}


