
int counter;
PImage myIMG;
void setup() {  //setup function called initially, only once
  size(400,400);
  myIMG=createImage(width,height);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  myIMG.loadPixels();
  float cenX=width/2;
  float cenY=height/2;
  for(int i=0;i<width;i++){
      for(int j=0;j<height-1;j++){
          float x=(cenX-i)/cenX;
          float y=(cenY-j)/cenY;
          int greyVal=x*x+y*y<0.9?((int)(127*(x*x-y*y))+128):0;
          myIMG.pixels[i+width*j]=color(greyVal);
      }
  }
}

void draw() {  //draw function loops 
   image(myIMG,0,0);
}
