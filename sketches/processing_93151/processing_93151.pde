
/*
 * TV Noise
 * 
 * a random dot pattern of static displayed when no transmission signal
 * is obtained by the antenna receiver of television set and other
 * display devices
 *
 */
int[] ppx;
Random generator = new Random();

void setup() {
  size(640,480);
  loadPixels();  
  ppx = new int[pixels.length];
  for (int y = 0; y < ppx.length;)
      ppx[y++] = color(generator.nextInt(2)*255);
  frameRate(9223372036854775807L);

}
void draw() {
  for (int y = 0; y < height;)
     arrayCopy(ppx, generator.nextInt(height), pixels, y++*width,width);
  updatePixels();
}

void mousePressed(){
  println(frameRate);    
}


