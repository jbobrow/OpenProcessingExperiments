
/*
 * --=[BUMP MAPPING]=--
 * by Jonsku, 2008
 * --
 * I wrote this following tutorials on the net a long time ago
 * and I forgot to note down the reference so I don't know who is to thank for...
 * thank you Internet then ;)
 * There is plenty of code, tutorial, explanation on bump mapping out there.
 * I apologize for the lack of comments in the code.
 * Because of that I also forgot how the lightning works, this is embarassing....
 * --
 * Click an Drag the mouse to move the light around
 * SPACE BAR to swicth between the composite image, the image and the bump map
 * 'p' to change the shading (Phong or 256 of color)
 * 'b' to change the bump map (Perlin noise or from the source image)
 */

PImage img;
PImage bMap;

String imageName = "flowers_compo";

//counter
int size = 60;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 5;  // Speed of the shape
float yspeed = 5;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

//palette
color[] palette;

//normal vectors
int[] normalVectX;
int[] normalVectY;

//environment map
float[] envMap;
int envMapSize = 255;

//ligh property
float AMB = 0;
float DIFFUSE = 200.0;
float SPECULAR = 100.0;

//0: composite image, 1:image, 2:bump map
int mode = 0;
//shading type
boolean phong = false;
boolean randomMotion = true;

boolean perlin = false;

void setup(){
  PFont f = loadFont("Serif-48.vlw");
  textFont(f,48);
  img=loadImage(imageName+".png");
  //size(img.width,img.height);
  //img = generateImage();
  size(784,579);
  
  normalVectX = new int[img.pixels.length];
  normalVectY = new int[img.pixels.length];
  mapToVectors();
  envMap = new float[envMapSize*envMapSize];
  calculateEnvMap();
  createPalette();
   xpos = width/2;
  ypos = height/2;
  
  

}

PImage generateBumpMap(){
  if(perlin){
    float noiseScale = 0.05;
     PImage noisy = createImage(width, height, RGB);
     noisy.loadPixels();
     for(int i=0;++i<width;){
      for(int j=0;++j<height;){
       noisy.pixels[i+j*width] = color(255*noise(i*noiseScale,j*noiseScale));
      } 
     }
     noisy.updatePixels();
     return noisy;
  }else{
    return loadImage(imageName+".png");
  }
   
}


void mouseDragged() 
{
xpos = mouseX;
ypos = mouseY;
randomMotion = false;
}

void mouseReleased(){
  randomMotion = true;
}

void keyReleased(){
  if(key==' '){
    mode = ++mode>2?0:mode;
  }else if(key == 'p'){
    phong = !phong;
    calculateEnvMap();
  }else if(key == 'b'){
    perlin = !perlin;
    mapToVectors();
  }
}


void draw(){
  
  if(mode==0){
    background(0);
    PImage s = bumpMapper(xpos,ypos);
    image(s,0,0);
    if(randomMotion){
      xpos = xpos + ( xspeed * xdirection );
      ypos = ypos + ( yspeed * ydirection );
    }
    
    // Test to see if the shape exceeds the boundaries of the screen
    // If it does, reverse its direction by multiplying by -1
    if (xpos > width-size || xpos < 0) {
      xdirection *= -1;
    }
    if (ypos > height-size || ypos < 0) {
      ydirection *= -1;
    }
  }else if(mode==1){
    image(img,0,0);
    text("Image", 15, 50);
  }else if(mode==2){
    image(bMap,0,0);
    text("Bumpmap", 15, 50);
  }
}

void  createPalette(){
  palette = new color[256];
  for (int i=0; i<192;i++)
    palette[i] = color(0,0,(i*63/192));
   for (int i=192; i<256;i++)
    palette[i] = color(i-192,i-192,63);
}

void mapToVectors(){
  bMap = generateBumpMap();
  bMap.loadPixels();
  for(int i=1;i<bMap.width-1;i++){
      for(int j=1;j<bMap.height-1;j++){
        normalVectX[i+bMap.width*j] = round((bMap.pixels[(i+1)+bMap.width*j] >> 16 & 0xFF) - (bMap.pixels[(i-1)+bMap.width*j]>> 16 & 0xFF));
        normalVectY[i+bMap.width*j] =  round((bMap.pixels[i+bMap.width*(j+1)] >> 16 & 0xFF) -  (bMap.pixels[i+bMap.width*(j-1)] >> 16 & 0xFF));
      }
  }
}

void calculateEnvMap(){
  for(int j=0;j<envMapSize;j++){
      for(int i=0;i<envMapSize;i++){
       float Nx = (i - 128)/128.0;
       float Ny = (j - 128)/128.0;
       float Nz = 1 - sqrt(Nx * Nx + Ny * Ny);
       if(Nz<0)
         Nz = 0;
       if(phong){
         envMap[i+envMapSize*j] = AMB + min(255-AMB,(Nz*DIFFUSE+Nz*Nz*SPECULAR));//Phong = ambient + dif*dot + dot^2*spec
       }else{
         envMap[i+envMapSize*j] = Nz*256; // 256 shades of colors
       }
       

      }
  }
}

PImage bumpMapper(float lightX,float lightY){
  return bumpMapper(round(lightX),round(lightY));
}

PImage bumpMapper(int lightX,int lightY){
  //colorMode(HSB, 255);
  PImage buffer = createImage(img.width, img.height, RGB);
  buffer.loadPixels();
  img.loadPixels();
  lightX +=128;
  lightY +=128;
  for(int i=0;i<img.width;i++){
    for(int j=0;j<img.height;j++){
      int nX = normalVectX[i+img.width*j];
      int nY = normalVectY[i+img.width*j];
      int lDistX = i-lightX;
      int lDistY = j-lightY;
      nX -= lDistX;
      nY -= lDistY;
      if(nX<0 || nX>=envMapSize)
        nX = 0;
      if(nY<0 || nY>=envMapSize)
        nY = 0;
        //println(i+img.width*j);
        //println(envMap[normalX+envMapSize*normalY]);
        /*if(envMap[nX+envMapSize*nY]>0.0 && envMap[nX+envMapSize*nY]<256.0){
          println(envMap[nX+envMapSize*nY]);
         }*/
        color imgColor = img.pixels[i+img.width*j];
        color nuColor = color(norm(envMap[nX+envMapSize*nY], 0, 255)*red(imgColor),norm(envMap[nX+envMapSize*nY], 0, 255)*green(imgColor),norm(envMap[nX+envMapSize*nY], 0, 255)*blue(imgColor));
        //color nuColor = color(hue(img.pixels[i+img.width*j]),envMap[nX+envMapSize*nY],brightness(img.pixels[i+img.width*j]));
        //color nuColor = color(envMap[nX+envMapSize*nY],saturation(img.pixels[i+img.width*j]),brightness(img.pixels[i+img.width*j]));
        buffer.pixels[i+img.width*j] = nuColor;
        //buffer.pixels[i+img.width*j] = palette[round(envMap[nX+envMapSize*nY])];
    }
  }
  buffer.updatePixels();
  return buffer;
}

