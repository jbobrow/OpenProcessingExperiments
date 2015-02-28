
PImage img;
PImage img1;
PImage img2;
PImage img3;
PFont font;

    int sLx=-10000;//street line markers
    int sLy=360;//street line markers
    
    int hx=-10000;//house positions
    int hy=-45;//house positions
    
    int lx=-10000;//light positions
    int ly=-15;//light positions
   
    int clx=-10000;//light positions
    int cly=455;//light positions
    
int bBx = -10000;
 
int time1 = 2000;
int time2 = 4000;
 
int startX = 1; // Initial x-coordinate
int stopX = 720; // Final x-coordinate
int startY = 40; // Initial y-coordinate
int stopY = 600; // Final y-coordinateint startX = 1; // Initial x-coordinate
 
int startX1 = 320; // Initial x-coordinate
int stopX1 = 1; // Final x-coordinate
int startY1 = 1; // Initial y-coordinate
int stopY1 = 480; // Final y-coordinate
 
float x = startX; // Current x-coordinate
float y = startY; // Current y-coordinate
float x1 = startX1; // Current x1-coordinate
float y1 = startY1; // Current y1-coordinate
float step = 0.004; // Size of each step (0.0 to 1.0)
float pct = 0.1; // Percentage traveled (0.0 to 1.0)
float x2 = -350;
 
float angle = 0.0;
float offset = 260;
float scalar = 340;
float speed = 0.05;
 
float offset1 = 660;
float scalar1 = 340;
 
void setup() {
size(1280, 720);
img= loadImage("house.png");
img1= loadImage("background.png");
img2= loadImage("lightpost.png");
img3= loadImage("lightpost2.png");
}
void draw() {
image (img1, 1, 1);

fill(240,179,45);
  for(int x=sLx; x <=10000; x+=60)
     {
       fill(240,179,45);
       rectMode(CENTER);
       rect(x,sLy,25,10);
     }
   sLx++;

 for(int x=clx; x <=10000; x+=200)
     {
       image (img2, x,cly);
     }
   clx++;
   
for(int x=hx; x <=10000; x+=350)
     {
       image (img, x,hy);
     }
   hx++;

 
 for(int x=lx; x <=10000; x+=200)
     {
       image (img3, x,ly);
     }
   lx++;
   
stroke(0);
textSize(60);
text ("Drive or Die",50,200);
 
 fill(240,79,45); // elipse obstacle
   if (pct < 1.0) {
x = startX + ((stopX-startX) * pct);
y = startY + ((stopY-startX) * pct);
pct += step;
}

   
  fill(24,19,145); // rectangle obstacle
   if (pct < 3.0) {
x1 = startX1 + ((stopX1-startX1) * pct);
y1 = startY1  + ((stopY1-startX1) * pct);
pct += step;
}
rect(x1, y1, 20, 20);
 
 
int currentTime = millis();//triangle obstacle
if (currentTime > time2) {
x2 -= 2;
} else if (currentTime > time1) {
x2 += 2;
}
triangle(x2,10, x2+590, 450, x2, 490);
 
 
float x1 = offset1 + sin(angle) * scalar1;
float x2 = offset1 + sin(angle+10) * scalar1;
float x3 = offset1 + sin(angle+3) * scalar1;
float y1 = offset + sin(angle) * scalar+100;
float y2 = offset + sin(angle + 1) * scalar+100;
float y3 = offset + sin(angle + 3) * scalar+190;
 
ellipse( x1-10, y1-190, 40, 40);
ellipse( x2+10, y2+200, 40, 40);
ellipse( x3-20, y3, 40, 40);
angle += speed;
}



