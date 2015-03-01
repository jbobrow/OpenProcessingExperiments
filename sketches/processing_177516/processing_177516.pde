

import ddf.minim.*;

int x = 218;
int y = 587;
int z = 404;
int j = 452;
int m = 580;
int n = 476;
int o = 717;
int p = 486;
int r = 805;
int s = 634;
int g = 1022;
int h = 332;
int v = 1036;
int w = 529;
int radius = 25;

float dis=0;
color[] palette = {#1C4DFA,#2DFAEA,#2DB7FA,#A2CDFA,#2F4BF5,#D3D1FF};
int counter=0;



float q = 0;
int radius2 = 40;
float k = -radius2;
float speed = 5;
//working with Images in Processing

//Declare a PImage variable type
PImage moon;
//Declare global variables
Minim minim;
AudioSample ecosystem_001;
//Load audiofiles from HDD

//Load an image file from HDD
/*Don't forget to add the file
to your sketch 'data' folder*/
void setup() {
  size (1280,720);
   moon = loadImage("moon.png");
  minim = new Minim(this);
  ecosystem_001 = minim.loadSample("ecosystem_001.mp3");
 frameRate(100);

  
}
  //Draw the image to the screen at (0,0)
void draw() {
   background(#000000);
   image (moon, 1050, 50);
   
    if (key == 'r') {
    k += speed; // Increase the value of x
    //for(counter=0;counter<50;counter++) {
    //while(dis <1000){
    //dis = dist(k+30,400,l,a);
     for(counter=0;counter<50;counter++) {
     float l = random(k-300);
     float a = random(200, height-200);    
     strokeWeight(random(5));
     stroke(palette[int(random(6))]);
     //while (l
     //if(k>840) l = random(640, k-300);
     if(k>1380) l=1280;
     line(k+30,360,l,a);
     stroke(0);
     line(k+30,360,l,a);
     }
   stroke (#66B0F0);
   strokeWeight (5);
   fill(#FFFFFF);
   ellipse(k, 360, 60, 30);
   }
  

   stroke (#3842FA);
       
     if (key == 'b') stroke (random(0,145),random(0,205),random(0,255),150);
   strokeWeight (2);
   line ( x, (y-25),x,(y+25));  //vertikal
   strokeWeight (3);
   line ( (x-20), y,(x+20),y);  //gorizontal
   strokeWeight (4);          //diagonalu
   line ( (x-10), (y-10),(x+10),(y+10));
   line ( (x-10), (y+10),(x+10),(y-10));
   strokeWeight (13);
   point (x, y);          //K1
   
    if (key == 'b') stroke (random(0,145),random(0,205),random(0,255),100);
   strokeWeight (2);
   line ( z, (j-25),z,(j+25));  //vertikal
   strokeWeight (3);
   line ( (z-20), j,(z+20),j);  //gorizontal
   strokeWeight (4);          //diagonalu
   line ( (z-10), (j-10),(z+10),(j+10));
   line ( (z-10), (j+10),(z+10),(j-10));
   strokeWeight (13);
   point (z,j);       //K2
   
   if (key == 'b') stroke (random(0,145),random(0,205),random(0,255),80);
   strokeWeight (2);
   line ( m, (n-25),m,(n+25));  //vertikal
   strokeWeight (3);
   line ( (m-20), n,(m+20),n);  //gorizontal
   strokeWeight (4);          //diagonalu
   line ( (m-10), (n-10),(m+10),(n+10));
   line ( (m-10), (n+10),(m+10),(n-10));
   strokeWeight (13);
   point (m,n);       //K3
   
   if (key == 'b') stroke (random(20,100),random(20,205),random(0,255),255);
   strokeWeight (2);
   line ( o, (p-25),o,(p+25));  //vertikal
   strokeWeight (3);
   line ( (o-20), p,(o+20),p);  //gorizontal
   strokeWeight (4);          //diagonalu
   line ( (o-10), (p-10),(o+10),(p+10));
   line ( (o-10), (p+10),(o+10),(p-10));
   point (o,p);       //K4
   
   if (key == 'b')stroke (random(0,145),random(0,205),random(0,255),180);
   strokeWeight (2);
   line ( r, (s-25),r,(s+25));  //vertikal
   strokeWeight (3);
   line ( (r-20), s,(r+20),s);  //gorizontal
   strokeWeight (4);          //diagonalu
   line ( (r-10), (s-10),(r+10),(s+10));
   line ( (r-10), (s+10),(r+10),(s-10));
   strokeWeight (13);
   point (r,s);       //K5
   
   if (key == 'b') stroke (random(0,145),random(0,205),random(0,255),200);
   strokeWeight (2);
   line ( g, (h-25),g,(h+25));  //vertikal
   strokeWeight (3);
   line ( (g-20), h,(g+20),h);  //gorizontal
   strokeWeight (4);          //diagonalu
   line ( (g-10), (h-10),(g+10),(h+10));
   line ( (g-10), (h+10),(g+10),(h-10));
   strokeWeight (13);
   point (g, h);       //K6
      
   if (key == 'b') stroke (random(0,145),random(0,205),random(0,255),190);
   strokeWeight (2);
   line ( v, (w-25),v,(w+25));  //vertikal
   strokeWeight (3);
   line ( (v-20), w,(v+20),w);  //gorizontal
   strokeWeight (4);          //diagonalu
   line ( (v-10), (w-10),(v+10),(w+10));
   line ( (v-10), (w+10),(v+10),(w-10));
   strokeWeight (13);
   point (v,w);       //K7
}

void mouseClicked() { 
  
  float d = dist(mouseX, mouseY, x, y);
  if (d < radius) ecosystem_001.trigger();
    
  float l = dist(mouseX, mouseY, z, j);
  if (l < radius) ecosystem_001.trigger();
  
  float f = dist(mouseX, mouseY, m, n);
  if (f < radius) ecosystem_001.trigger();

  float b = dist(mouseX, mouseY, o, p);
  if (b < radius) ecosystem_001.trigger();
  
   float a = dist(mouseX, mouseY, r, s);
  if (a < radius) ecosystem_001.trigger();
  
   float c = dist(mouseX, mouseY, g, h);
  if (c < radius) ecosystem_001.trigger();
  
  float e = dist(mouseX, mouseY, v, w);
  if (e < radius) ecosystem_001.trigger();
}


