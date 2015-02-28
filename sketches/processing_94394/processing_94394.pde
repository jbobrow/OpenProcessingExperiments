
void setup () {
smooth ();
size (200,200);
strokeWeight (0.1);

}

void draw () {
  for (int x=10; x<width; x+=15) {
  for (int y=10; y<height; y+=15) {
  fill ((x+y)*1.1,x,y,100);
  stroke ((x+y)*1.7,x*1.7,y*1.7,100);
  ellipse (x,y,25,25);
   }
  }  
}

