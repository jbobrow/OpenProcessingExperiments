
import netscape.javascript.*;
int[] ppx;
Random generator = new Random();

void setup() {
  size(640,480);
  loadPixels();  
  ppx = new int[pixels.length];
  for (int y = 0; y < ppx.length;y++) {
      int spread = generator.nextInt(5);
      switch(spread) {
        case(1):
            if(y-640 > 0) {
                ppx[y] = ppx[y-640];
            }
            break;
        case(2):
            if(y-1 > 0) {
                ppx[y] = ppx[y-1];
            }
            break;
        case(3):
            ppx[y] = color(0,generator.nextInt(2)*200,0,170);
            if(y+640 < ppx.length) {
                ppx[y+640] = ppx[y];
            }
            break;
        case(4):
            ppx[y] = color(0,generator.nextInt(2)*200,0,170);
            if(y+1 < ppx.length) {
                ppx[y+1] = ppx[y];
            }
            break;
        case(0):
            break;
      };
  }
  frameRate(100000000000L);
arrayCopy(ppx,0,pixels,0,ppx.length);

}
void draw() {
  for (int y = 0; y < height;)
     arrayCopy(ppx, generator.nextInt(height/2), pixels, y++*width,width);
  for (int y = 0; y < height;)
     arrayCopy(pixels, generator.nextInt(height/2), pixels, y++*width,width);
  int row = generator.nextInt(height/2);
  arrayCopy(pixels,row,ppx,row*width,width);
  updatePixels();
}

void mousePressed(){
  println(frameRate);    
}



