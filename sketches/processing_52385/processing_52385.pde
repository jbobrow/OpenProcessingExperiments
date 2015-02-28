
PImage BG;
PImage Batman;
PImage SSurfer;
PImage IronMan;
PImage Hulk;
PImage Spidey;
PImage Superman;
PImage GL;

float x;
float x2;
float angle;

void setup() {
  size(600, 300);
  tint(200,100);
  BG = loadImage("BG.tif");
  Batman = loadImage("Batman.png");
  SSurfer = loadImage("SSurfer.png");
  IronMan = loadImage("Iron Man.png");
  Hulk = loadImage("Hulk.png");
  Spidey = loadImage("Spidey.png");
  Superman = loadImage("Superman 2.png");
  GL = loadImage("Green Lantern.png");
  
  imageMode(CENTER);
  smooth();
}

void draw() {
  image(BG, width/2,height/2);
  
  if ((keyPressed == true) && ((key == 'w') || (key == 'W'))) {
  x+=2;
  if (x>width){
    x = 0;
  }
    image (SSurfer, x, 150,200,300);
  }
     
    if ((keyPressed == true) && ((key == 'q') || (key == 'Q'))) {
    angle +=0.01;
    translate (90,90);
    rotate(angle);
    image(IronMan,0,0,310,400);
    
    }
      if ((keyPressed == true) && ((key == 'e') || (key == 'E'))) {
        x2 = width/4 + sin(frameCount/3.0) * 10;
        image(Hulk,450-x2,125,480,350);
    }  
      if ((keyPressed == true) && ((key == 'r') || (key == 'R'))) {
        x2 = width/4 + sin(frameCount/10.0) * 10;
        x=x-3;
        if ((width+x) <= 0){
          x=0;
        }
        image(GL,width+x,300-x2,210,322);
      }
      
      if ((keyPressed == true) && ((key == 't') || (key == 'T'))) {
        translate(400,130);
        angle = (sin(frameCount/8.0)*0.3);

        rotate(angle);
        image(Spidey,0,0);
      }
}

