
PImage pixelimage;
 
void setup(){
  size(1000,700);
  colorMode(HSB,360,100,100,100);
  pixelimage=loadImage("pixelimage.jpg");
  photoFilter();
}

void photoFilter(){
  pixelimage.loadPixels();//loads pixel array
  int imgSize= pixelimage.width * pixelimage.height;
  float hueCount = 0;
  float bCount = 0;
  float sCount = 0;
  for(int i=0; i < imgSize; i++){
    color cp = pixelimage.pixels[i];
    float h=hue(cp);
     hueCount +=h;
    float b= brightness(cp);
        bCount +=b;
    float s=saturation(cp);
    sCount +=s;
  

     
   pixelimage.pixels[i] = color(h,s,b);
  }
   float avgHue= hueCount/imgSize;
   float aB= bCount/imgSize;
   float sB= sCount/imgSize;
   fill(avgHue,sB,aB);
   
   pixelimage.updatePixels();
  image(pixelimage,0,0);
  rect(100,100,100,100);
   

      
    }


