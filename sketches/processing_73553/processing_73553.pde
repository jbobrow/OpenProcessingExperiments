
// shows use of keyPressed and keyCode
PImage down1;
PImage down2;
PImage down4;
PImage up1;
PImage up2;
PImage up4;
PImage left1;
PImage left2;
PImage left4;
PImage right1;
PImage right2;
PImage right4;
PImage forest;
int xloc; //holds x location of ellipse
int yloc; //holds y location of ellipse
int speed = 20; //distance moved each draw
int r;
int l;
int d;
int u;

void setup() { 
 size(800,600);
 xloc = width/2; // set ellipse into middle to start
 yloc = height/2; // set ellipse into middle to start
 d=0;
 u=0;
 l=0;
 r=1;
 smooth();
 background(255);
 down1 = loadImage("Down1.png");
 down2 = loadImage("Down2.png");
 down4 = loadImage("Down4.png");
 up1 = loadImage("Up1.png");
 up2 = loadImage("Up2.png");
 up4 = loadImage("Up4.png");
 left1 = loadImage("Left1.png");
 left2 = loadImage("Left2.png");
 left4 = loadImage("Left4.png");
 right1 = loadImage("Right1.png");
 right2 = loadImage("Right2.png");
 right4 = loadImage("Right4.png");
 forest = loadImage("Forest.png");
} 

void draw() {
  background(forest); 
  if (d == 1) {
  image (down1, xloc, yloc);
  }
 if (d == 2) {
  image (down2, xloc, yloc);
 }
if (d == 3) {
  image (down4, xloc, yloc);
 } 
 if (d == 4) {
  image (down2, xloc, yloc);
 }
 if (d > 4) {
   d=1;
 }
 if (u == 1) {
  image (up1, xloc, yloc);
  }
 if (u == 2) {
  image (up2, xloc, yloc);
 }
if (u == 3) {
  image (up1, xloc, yloc);
 } 
 if (u == 4) {
  image (up4, xloc, yloc);
 }
 if (u > 4) {
   u=1;
 }
  if (l == 1) {
  image (left1, xloc, yloc);
  }
 if (l == 2) {
  image (left2, xloc, yloc);
 }
if (l == 3) {
  image (left1, xloc, yloc);
 } 
 if (l == 4) {
  image (left4, xloc, yloc);
 }
 if (l > 4) {
   l=1;
 }
  if (r == 1) {
  image (right1, xloc, yloc);
  }
 if (r == 2) {
  image (right2, xloc, yloc);
 }
if (r == 3) {
  image (right1, xloc, yloc);
 } 
 if (r == 4) {
  image (right4, xloc, yloc);
 }
 if (r > 4) {
   r=1;
 }
} 

void keyPressed() {
  println(keyCode);
  //left
   if(keyCode == 37){
     xloc = xloc - speed;
     l= l+1;
     r=0;
     u=0;
     d=0;
   }
   //right
    if(keyCode == 39){
     xloc = xloc + speed;
     r=r+1;
     l=0;
     u=0;
     d=0;
   }
   //down
    if(keyCode == 40){
     yloc = yloc + speed;
     d= d+1;
     u=0;
     l=0;
     r=0;
   }
   //up
    if(keyCode == 38){
     yloc = yloc - speed;
     u=u+1;
     d=0;
     r=0;
     l=0;
   }
}


