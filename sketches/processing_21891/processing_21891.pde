
/**
 * Explode 
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls breaking apart of image and 
 * Maps pixels from a 2D image into 3D space. Pixel brightness controls 
 * translation along z axis. 
 */
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioPlayer mysound1;
AudioPlayer mysound2;
AudioMetaData meta;

PImage img; 
PImage img2;       // The source image// The source image
int cellsize = 4; // Dimensions of each cell in the grid
int columns, rows,columns2, rows2;   // Number of columns and rows in our system

void setup() {
  size(1000, 900, P3D); 
  
  minim = new Minim(this); 

  mysound1 = minim.loadFile("Shimmy Shimmy Ya Short.mp3", 500);    //change this lower for cool audio effects    // load the MP3 // set a buffersize
  mysound2 = minim.loadFile("Blue Flowers Short.mp3", 500);    //change this lower for cool audio effects    // load the MP3 // set a buffersize
  meta = mysound1.getMetaData();
  meta = mysound2.getMetaData();
  
  
  mysound1.loop();  
  mysound2.loop(); 
  
   
    
  img = loadImage("odb.jpeg");  // Load the image
  img2 = loadImage("dr-octagon.jpeg");  // Load the image
  
  columns = img.width / cellsize;  // Calculate # of columns
  rows = img.height / cellsize;  // Calculate # of rows
  
  columns2 = img2.width / cellsize;  // Calculate # of columns
  rows2 = img2.height / cellsize;  // Calculate # of rows


}

void draw() {
  background(0);
  if (mouseX<width/2){
  mysound1.play();
  mysound2.pause();
  } else {
    mysound1.pause();
    mysound2.play();
  }
  
  odb(0,height/4);
  docOcto(width/2,height/4);

}

void mousePressed() {

    mysound1.loop();
    mysound2.loop();
}


  
  
void odb(int X, int Y){

  for ( int i = 0; i < columns; i++) {
      // Begin loop for rows
      for ( int j = 0; j < rows; j++) {
        
        int x = i*cellsize + cellsize/2;  // x position
        int y = j*cellsize + cellsize/2;  // y position
        int loc = x + y*img.width;  // Pixel array location
//        color c = img.pixels[loc];  // Grab the color
        // Calculate a z position as a function of mouseX and pixel brightness
        //float z = (mouseX / float(width)) * brightness(img.pixels[loc]) - 20.0;
        float z = (mysound1.left.get(i)) * (mysound1.right.get(j)) * -1000;// + brightness(img.pixels[loc]) - 20.0;
        // Translate to the location, set fill and stroke, and draw the rect
        color c = img.pixels[loc] + int(z) *1; 
        pushMatrix();
        translate(x + X, y + Y, z);
        fill(c,z+150);
        noStroke();
        rectMode(CENTER);
        rect(0, 0, cellsize, cellsize);
        popMatrix();
      }
    }
  
}

void docOcto(int X, int Y){

  for ( int i = 0; i < columns2; i++) {
      // Begin loop for rows
      for ( int j = 0; j < rows2; j++) {
        
        int x = i*cellsize + cellsize/2;  // x position
        int y = j*cellsize + cellsize/2;  // y position
        int loc = x + y*img2.width;  // Pixel array location
       // color c = img2.pixels[loc];  // Grab the color
        // Calculate a z position as a function of mouseX and pixel brightness
        //float z = (mouseX / float(width)) * brightness(img.pixels[loc]) - 20.0;
        float z = (mysound2.left.get(i)) * (mysound2.right.get(j)) * 1000;// + brightness(img.pixels[loc]) - 20.0;
        // Translate to the location, set fill and stroke, and draw the rect
        color c = img2.pixels[loc] + int(z); 
        pushMatrix();
        translate(x + X, y + Y, z);
        fill(c,z+150);
        noStroke();
        rectMode(CENTER);
        rect(0, 0, cellsize, cellsize);
        popMatrix();
      }
    }
  
}

void stop()
{
  // always close Minim audio classes when you finish with them
  mysound1.close();
    mysound2.close();
  // always stop Minim before exiting
  minim.stop();
 
  super.stop();
}


