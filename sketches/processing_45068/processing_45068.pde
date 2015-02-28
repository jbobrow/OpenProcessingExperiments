
PImage img;
PImage img2; 

int xcoord = 50;
int ycoord = 20;

int xspeed = 2;
int yspeed = 4;



void setup(){ 
size(600,500);
// frameRate (30);
img = loadImage("IMG_1740.JPG"); 
img2 = loadImage("pumpkin_seed.png"); 
}

void draw(){
  xcoord = xcoord + xspeed;
  ycoord = ycoord + yspeed;

  image (img, 0,0);
  image (img2,xcoord, ycoord);

   
if (xcoord > 550) {
xspeed = -2;
}
 
if (xcoord < -15){
xspeed = 2;
}
 
if (ycoord > 450){
  yspeed = -4;
}
 
if (ycoord < 0){
  yspeed = 4;
}


 } 

