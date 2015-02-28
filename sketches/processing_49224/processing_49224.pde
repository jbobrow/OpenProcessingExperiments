
bbox[] bunch;
int count = 200;
float curvex = .05;
float curvey = .05;
float bshrink = .02;
int cdrift = 1;
int countw = 500;
int countf = countw;
int satur = 150;
int bright  = 200;
 
void setup() {
  size (900,600);
  colorMode (HSB);
  bunch = new bbox[count];
  for (int i = 0; i<count; i++) {
    bunch[i] = new bbox();
  }
}
 
void draw() {
   countf--;
   if  (countf == 0 ) {
     countf = int(random (countw-50, countw+50));
     satur = int(random (50,150));
     bright  = int(random (100,250));
     println ("notice");
     for (int i = 0; i<count; i++) {
       bunch[i].xspeed = random(0,2);
       bunch[i].yspeed = random(0,2);
       bunch[i].distance = random(2,10);
     }
   }
   fill(255,10);
   rect (0,0,width,height);
   for ( int i = 0; i<count; i++) {
    bunch[i].show();
    bunch[i].moveb();
  }
}
 
class bbox { color c; float xpos; float ypos; float xspeed; float yspeed; float distance; float bsize;
 
bbox () {
  c = int(random(60,155));
  xpos = random(width);
  ypos = random(height);
  xspeed = random(0,2);
  yspeed = random(0,2);
  distance = random(2,10);
  bsize = (random(5,30));
}
 
void show() {
  fill(30);
  stroke (1);
  c = c + cdrift;
  if (c  >255 ) { c = int(random(20,55));}
  fill (c,100,200,250);
  ellipse (xpos,ypos,bsize,bsize);
}
 
void moveb() {
  xspeed = xspeed + curvex;
  yspeed = yspeed + curvey;
  xpos =  xpos + xspeed ;
  ypos =  ypos + yspeed;
  if (xpos > width) { xpos = 1;}
  if (xpos < 0) { xpos = width;}
  if (ypos > height) { ypos = 1;}
  if (ypos < 0) {ypos = height;}
   
  distance--;
  if (distance < 0) {
     distance = int(random(100,150));
     xspeed = random(-2,2);
     yspeed = random(-2,2);
     curvex = random(-.2,.2);
     curvey = random(-.2,.2);
   }
  bsize = bsize - bshrink;
  if (bsize <2 ) {bsize =(random(10,30));}
 }
}
 
 
 
void mouseClicked () {
  countf = 3;
}
