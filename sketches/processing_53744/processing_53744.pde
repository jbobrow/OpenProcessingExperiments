
int x = 0;
int y = 0;
int z = 0;
int directionx;
int directiony;
float angle;
PImage img;


void setup(){
  size(600,600);
  smooth();
  x=20;
  y=100;
  z =220;
  directionx=2;
  directiony=1;
  img = loadImage("pins.jpg");
  
}

void draw(){
  background (255,255,255);
  x+=directionx;
  y+=directiony;
  image (img, 0,0);
  tint(200, 80);
 
 if (y>600){
   directiony =-1;
  }

if (x>600){
  directionx=-1;
  }

if (y<0){
  directiony=1;
  }

if (x<0){
  directionx=+1;
  }
  noStroke();
  fill(100, 80);
  ellipse(y, x, y/4,y/4);
  fill(100,70);
  ellipse (y-30, x+25, x,x);
  fill(random(0,255));
  ellipse (y+300, x, 50,50);
  
 for (int i = 0; i < width; i=i+10) {
   for (int r = 0; r <height; r=r+15){
     stroke(0);
     line(i,r,25,r);
      }
float crazy = sin(radians(angle));
  //take the old range of my old variable )of -1 to 1) and make it 0 to 255
  crazy = map(crazy,-1,1,0,600);
  line (crazy, height, crazy+width, 10);
  angle++;
  
 }
}

void mouseDragged(){
  if (dist(mouseX, mouseY, x,y) <100){
  x = mouseX;
  y = mouseY;
  }
}




