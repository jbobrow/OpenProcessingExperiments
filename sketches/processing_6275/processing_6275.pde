
int blocksize;

 void setup() {
   size(1280, 1000);
   blocksize = 50;
   noStroke();
   smooth();
   frameRate(999999999);
 }

 void draw() {
  for(int y=0; y<height; y+=blocksize) 
   {
     for(int x=0; x<width; x+=blocksize) 
     {
       fill(random(255),random(255),random(255));
       ellipse(x,y,blocksize,blocksize);
     }
   }
  int specialX = mouseX - (mouseX % blocksize);
  int specialY = mouseY - (mouseY % blocksize);
  fill(255);
  ellipse(specialX, specialY, blocksize, blocksize);
 }


