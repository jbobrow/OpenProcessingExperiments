
void setup(){
  size(400,400);
  smooth();
  background(0);
}
float r = random(180,200);
float g = random(100,110);
float b = random(0,10);
int y = 300;
int speed = 2;
int red = 1;
int green = -1;
int w = 30;
int move = 1;
void draw(){
  frameRate(24);
  noStroke();
fill(r,g,b);
r=r+red;
g=g+green;
b=b-speed;
for (int z =0; z<=width;z+=1){
    rect(0,0,400,250);
  }
  fill(255,215,0);
  ellipse(200,y,150,150);
  y=y+speed;
  if((y<75)||(y>=340))
  {
    speed=speed*-1;
    red=red*-1;
    green=green*-1;
  }
 
  float c = random(80,90);
  float d = random(170,180);
  float e = random(200,255);
  fill(c,d,e);
  for (int x=0;x<=width;x+=1){
    rect(0,250,400,150);
  }
  fill(255,255,240);
  ellipse(w,35,27,25);
  ellipse(w+7,25,25,27);
  ellipse(w+14,35,27,25);
  ellipse(w+21,25,25,27);
  ellipse(w+28,35,27,25);
  ellipse(w+70,90,27,25);
  ellipse(w+77,80,25,27);
  ellipse(w+84,90,27,25);
  ellipse(w+91,80,25,27);
  ellipse(w+98,90,27,25);
  ellipse(w+270,50,27,25);
  ellipse(w+277,40,25,27);
  ellipse(w+284,50,27,25);
  ellipse(w+291,40,25,27);
  ellipse(w+298,50,27,25);
  w=w+move;
  if(w>=414){
    w=-312;
  }
}

