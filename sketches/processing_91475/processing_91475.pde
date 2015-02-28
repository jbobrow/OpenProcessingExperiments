
/* @pjs preload="lizard.jpg, bug3.png"; */
 
PImage img;
PImage img2;
float[] x = {50, 25};
float[] y = {50, 25};
float a = 40;
float b = 40;
float speed2 = 2.0;
float[] speed = {2.0, 0.4};
//int[] speedy = 2;
//float radius = 15;
int directionA = 2;
int directionB = -2;
int directionX = 2;
int directionY = -2;
float size = 100;
 
void setup() {
 size( 700, 600);
 

}

  
 
void draw() { 

   background(0);
   rect(0,0,width, height);
   img = loadImage("bug3.png");
   img2 = loadImage("bug2.png");
   image(img, x[0], y[0],size,size);
   y[0] += speed[1] * directionY;
   if ((y[0] > height - 53) || (y[0] <  -35 )) {
    directionY = -directionY;
   }
   x[0] += speed[0] * directionX;
   if ((x[0] > width - 53 ) || (x[0] < -30 )) {
    directionX = -directionX;
}

image(img2, a, b,size,size);
   b += speed2 * directionB;
   if ((b > height - 50) || (b < 50 )) {
    directionB = -directionB;
   }
   a += speed2 * directionA;
   if ((a > width - 53) || (a < -30 )) {
    directionA = -directionA;
   }

}


