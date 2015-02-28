
PImage[][][] img;
boolean isReverse=false;
int iters=1;
void setup() {
//  frameRate(25);
  img = new PImage[iters][2][2];
  for (int i=0; i<iters; i++) {
    img[i][0][0]=loadImage("Sequence 1 32.png");
    img[i][0][1]=loadImage("Sequence 1 32 vflip.png");    
    img[i][1][0]=loadImage("Sequence 1 32 h.png");        
    img[i][1][1]=loadImage("Sequence 1 32 hflip.png");            
    for (int h=0; h<2; h++) {
      for (int f=0; f<2; f++) {
        img[i][h][f].resize((int)img[i][h][f].width/(i+1),
                            (int)img[i][h][f].height/(i+1));
        img[i][h][f].loadPixels();
      }
    }
  }
//  img=loadImage("Sequence 1 32.png");
//  img.loadPixels();
//  img2=loadImage("Sequence 1 32 vflip.png");
//  img2.loadPixels();
  size(img[0][0][0].width,img[0][0][0].width);  
//  size(img[0][1][0].width,img[0][1][0].height);  
  background(0);
  loadPixels();  
}

void draw() {
  int stringNum[][][] = new int[iters][2][2];
  isReverse = frameCount % (img[0][0][0].width*2) > img[0][0][0].width ? true : false;
  for (int i=0; i<iters; i++) {
    for (int h=0; h<2; h++) {
      for (int f=0; f<2; f++) {      
        stringNum[i][h][f]=round(frameCount*100);      
        if (h==0) {
          if(f==1)
            stringNum[i][h][f]+=208; //286-78
          stringNum[i][h][f]%=img[i][h][f].height;
          
        }
        else { 
          if(f==1)
            stringNum[i][h][f]+=364; //286+78          
          stringNum[i][h][f]%=img[i][h][f].width; 
        }
      }
    }
  }

  if (!isReverse) {
    for (int j=0; j<height; j++) {
      for (int i=0; i<img[0][0][0].width; i++) {    
        pixels[i+j*img[0][0][0].width]+=img[0][0][0].pixels[i+(stringNum[0][0][0]+j)%img[0][0][0].height*img[0][0][0].width]-1000;
      }
    }
    
    for (int j=0; j<height; j++) {
      for (int i=0; i<img[0][0][1].width; i++) {    
        pixels[i+j*img[0][0][1].width]+=img[0][0][1].pixels[i+(img[0][0][1].height-stringNum[0][0][1]+j)%img[0][0][1].height*img[0][0][1].width];
      }
    }
  
    for (int j=0; j<width; j++) {
      for (int i=0; i<img[0][1][0].height; i++) {    
        pixels[i*width+j]+=img[0][1][0].pixels[i*img[0][1][0].width+(stringNum[0][1][0]+j)%img[0][1][0].width];
      }
    }
    
    for (int j=0; j<width; j++) {
      for (int i=0; i<img[0][1][1].height; i++) {    
        pixels[i*width+j]+=img[0][1][1].pixels[i*img[0][1][1].width+(img[0][1][1].width-stringNum[0][1][1]+j)%img[0][1][1].width];
      }
    }
  
  } else {

    for (int j=0; j<height; j++) {
      for (int i=0; i<img[0][0][0].width; i++) {    
        pixels[i+j*img[0][0][0].width]-=img[0][0][0].pixels[i+(stringNum[0][0][0]+j)%img[0][0][0].height*img[0][0][0].width]-1000;
      }
    }
    
    for (int j=0; j<height; j++) {
      for (int i=0; i<img[0][0][1].width; i++) {    
        pixels[i+j*img[0][0][1].width]-=img[0][0][1].pixels[i+(img[0][0][1].height-stringNum[0][0][1]+j)%img[0][0][1].height*img[0][0][1].width];
      }
    }
  
    for (int j=0; j<width; j++) {
      for (int i=0; i<img[0][1][0].height; i++) {    
        pixels[i*width+j]-=img[0][1][0].pixels[i*img[0][1][0].width+(stringNum[0][1][0]+j)%img[0][1][0].width];
      }
    }
    
    for (int j=0; j<width; j++) {
      for (int i=0; i<img[0][1][1].height; i++) {    
        pixels[i*width+j]-=img[0][1][1].pixels[i*img[0][1][1].width+(img[0][1][1].width-stringNum[0][1][1]+j)%img[0][1][1].width];
      }
    }
  }  
  updatePixels();
//  save(frameCount + ".png");
//  color(255);
//  line(0,height/2, width, height/2);
//  delay(1000);
}

