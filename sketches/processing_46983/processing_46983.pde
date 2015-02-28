
PImage bground;
PImage cloud1;
PImage cloud2;
PImage cloud3;
PImage headline;

float x=1;
float y=1;
float z=1;
float t=1;
float u=1;
float v=1;

void setup(){
  size(1000,800);
  bground=loadImage("startpagebackground.png");
  cloud1=loadImage("cloud1.png");
  cloud2=loadImage("cloud2.png");
  cloud3=loadImage("cloud3.png");
  headline=loadImage("headline.png");
  frameRate(20);
}

void draw(){
  image(bground, 0, 0);
  image(cloud1, x-100, 50);
  image(cloud2, y-500, 200);
  image(cloud3, z-600, 500);
  image(cloud1, t-400, 600);
  image(cloud2, u-1800, 20);
  image(cloud3, v-1400, 700);
  image(headline, 250, 250);
  x=x+3;
  y=y+5;
  z=z+4;
  t=t+3;
  u=u+5;
  v=v+4;
  
  if(x>3000){
    x=-600;
  }
  if(y>2000){
    y=-600;
  }
  if(z>2000){
    z=-600;
  }
  if(t>2000){
    t=-600;
  }
  if(u>4000){
    u=-600;
  }
  if(v>4000){
    v=-600;
  }
}


