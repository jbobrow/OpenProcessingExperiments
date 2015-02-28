
final float scale = 16;
final int ticksPerFrame = 65536;

public void setup(){
  size(512, 384);
  colorMode(HSB,1);
  background(0,0,0);
  
  loadPixels();
  
  for(int idx = 0; idx < pixels.length; idx++) //fill with perlin noise
   
   /*/
    pixels[idx] = color( noise(idx%width*scale/width, idx/width*scale/height),
                         noise(idx%width*scale/width + width, idx/width*scale/height + height),
                         .5, HSB);
  //*/pixels[idx] = color(random(1),random(1),.5,HSB);
                       
  updatePixels();
}

public void draw(){
  int x, y;
  color c;
  for(int count = 0; count < ticksPerFrame; count++){
      x = (int)random(0, width-1);
      y = (int)random(0, height-1);
      
      switch((int)random(0,4)){
      case 0:
        if(saturation(pixels[x + y*width]) > saturation(pixels[x + (y+1)*width])){
          c = pixels[x + y*width];
          pixels[x + y*width] = pixels[x + (y+1)*width];
          pixels[x + (y+1)*width] = c;
        } break;
      case 1:
        if(hue(pixels[x + y*width]) > hue(pixels[(x+1) + y*width])){
          c = pixels[x + y*width];
          pixels[x + y*width] = pixels[(x+1) + y*width];
          pixels[(x+1) + y*width] = c;
        } break;
      case 2:
        if(hue(pixels[x + (y+1)*width]) > hue(pixels[(x+1) + (y+1)*width])){
          c = pixels[x + (y+1)*width];
          pixels[x + (y+1)*width] = pixels[(x + 1)+(y+1)*width];
          pixels[(x+1) + (y+1)*width] = c;
        } break;
      case 3:
        if(saturation(pixels[(x+1) + y*width]) > saturation(pixels[(x+1) + (y+1)*width])){
          c = pixels[(x+1) + y*width];
          pixels[(x+1) + y*width] = pixels[(x+1) + (y+1)*width];
          pixels[(x+1) + (y+1)*width] = c;
        } break;
      }
    }
    
    updatePixels();
}
/*
class SorterThread extends Thread{
  boolean running;
  int wait;
  String id;
  
  SorterThread (int w, String s) {
    wait = w;
    running = false;
    id = s;
  }
  
  @Override
  void start () {
    running = true;
    super.start();
  }
  
  @Override
  void run() {
    loadPixels();
    for(int idx = 0; idx < pixels.length; idx++){
      pixels[idx] = -pixels[idx];
      
      try{sleep((long)(wait));}
      catch(Exception ex){}
    }
  }
  
  void quit() {
    running = false;
    interrupt();
  }
}
*/


