
public class RandomLineBG{
  
  float frame;
  float headX, headY;
  float pheadX, pheadY;
  
  PGraphics bgBuffer;
  
  PImage rawFrame, finalFrame;
  
  public RandomLineBG(int sizeX, int sizeY){
  bgBuffer = createGraphics(sizeX, sizeY,P2D);
  bgBuffer.colorMode(HSB);
  bgBuffer.beginDraw();
  bgBuffer.strokeWeight(bgBuffer.width/20);
  bgBuffer.endDraw();
    
  frame = 0;
  headX = (int)random(bgBuffer.width);
  headY = (int)random(bgBuffer.height);
  pheadX = headX;
  pheadY = headY;

  finalFrame = bgBuffer;
  }
  
  public PImage handleAsTexture(){
  bgBuffer.beginDraw();
  bgBuffer.stroke(200*tan(frameCount), 255, 255);
  bgBuffer.line(headX, headY, pheadX, pheadY);
  bgBuffer.endDraw();
  pheadX = headX;
  pheadY = headY;
  headX = random(-1,1)*bgBuffer.width*(2*sin(frameCount))+random(bgBuffer.width/15)+(bgBuffer.width/2);
  headY = random(-1,1)*bgBuffer.height*(2*sin(frameCount))+random(bgBuffer.height/15)+(bgBuffer.height/2);
  
  fastSmallShittyBlur(bgBuffer, finalFrame);
  return finalFrame;
  }
  
  void fastSmallShittyBlur(PImage a, PImage b){ //a=src, b=dest img
    a.loadPixels();
    b.loadPixels();
    int pa[]=a.pixels;
    int pb[]=b.pixels;
    int h=a.height;
    int w=a.width;
    final int mask=(0xFF&(0xFF<<2))*0x01010101;
    for(int y=1;y<h-1;y++){ //edge pixels ignored
      int rowStart=y*w  +1;
      int rowEnd  =y*w+w-1;
      for(int i=rowStart;i<rowEnd;i++){
        pb[i]=(
          ( (pa[i-w]&mask) // sum of neighbours only, center pixel ignored
           +(pa[i+w]&mask)
           +(pa[i-1]&mask)
           +(pa[i+1]&mask)
          )>>2)
          |0xFF000000 //alpha -> opaque
          ;
      }
    }
  }
}

    

