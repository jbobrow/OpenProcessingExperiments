
//Made by Prince Jacob

int blocksize;

 void setup() {
   size(500,700);
   blocksize = 35;
   stroke(0,0,0);
   smooth();
 }

 void draw() {
   for(int y=15; y<height; y+=blocksize) {
     for(int x=15; x<width; x+=blocksize) {
       fill(int(random(255)),int(random(255)),random(223), 30);
       ellipse(x,y,blocksize,blocksize);
     }
   }
   int specialX = mouseX - (mouseX % blocksize);
   int specialY = mouseY - (mouseY % blocksize);
  fill( int(random(255)), int(random(255)), int(random(255)) );
   ellipse(specialX, specialY, blocksize, blocksize);
 }


