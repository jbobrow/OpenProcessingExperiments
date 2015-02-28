
int blocksize;


 void setup() {
   frameRate(60);
   size(250,250);
   blocksize = 20;
   noStroke();
 }

 void draw() {
   
   for(int y=0; y<height; y+=blocksize/2) {
     for(int x=0; x<width; x+=blocksize/2) {
       fill(random(0,64),random(0,223),random(255), 15);
       ellipse(x,y,blocksize,blocksize);
     }
   }
   int specialX = mouseX - (mouseX % blocksize);
   int specialY = mouseY - (mouseY % blocksize);
   fill(255,0,0);
   ellipse(specialX, specialY, blocksize, blocksize);
 }

 

