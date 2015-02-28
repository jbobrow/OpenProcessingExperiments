
/**
 * 2D "cloud" (Perlin Noise):
 * author:hsiu-wen,ou
 * reference:http://www.shiffman.net/teaching/nature/week-1/
 */
float increment=0.01;
void setup(){
  size(200,200);
  smooth();
  frameRate(15);
}
void draw(){
  if(mousePressed){
  saveFrame("clould2.jpg");
  }
   float increment=random(mouseX,random(0.01));
  loadPixels();
  
  float xoff = 0.0;//xoff以0開始
  //以x和y的增量來計算noise和產出亮度  
  for(int x=0;x<width;x++){
    xoff +=increment;
    float yoff = 0.0;//xoff的每次計算,y都從0從新計算
   for (int y = 0; y < height; y++) {//將y方向的增量改為(1+increat)
      yoff =(1+increment)+yoff ;
    //計算noise
    float bright = noise(xoff,yoff)*255;
    pixels[x+y*width] = color(bright); 
    }
   
  }
  updatePixels();
}


