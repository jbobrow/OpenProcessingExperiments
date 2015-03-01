

int x;
int noHit1 = -20;
int firstHit1 = 100;
int secondHit1 = 200;
int thirdHit1 = 300;
int fourthHit1 = 400;

float g;
float y;
float r; 
float s;
float ballSize = 100;
float ballSpeed = 5;
 
//background changes color when ball bounces
boolean firstHit = false;
boolean secondHit = false;
boolean thirdHit = false;
boolean fourthHit = false;
 
void setup() {
  size(500,500);
  int x = 20;
  r= 50;
 s= 0; 
y= height/10;
g= .9;
}
// changing background color
void draw() {
  background(255);
    if (y >= height - r) {
    s*= -.8;
    y = height - r;
  }

if (firstHit) {
  background(200,200,100);
}
 else if (secondHit) {
  background(150,0,150);
}
else if (thirdHit) {
  background(100,180,50);
}
 else if (fourthHit) {
  background(50,50,190);
  
}
//ball draw
fill(100,50,150);
ellipse(width/2, y, 2*r,2*r);
s+= g;
y+= s;
}
// background changes color when ball hits location
void mousePressed() {
  if (firstHit1 == 100) {
    firstHit = false;
  }
   if (secondHit1 == 200){
     secondHit= true;
   }
   if (thirdHit1 == 300){
     thirdHit= true;
   }
  if (fourthHit1 == 400){
   fourthHit = true;
  }
}
//ball bounce
void mouseDragged() {
  if ((x > x-r) && (x < x+r) && (y > y-r) && (y < y+r)) {
    x = width/2;
    y = height/10;
    s=g=0;
  }
}
 
 
void mouseReleased() {
  g=.9;
  s+= g;
  y+= s;
  if (y >= height - r) {
    s*= -.8;
    y = height - r;
  }
}





