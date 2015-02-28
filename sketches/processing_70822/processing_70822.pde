
//  Title: Photography Filter: Tile Kaleidoscope (Active)
//  Description: A perlin noise-controlled particle is used to select a point on a photo; this point is used to generate a tile that is used to create a wallpaper that spans the screen.  The overall wallpaper subtley changes as the particle slowly traverses the image.
//  Date Started: Sept 2012
//  Last Modified: Sept 2012
//  http://www.asymptoticdesign.org/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.

//-----------------Globals
int tileSize = 96;
color pixelColor; 
PImage sourceImage;
Particle particle;
boolean showImage = false;

//-----------------Setup
void setup() {
  //size(1024,683);
  size(550,368);
  background(0);
  smooth();
  sourceImage=loadImage("leaves2.jpg");
  particle = new Particle();
}
 
//-----------------Main Loop
void draw() {
  particle.update();
  tileCursor(particle);
  if (showImage) {
    image(sourceImage,0,0);
  }
}

//-----------------Defined Functions
PImage makeTile(PImage outputImage) {
  for (int i=0; i<=outputImage.width/2; i++) {
    for (int j=0; j<=outputImage.height/2; j++) {
      pixelColor = outputImage.get(i,j);
      outputImage.set(i,j,pixelColor);
      outputImage.set(outputImage.width-i,j,pixelColor);
      outputImage.set(i,outputImage.height-j,pixelColor);
      outputImage.set(outputImage.width-i,outputImage.height-j,pixelColor);
    }
  }
  return outputImage;
}

void tileCursor(Particle particle) {
  PImage tile = makeTile(sourceImage.get((int)particle.position.x,(int)particle.position.y,tileSize,tileSize));
     for (int i = 0; i < width; i += tileSize) {
        for (int j = 0; j < height; j += tileSize) {
          image(tile,i,j);
        }
      }
}

//-----------------Interactions
void keyPressed() {
  if (key == ' ') {
    showImage = !showImage;
  }
  if (key == CODED) {
    if (keyCode == UP) {
      tileSize += 8;
      for (int i=0; i<width; i+=tileSize) {
      for (int j=0; j<height; j+=tileSize) {
        image(makeTile(sourceImage.get((int)particle.position.x,(int)particle.position.y,tileSize,tileSize)),i,j);
      }
    }
    }
    if (keyCode == DOWN) {
      tileSize -= 8;
      for (int i=0; i<width; i+=tileSize) {
      for (int j=0; j<height; j+=tileSize) {
        image(makeTile(sourceImage.get((int)particle.position.x,(int)particle.position.y,tileSize,tileSize)),i,j);
      }
    }
    }
  }
}

//-----------------Defined Classes
class Particle {
  PVector position, velocity;
  color particleColor = 255;
 
  Particle() {
    position = new PVector(random(width),random(height),0);
    velocity = new PVector(0,0,0);
  }
   
  void update() {
    velocity.x = 0.25*cos(TWO_PI*noise(0.001*position.x,0.001*position.y,0.001*position.z));
    velocity.y = 0.25*sin(TWO_PI*noise(0.001*position.x,0.001*position.y,0.001*position.z));
    position.add(velocity);
 
    //deal with edge cases     
    if (position.x<0) {
       position.x+=width;
    }

    if (position.x>width) {
       position.x-=width;
    }

    if (position.y<0) {
       position.y+=height;
    }

    if (position.y>height) {
       position.y-=height;
    } 
  }
 
  void render() {
    stroke(particleColor,16);
    line(position.x,position.y,position.x+velocity.x,position.y+velocity.y);
  }
}

