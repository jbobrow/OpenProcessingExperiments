
//echoechonoisenoise 2011
//set of image processing filters taken from examples/topics/image processing
//mostly by Daniel Shiffman.
//pictures are Zaha Hadid's 'The Peak' project

PImage[] source;
int mode=1;
int currentPic=0;

void setup() {
  size(450,700);
  source=new PImage[3];
  source[0]=loadImage("zaha1.jpg");
  source[1]=loadImage("zaha2.jpg");
  source[2]=loadImage("zaha3.jpg");
  image(source[currentPic],0,0);
}

void draw() {
}
void keyPressed() {
  if(key=='0')mode=0;
  else if(key=='1')mode=1;
  else if(key=='2')mode=2;
  else if(key=='3')mode=3;
  else if(key=='4')mode=4;
  else if(key=='5')mode=5;
  else if(key=='6')mode=6;
  else if(key=='7')mode=7;
  else if(key=='8')mode=8;
  else if(key=='9')mode=9;
  else if(key==' '){
    if(currentPic<2)currentPic++;
    else{
     currentPic=0; 
    }
    image(source[currentPic],0,0,width,height);
  }
}
void mouseDragged() {
  switch (mode) {
  case 1:
    if(mouseButton==LEFT) {
      for(int x=width;x>1;x--) {
        set(x,mouseY,get(x-1,mouseY));
      }
    }
    if(mouseButton==RIGHT) {
      for(int y=height;y>1;y--) {
        set(mouseX,y,get(mouseX,y-1));
      }
    }
    break;
  case 2:
    if(mouseButton==LEFT) {
      loadPixels();
      for(int x=0;x<width-1;x++) {
        pixels[mouseY*width+x]=pixels[mouseY*width+x+1];
      }
      updatePixels();
    }
    if(mouseButton==RIGHT) {
      loadPixels();
      for(int y=0;y<height-1;y++) {
        pixels[y*width+mouseX]=pixels[(y+1)*width+mouseX];
      }
      updatePixels();
    }
    break;
  case 3:
    if(mouseButton==LEFT) {
      loadPixels();
      int rpt=(int)random(5,50);
      int rRange=(int)random(2,7);
      for(int x=mouseX-rRange;x<mouseX+rRange;x++) {
        for(int y=mouseY-rRange;y<mouseY+rRange;y++) {
          if(x>rpt&&x<width-rpt&&y>rpt&&y<height-rpt)pixels[y*width+x]=pixels[(rpt+y)*width+rpt+x];
        }
      }
      updatePixels();
    }
    if(mouseButton==RIGHT) {
      loadPixels();
      int rpt=(int)random(5,50);
      int rRange=(int)random(3,10);
      for(int x=mouseX-rRange;x<mouseX+rRange;x++) {
        for(int y=mouseY-rRange;y<mouseY+rRange;y++) {
          if(x>rpt&&x<width-rpt&&y>rpt&&y<height-rpt)pixels[y*width+x]=color((int)255-red(pixels[(rpt+y)*width+rpt+x]),(int)255-green(pixels[(rpt+y)*width+rpt+x]),(int)255-blue(pixels[(rpt+y)*width+rpt+x]));
        }
      }
      updatePixels();
    }
    break;
  case 4:
    float v = 1.0/9.0;
    float[][] kernel = { 
      { 
        v, v, v
      }
      ,
      { 
        v, v, v
      }
      ,
      { 
        v, v, v
      }
    };
    if(mouseButton==LEFT) {
      loadPixels();
      int rRange=(int)random(3,11);
      for(int x=mouseX-rRange;x<mouseX+rRange;x++) {
        for(int y=mouseY-rRange;y<mouseY+rRange;y++) {
          float sumR = 0;
          float sumG = 0;
          float sumB = 0;
          if(x>1&&x<width-1&&y>1&&y<height-1) {
            for (int ky = -1; ky <= 1; ky++) {
              for (int kx = -1; kx <= 1; kx++) {
                int pos = (y + ky)*width + (x + kx);
                float valR = red(pixels[pos]);
                float valG = green(pixels[pos]);
                float valB = blue(pixels[pos]);
                sumR += kernel[ky+1][kx+1] * valR;
                sumG += kernel[ky+1][kx+1] * valG;
                sumB += kernel[ky+1][kx+1] * valB;
              }
            }
            pixels[y*width + x] = color(sumR,sumG,sumB);
          }
        }
      }
      updatePixels();
    }
    if(mouseButton==RIGHT) {
      loadPixels();
      int rRange=(int)random(3,11);
      for(int x=mouseX-rRange;x<mouseX+rRange;x++) {
        for(int y=mouseY-rRange;y<mouseY+rRange;y++) {
          float sum = 0;
          if(x>1&&x<width-1&&y>1&&y<height-1) {
            for (int ky = -1; ky <= 1; ky++) {
              for (int kx = -1; kx <= 1; kx++) {
                int pos = (y + ky)*width + (x + kx);
                float val = brightness(pixels[pos]);
                sum += kernel[ky+1][kx+1] * val;
              }
            }
            pixels[y*width + x] = color(sum);
          }
        }
      }
      updatePixels();
    }
    break;
  case 5:
    float[][] kernel1 = { 
      { 
        -1, -1, -1
      }
      ,
      { 
        -1,  9, -1
      }
      ,
      { 
        -1, -1, -1
      }
    };
    if(mouseButton==LEFT) {
      loadPixels();
      int rRange=(int)random(3,10);
      for(int x=mouseX-rRange;x<mouseX+rRange;x++) {
        for(int y=mouseY-rRange;y<mouseY+rRange;y++) {
          float sum = 0;
          if(x>1&&x<width-1&&y>1&&y<height-1) {
            for (int ky = -1; ky <= 1; ky++) {
              for (int kx = -1; kx <= 1; kx++) {
                int pos = (y + ky)*width + (x + kx);
                float val = brightness(pixels[pos]);
                sum += kernel1[ky+1][kx+1] * val;
              }
            }
            pixels[y*width + x] = color(red(get(x,y)),sum,blue(get(x,y)));
          }
        }
      }
      updatePixels();
      break;
    }
    if(mouseButton==RIGHT) {
      loadPixels();
      int rRange=(int)random(3,10);
      for(int x=mouseX-rRange;x<mouseX+rRange;x++) {
        for(int y=mouseY-rRange;y<mouseY+rRange;y++) {
          float sum = 0;
          if(x>1&&x<width-1&&y>1&&y<height-1) {
            for (int ky = -1; ky <= 1; ky++) {
              for (int kx = -1; kx <= 1; kx++) {
                int pos = (y + ky)*width + (x + kx);
                float val = green(pixels[pos]);
                sum += kernel1[ky+1][kx+1] * val;
              }
            }
            pixels[y*width + x] = color(sum,green(get(x,y)),blue(get(x,y)));
          }
        }
      }
      updatePixels();
    }
    break;
  case 6:
    if(mouseButton==LEFT) {
      loadPixels();
      int rRange=5;
      for(int x=mouseX-rRange;x<mouseX+rRange;x++) {
        for(int y=mouseY-rRange;y<mouseY+rRange;y++) {
          if(x>rRange&&x<width-rRange&&y>rRange&&y<height-rRange)pixels[y*width+x]=color((int)hue(pixels[y*width+x])+10,(int)saturation(pixels[y*width+x])-15,(int)brightness(pixels[y*width+x])+10);
        }
      }
      updatePixels();
    }
    if(mouseButton==RIGHT) {
      loadPixels();
      int rRange=2;
      for(int x=mouseX-rRange;x<mouseX+rRange;x++) {
        for(int y=mouseY-rRange;y<mouseY+rRange;y++) {
          if(x>rRange&&x<width-rRange&&y>rRange&&y<height-rRange)pixels[y*width+x]=color((int)hue(pixels[y*width+x])+5,(int)saturation(pixels[y*width+x])-15,(int)brightness(pixels[y*width+x])+5);
        }
      }
      updatePixels();
    }
    break;
  case 7:
    int rRange2=(int)random(10,70);
    if(mouseButton==LEFT) {
      for(int x=mouseX+rRange2;x>mouseX-rRange2;x--) {
        if(x>0&&x<width)set(x,mouseY,get(x-1,mouseY));
      }
    }
    if(mouseButton==RIGHT) {
      for(int x=mouseX-rRange2;x<mouseX+rRange2;x++) {
        if(x>0&&x<width)set(x,mouseY,get(x+1,mouseY));
      }
    }
    break;

  case 8:
    int rRange3=(int)random(50,150);
    if(mouseButton==LEFT) {
      for(int y=mouseY+rRange3;y>mouseY-rRange3;y--) {
        if(y>0&&y<height)set(mouseX,y,get(mouseX,y-1));
      }
    }
    if(mouseButton==RIGHT) {
      for(int y=mouseY-rRange3;y<mouseY+rRange3;y++) {
        if(y>0&&y<height)set(mouseX,y,get(mouseX,y+1));
      }
    }
    break;
  case 9:
    float[][] kernel2 = { 
      { 
        -1, -1, -1
      }
      ,
      { 
        -1,  9, -1
      }
      ,
      { 
        -1, -1, -1
      }
    };
    if(mouseButton==LEFT) {
      loadPixels();
      int rRange=(int)random(5,15);
      for(int x=mouseX-rRange;x<mouseX+rRange;x++) {
        for(int y=mouseY-rRange;y<mouseY+rRange;y++) {
          float sum = 0;
          if(x>1&&x<width-1&&y>1&&y<height-1) {
            for (int ky = -1; ky <= 1; ky++) {
              for (int kx = -1; kx <= 1; kx++) {
                int pos = (y + ky)*width + (x + kx);
                float val = red(pixels[pos]);
                sum += kernel2[ky+1][kx+1] * val;
              }
            }
            pixels[y*width + x] = color(red(get(x,y)),sum,blue(get(x,y)));
          }
        }
      }
      updatePixels();
    }
    if(mouseButton==RIGHT) {
      loadPixels();
      int rRange=(int)random(5,15);
      for(int x=mouseX-rRange;x<mouseX+rRange;x++) {
        for(int y=mouseY-rRange;y<mouseY+rRange;y++) {
          float sum = 0;
          if(x>1&&x<width-1&&y>1&&y<height-1) {
            for (int ky = -1; ky <= 1; ky++) {
              for (int kx = -1; kx <= 1; kx++) {
                int pos = (y + ky)*width + (x + kx);
                float val = saturation(pixels[pos]);
                sum += kernel2[ky+1][kx+1] * val;
              }
            }
            pixels[y*width + x] = color(sum,green(get(x,y)),blue(get(x,y)));
          }
        }
      }
      updatePixels();
      break;
    }
  }
}



