
/* @pjs preload= "face.png"; */
/* @pjs preload= "star1.png"; */
/* @pjs preload= "star2.png"; */
/* @pjs preload= "star3.png"; */
/* @pjs preload= "star4.png"; */

float angle = 0.0;
float offset = 250;
float scalar = 100;
float speed = 0.04;
float speed1= 0.03;
float r;
float r1;
PImage img;
PImage star1;
PImage star2;
PImage star3;


void setup () {
size(500,500);
smooth();

img = loadImage("face.png");
image(img,150,150);


star2 = loadImage("star2.png");

star3= loadImage("star3.png");



}

void draw() {
 r = random(0,500);
 r1= random(0,500);
 background(255);
  
img = loadImage("face.png");
image(img,150,150);

  
  float x= offset +cos(angle + 1.5) * scalar;
  float y= offset +sin(angle) * scalar;
  
  float x1= offset +cos(angle-0.1) * (scalar+70);
  float y1= offset +sin(angle+0.8) * (scalar+70);
  
  float x2= offset +cos(angle+2) * (scalar+100);
  float y2= offset +sin(angle+0.5) * (scalar+30);
  
  float x3= (offset-10) +cos(angle) * (scalar+30);
  float y3= (offset-10) +sin(angle) * (scalar+30);
  
  float x4= (offset-20) +cos(angle) * (scalar+90);
  float y4= (offset-20) +sin(angle) * (scalar+90);
  angle += speed;
  image(star3,y3,x3);
  image(star3,x4,y4);
  image(star3,y1,x1);
  image(star3,x,y2);
  image(star3,x2,y);
  
 

if (mouseX >= 230 && (mouseX <= 370 )) {
  float r = 200;
  speed=0.06;
  scalar=90;
 
x1= offset +cos(angle) * scalar;
y1= offset +sin(angle) * scalar;
  
}
else{
speed = 0.03;
}

  if(x>420) {
  image(img,150,150);
   
} 

if(x1>230) {
  image(img,150,150);

}
}


