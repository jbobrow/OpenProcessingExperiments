
import java.awt.MouseInfo;

import java.util.Arrays;
import java.util.Collections;
import processing.video.*;

Capture video;
PImage img; 

Cube[] cubes;
int numCubes;
int numPixels;
int minW = 100;
int maxW = 200;
int wide = (int)random(minW, maxW);
int high = (int)random(15, 17);

// for random index array
Integer[] index; 
color[][] cubeColor;

// for fezzing
color[] still;
color[] locImgC;


int j;

int second = second();  // Values from 0 - 59
int minute = minute();  // Values from 0 - 59
int hour = hour();
int d = day();    // Values from 1 - 31
int m = month();  // Values from 1 - 12
int y = year();

boolean chaos = false;


void setup() {
  size(320, 240);

  numCubes = 100;
  video = new Capture(this, width, height);
  video.start();
  numPixels = video.width * video.height;
  j = numPixels-1;  

  // freezing
  still = new color[numPixels];

  cubes = new Cube[numCubes];

  for (int i=0; i<cubes.length; i++) {
    int x = (int)random(0, video.width);
    int y = (int)random(0, video.height);
    cubes[i] = new Cube(x, y, wide, high);
    wide = (int)random(minW, maxW);
  }


  //  println(cubes[0].x + ", " + cubes[200].x);
  //  println(cubes[0].y + ", " + cubes[10].y);
  //  println(i + ", " + (video.width-wide));



  // shuffle the index of array
  index = new Integer[numCubes];
  for (int i=0; i<index.length; i++) { 
    index[i] = i;
  }
  Collections.shuffle(Arrays.asList(index));

  cubeColor = new color[numCubes][wide*high];






  /*
//  if (video.available()) {
   video.read();
   video.loadPixels();
   
   for (int i=0; i<cubes.length; i++) {
   cubes[i].updateCube();
   //      cubes[i].moveCube();
   
   }
   updatePixels();
   //  }
   */
}



void captureEvent(Capture video) {
  video.read();
}



void draw() {
  
  second = second();  // Values from 0 - 59
  minute = minute();  // Values from 0 - 59
  hour = hour();

  video.loadPixels();
  loadPixels();

  // mirror the image!
  //    for(int x = 0; x < video.width; x++){
  //      for(int y = 0; y < video.height; y++){
  //        pixels[x+y*video.width] = video.pixels[(video.width-(x+1))+y*video.width];
  //      }
  //    }

  /*
  // LIVE background: pixel
  for (int i=0; i<video.width; i++) {
    for (int j=0; j<video.height; j++) {
      int pos = video.width-i-1 + j*video.width;
      int posOri = i + j*video.width;
      color currColor = video.pixels[posOri];
      pixels[pos] = currColor;
    }
  }
  

  // LIVE background: image
  pushMatrix();
  scale(-1, 1);
  image(video, -width, 0);
  popMatrix();
  /*
  
    // background
   for (int i=0; i<numPixels; i++) {
   color currColor = video.pixels[i];
   
   // faster method to extract rgba values
   int currR = (currColor >> 16) & 0xFF;
   int currG = (currColor >> 8) & 0xFF;
   int currB = currColor & 0xFF;
   //      int currA = (currColor >> 24) & 0xFF;
   
   //still[i] = color(currR, currG, currB);
   pixels[i] = color(currR, currG, currB);
   }
   
   
   for (int i=0; i<numPixels; i++) {
   if (j>=0) {
   //pixels[i] = still[j];
   j--;
   }
   }
   */


  // add on Glitch
  for (int i=0; i<cubes.length; i++) {
    cubes[i].updateCube();

    //      cubeColor[i] = cubes[i].pixelColor;

    //      cubes[i].x += random(10);
    //      cubes[i].y += random(5);


    //      for (int j=0; j<index.length; j++) {
    //        cubes[i].pixelColor = cubeColor[ index[j] ];
    //      
    //      }

    //      fill(cubes[100].pixelColor);
    //      rect(100,100,100,100);
    //      fill(cubes[100].pixelColor);
    //      rect(100,100,100,100);

    cubes[i].drawCube(cubes[i].getColor());
    
    
    //      println(cubes[0].x);
 ; }

  updatePixels();    


  //  println(index[0] + ", " + index.length + ", " + index[500] + ", " + index[200]);
  //  println(cubes[0].x + ", " + cubes[200].x);


  //show frame rate!
  fill(255);
  if (chaos) {
    text(m + "/" + d + "/" + y + "/"
    + hour +":"+ minute + ":" + second, 10, 20);
  } else {
    text(m + "/" + d + "/" + y + "/"
    + hour +":"+ minute + ":" + second, 20, 30);
  }

}

int mX;
int mY;

void mousePressed() {
  mX = mouseX;
  mY = mouseY;
}


void mouseDragged() {
  frame.setLocation(
  MouseInfo.getPointerInfo().getLocation().x-mX,
  MouseInfo.getPointerInfo().getLocation().y-mY);
}


void keyPressed() {
  if (key == 's') {
    save("background");
    println("saved!");
  } else {
    for (int i=0; i<cubes.length; i++) {
//      wide = (int)random(minW, maxW);
//      cubes[i].x = (int)random(0, video.width-maxW);
//      cubes[i].y = (int)random(0, video.height-high);
//      cubes[i].updateCube();
      cubes[i].drawCube(cubes[i].getNewColor());
    }
  }
}

public void init() {
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();
  super.init();
}


class Cube{
  
  int x,y;
  int xN,yN;
  int w,h;
  int[] pixelLoc;
  int[] pixelOriLoc;
  color[] pixelColor;
  
  
  Cube(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    pixelLoc = new int[w*h];
    pixelOriLoc = new int[w*h];
    pixelColor = new color[w*h];
  }
  
  
  
  
  void updateCube() {
    int c=0;
    
    for (int i=x; i<x+w; i++) {
      for (int j=y; j<y+h; j++) {
        
        int locPixel = width-i-1+j*width;
        int locOriPixel = i+j*width;
        color locColor = video.pixels[constrain(locOriPixel, 0, numPixels-1)];
        
        pixelLoc[c] = locPixel;
        pixelOriLoc[c] = locOriPixel;
        pixelColor[c] = locColor;
        c++;
      }
    }    
  }
  

  
  void moveCube() {
    for (int i=0; i<pixelLoc.length; i++) {
      pixelLoc[i] += (int)random(-10, 10);
      pixels[constrain(pixelLoc[i],0,numPixels-1)] = pixelColor[i];
    }
  }
  
  
  void newColor(color[] nColor) {
    pixelColor = nColor;
  }
  
  
  
  
  
  void drawCube() {
    for (int i=0; i<pixelLoc.length; i++) {
      pixels[constrain(pixelLoc[i],0,numPixels-1)] = pixelColor[i];
    }
  }
  
  
  
  
  void drawCube(int[] pColor) {
    int noise=0;
    for (int i=0; i<pixelLoc.length; i++) {
      
      if (frameCount % 80 < random(10,20) || frameCount % 100 > random(90,100)) {
        noise = (int)random(50);
      } 
      
      if (frameCount % (int)random(15,20) == 0) {
        noise = (int)random(-300,300);
        int pixMap =(int)map(pixelLoc[i]+noise, -300, pixelLoc.length+300, 0, pixelLoc.length);
        pixels[constrain(pixMap, 0, numPixels-1)] = pColor[i];
      } else {
        pixels[constrain(pixelLoc[i]+noise, 0, numPixels-1)] = pColor[i];
      }
      
      if (frameCount % 300 < random(120,150) || frameCount % 200 > 74) {
        chaos = true;
        pixelOriLoc[i] += (int)random(-10, 10);
        pixelColor[i] = video.pixels[constrain(pixelOriLoc[i], 0, numPixels-1)] * 2;
        pixels[constrain(pixelLoc[i]+noise, 0, numPixels-1)] = pixelColor[i];
      } else {
        chaos = false;
      }
    }
  }


  int[] getLoc() {
    return pixelLoc;
  }
  

  color[] getColor() {
    return pixelColor;
  }
  
  color[] getNewColor() {
//    color[] newC;
    
    for (int i=0; i<pixelLoc.length; i++) {
      pixelLoc[i] += (int)random(-10, 10);
      
      pixelColor[i] = video.pixels[constrain(pixelLoc[i], 0, numPixels-1)] * 2;
    }
    return pixelColor;
  }
  
}


