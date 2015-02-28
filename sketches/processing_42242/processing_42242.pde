
  PImage img;
int dimension;
int r;
int g;
int b;

void setup() {
size (300, 300);

smooth ();
noStroke();

}



void draw() {
background (255);



 for(int i=0; i<100;i=i+10){
   
   background(255);
   dimension= int (random(5,100));
   
   if (mousePressed) {
     r= int (random(0,255));
     
   g = int (random(0,255));
     b= int (random(0,255));
   tint(r,g,b);
   
 }
  

drawHeart(   loadImage("butterfly.jpg"), mouseX,mouseY, dimension, dimension   );

}

}


void drawHeart (PImage img, int x, int y, int largh, int alt){
 
smooth();

image(img, x, y, largh, alt);
  
  
}

