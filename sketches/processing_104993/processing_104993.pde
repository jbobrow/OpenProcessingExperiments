
float x=10;
float y=10;
float m=15;
float n=15;

float e=0;
float f=0;
float g=0;
float h=0;
float i=0;

float cloudx=0;
float cloudy=100;

float xchange=0;
float ychange=0;
float echange=0;
float fchange=0;
float mchange=0;
float nchange=0;


void setup() {
  size(800, 600);
  x=width/2;
  y=height/2;
  m=width/3;
  n=height/3;
  e=height/4;
  f=height/4;

// background(7,193,247);

fill(247,240,7);
noStroke();
ellipse(700,100,100,100);

fill(20,144,42);
noStroke();
ellipse(100,600,400,400);
ellipse(400,700,500,500);
ellipse(650,600,400,400);




}





void draw() {

  int d=(int) random(5);

  /* 
   if (d==1){
   y++;
   } else if (d==2){
   x++;
   } else if (d==3){
   y--;
   } else if (d==4){
   x--;
   }
   */
  float xchange=cos(radians(g))*1;
  float ychange=sin(radians(g))*1;
  x=x+xchange;
  y=y+ychange;
  g=g+random(-5, 5);

if (x>=width||x<0) {
  x=0;
}

if (y>=height||y<0) {
  y=0;
}

 
   float echange=cos(radians(h))*1;
  float fchange=sin(radians(h))*1;
  e=e+echange;
  f=f+fchange;
  h=h+random(-5, 5);

if (e>=width||e<0) {
  e=0;
}

if (f>=height||f<0) {
  f=0;
}

  float mchange=cos(radians(i))*1;
  float nchange=sin(radians(i))*1;
  m=m+mchange;
  n=n+nchange;
  i=i+random(-5, 5);

if (m>=width||m<0) {
  m=0;
}

if (n>=height||n<0) {
  n=0;
}
 
 
 
 

noStroke();
  fill(255, 0, 0);
  ellipse(x, y, 50, 50);
    fill(18, 227, 16);
  ellipse(m, n, 57, 58);
    fill(152, 16, 227);
  ellipse(e, f, 57, 58);
  
//background
 fill(7,193,247,50);
 rect(0,0,width,height);
 
//sun
fill(247,240,7);
noStroke();
ellipse(700,100,100,100);

//hills
fill(20,144,42);
noStroke();
ellipse(100,600,400,400);
ellipse(400,700,500,500);
ellipse(650,600,400,400);

//cloud
fill(255,255,255);
rect(cloudx,100,170,115);
ellipse(cloudx+10,153,125,125);
ellipse(cloudx+150,153,125,125);
ellipse(cloudx+80,100,125,125);
cloudx=cloudx+0.5;

if (cloudx>=width+100) {
  cloudx=-200;
}
}
