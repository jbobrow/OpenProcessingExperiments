
/*
* --=[Angular fisheye simulation]=--
* by Jonsku, September 2010
* --
* From the article by Paul Bourke : http://local.wasp.uwa.edu.au/~pbourke/miscellaneous/domefisheye/fisheye/
* Move mouse to change camera position.
*/

import controlP5.*;

float aperture = 180; //fisheye lens angle in degrees

float minS= 0;
float maxS = 50;

PImage img;

String someText = "Whatever it is,\n it was inside the Sphere.\n Now it's out, free to act. ";

//A very simple antialiasing/gap filling pass
BeautyPass bPass;

void setup(){
 img = loadImage("pattern.png");
 size(300,300);
 textFont(loadFont("ArialRoundedMTBold-48.vlw"));

  bPass = new BeautyPass();
  smooth();
  setupControl();
  //noLoop();
}

void draw(){
  background(0);
  switch(int(graphicsChoice.value())){
    case 2:
    drawNoise();
    break;
    case 3:
    image(img,0,0,width,height);
    break;
    case 4:
    drawText();
    break;
    case 1:
    default:
      drawGrid(20);
  }
  //drawNoise();
  //image(img,0,0,width,height);
  //drawPlasma();
  //drawSeedDistribution();
  //image(seedRender,0,0);
  //image(fisheye(),0,0);
  if(fisheye.getState())
    fisheye();
}

void drawText(){
  fill(0,255,0);
  text(someText,sin(frameCount*0.1)*(width-textWidth(someText)),180+sin(HALF_PI+frameCount*0.01)*(height-170));
}


void drawNoise(){
  pushStyle();
  colorMode(RGB,1.0);
  loadPixels();
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      pixels[i+j*width] = color(noise((frameCount+i)*0.1,j*0.1),noise((frameCount+i)*0.1,j*0.1,0.3),noise((frameCount+i)*0.05,j*0.05,0.6));
    }
  }
  updatePixels();
  popStyle();
}

void drawGrid(int row){
  stroke(255);
  strokeWeight(2);
  for(float i=1;i<=row;i++){
    line(0,i*height/row,width,i*height/row);
    line(i*height/row,0,i*height/row,height);
  }
}

/*
NOTE: This function is not called, it is only here to extract the angular fisheye calculation from the rest of the code for clarity.
aperture  : the angle of the simulated camera, in radians.
camX, camY: the coordinates of the camera.
i,j       : the coordinates of the pixel to transform
*/
PVector fisheyeCoordinates(float aperture, float camX, float camY, float i, float j){
  float halfAperture = radians(aperture)/2;
  
  //define camera positionin normalized coordinates
  camX = (2.0*camX)/width-1;
  camY = (2.0*camY)/width-1;
  
  //transform pixel coordinates to normalised coordinates, range -1 tot 1
  float x = (2.0*i)/width-1;
  float y = (2.0*j)/height-1;

  //radius r to x camera
  float r = dist(0,0,x,y);
  //at this stage any pixels where r > 1 are ignored
  if(abs(r)>1){
    return null;
  }
  //angle phi to x axis
  float phi = atan2(y,x);
  //r is mapped onto theta and hi is used directly as the polar coordinates of the direction vector from the camera into the scene
  float theta = halfAperture*r;
  //transform normalised coordinates to pixel coordinates
  return new PVector(map(sin(theta)*cos(phi),-1.0,1,0,width), map(sin(theta)*sin(phi),-1.0,1,0,height));
}

void fisheye(){
  float halfAperture = radians(aperture)/2;
  
  //define camera positionin normalized coordinates
  float camX = (2.0*mouseX)/width-1;
  float camY = (2.0*mouseY)/width-1;

  loadPixels();
  for(float i = 0;i<width;i++){
    //transform pixel coordinates to normalised coordinates, range -1 tot 1
    float x = (2.0*i)/width-1;
    for(float j = 0;j<height;j++){
      float y = (2.0*j)/height-1;
      //radius r to camera
      float r = dist(camX,camY,x,y);
      //at this stage any pixels where r > 1 are ignored
      if(abs(r)>1){
        continue;
      }
      //angle phi to x axis
      float phi = atan2(y-camY,x-camX);
      //r is mapped onto theta and phi is used directly as the polar coordinates of the direction vector from the camera into the scene
      float theta = halfAperture*r;
      //transform normalised coordinates to pixel coordinates
      float dX = map(sin(theta)*cos(phi),-1.0,1,0,width);
      float dY = map(sin(theta)*sin(phi),-1.0,1,0,height);
      
      /*
      Because the pixel array uses integer coordinates, black empty pixels will appear in the resulting image.
      To attempt to fix this, the destination pixel is calculated with 3x3 combinations of roundings (round-round, round-floor, round-ceil, floor-floor, floor-round, etc.). Thus one pixel might have several colors but that is takan into account and
      the final value will be the average colors. See BeautyPass, it will become clearer.
      
      NOTE: This works ok for aperture up to 180 but above that it is not enough.
      */
      int fX = round(dX);
      int fY = round(dY);
      bPass.addColor(fX+fY*width,pixels[int(i+j*width)]);
      
      fX = round(dX);
      fY = floor(dY);
      bPass.addColor(fX+fY*width,pixels[int(i+j*width)]);
      
      fX = round(dX);
      fY = ceil(dY);
      bPass.addColor(fX+fY*width,pixels[int(i+j*width)]);
      
      
      fX = floor(dX);
      fY = floor(dY);
      bPass.addColor(fX+fY*width,pixels[int(i+j*width)]);
      
      fX = floor(dX);
      fY = round(dY);
      bPass.addColor(fX+fY*width,pixels[int(i+j*width)]);
      
      fX = floor(dX);
      fY = ceil(dY);
      bPass.addColor(fX+fY*width,pixels[int(i+j*width)]);
      
      
      fX = ceil(dX);
      fY = ceil(dY);
      bPass.addColor(fX+fY*width,pixels[int(i+j*width)]);

      fX = ceil(dX);
      fY = round(dY);
      bPass.addColor(fX+fY*width,pixels[int(i+j*width)]);

      fX = ceil(dX);
      fY = floor(dY);
      bPass.addColor(fX+fY*width,pixels[int(i+j*width)]);
    }
  }
  bPass.render();
  bPass.reset();
}

//The fishey function leaves holes in the image, this function fill them by bluring
void fillEmptyPixels(int[] pixelArray){
  for(int i=0;i<pixelArray.length;i++){
    if(pixelArray[i]!=color(0,0,0,0))
      continue;
    pixelArray[i] = color(0);
    //println("blur");
    int x = i%width;
    int y = int((i-x)/width);

    int sumR = 0;
    int sumG = 0;
    int sumB = 0;
    int count = 0;
    for(int u=x-1;u<=x+1;u++){
      for(int v=y-1;v<=y+1;v++){
        if(u<0 || v<0 || u>=width || v>=height ||(u == x && u == y))
          continue;
        if( pixelArray[u+v*width] == color(0,0,0,0))
          continue;
        count++;
        sumR += pixelArray[u+v*width] >> 16 & 0xFF;
        sumG += pixelArray[u+v*width] >> 8 & 0xFF;
        sumB += pixelArray[u+v*width] & 0xFF;
      }   
    }
    if(count>0){
      pixelArray[i] = color(sumR/count, sumG/count, sumB/count,255);
    }

  }
}



