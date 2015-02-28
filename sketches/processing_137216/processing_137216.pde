
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
  cloudsOne();
  w=w+move;
  if(w>=414){
    w=-312;
  }

if(mousePressed==true){
  background(0,0,50);
   stroke(255);
  strokeWeight(1);
  float o = random(0,400);
  float h = random(0,400);
  float p = random(0,250);
  float i = random(0,250);
  point (o,p);
  point (h,i);
  noStroke();
   fill(255);
  ellipse(200,40,30,30);
  float k = random(100,200);
   float j = random(200,255);
  fill(j,j,j);
  lightning();
  fill(k,k,k);
  cloudsTwo();
  float m = random(0,25);
  float n = random(100,130);
  fill(m,m,n);
  rect(0,250,400,150);
  
}
}

void cloudsOne () {
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
}

void cloudsTwo () {
ellipse(w-163,35,42,40);
  ellipse(w-177,35,40,42);
  ellipse(w-170,25,42,40);
  ellipse(w-191,35,40,42);
  ellipse(w-184,25,42,40);
ellipse(w,35,42,40);
  ellipse(w+7,25,40,42);
  ellipse(w+14,35,42,40);
  ellipse(w+21,25,40,42);
  ellipse(w+28,35,42,40);
  ellipse(w+70,90,42,40);
  ellipse(w+77,80,40,42);
  ellipse(w+84,90,42,40);
  ellipse(w+91,80,40,42);
  ellipse(w+98,90,42,40);
  ellipse(w+270,50,42,40);
  ellipse(w+277,40,40,42);
  ellipse(w+284,50,42,40);
  ellipse(w+291,40,40,42);
  ellipse(w+298,50,42,40);
  }

void lightning () {
  triangle(w+14,25,w+14,80,w,80);
triangle(w+14,70,w+28,70,w+14,120);
triangle(w+84,80,w+84,135,w+70,135);
triangle(w+84,125,w+98,125,w+84,175);
triangle(w+284,40,w+284,95,w+270,95);
triangle(w+284,85,w+298,85,w+284,135);
triangle(w-177,25,w-177,80,w-191,80);
triangle(w-177,70,w-163,70,w-177,120);
}
