
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
 
 
}



