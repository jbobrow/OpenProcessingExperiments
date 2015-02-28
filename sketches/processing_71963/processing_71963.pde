
void setup() {
   size(600, 600);
   background(255, 255, 255);
   colorMode(HSB, 100);
   grid();
 }
 
void draw() {
 }
 
void grid() {
   for (int x=0;x<600;x+=60) {
     for (int y=0;y<600; y+=60) {
       fill(random(128));
       rect(x, y, 60, 60);
       if (random(100)<50) {
         tri(x, y);
       } else {
          tri2(x,y);
       }
     }
   }
   for (int i=0;i<2000;i+=1) {
     point(random(height), random(width));
   }
 }
 
void tri(int x, int y) {
   fill(random(128));
   triangle(x+30, y+5, x+5, y+55, x+55, y+55);
   ellipse(x+30, y+35, 25, 15);
   fill(0);
   ellipse(x+30, y+35, 5, 5);
 }
 
void tri2(int x, int y) {
   fill(random(200));


 }

