
/* A DEM (Digital Elevation Model) is used for the 3d model of a terrain, a raster image where white is the highes tpoint
black is the lowest point etc.
Tn this case after using ArcGIS data driven pages I wanted a way to visualize the terrain without putting it into a model and 
see general changes with labels in each. 
*/


PImage img;       // source DEM
PFont DIN;
int cellsize = 6; // DEM cell size
int columns, rows;   
int b;
String fileName = "1.jpg";                       
float minElevation_m = 143.86;          // min elevation in meters
float maxElevation_m = 768.70;         // max elevation in meters

void setup() {
  size(800, 600, P3D); 
  img = loadImage(fileName);  // Load the image
  columns = img.width / cellsize;  // Calculate # of columns
  rows = img.height / cellsize;  // Calculate # of rows
  DIN = loadFont("DIN-Medium-48.vlw");
  img.loadPixels();
}

void draw() {
  background(0);
    translate(img.width/2, img.height/.8);
  rotateX(.6);
  for ( int i = 0; i < columns; i++) {  // columns
    for ( int j = 0; j < rows; j++) {// rows
      int x = i*cellsize + cellsize/2;  
      int y = j*cellsize + cellsize/2; 
      int loc = x + y*img.width;  
      color c = img.pixels[loc];  //get value
      // elevation
     int index  = (y * img.width) + x;
     int pixel  = img.pixels[ index ];
      float bnd1= red(pixel);
    float elevation = map( bnd1, 0, 255, minElevation_m, maxElevation_m );
      float z = brightness(img.pixels[loc]) - 20.0;
      float dia = map( elevation, minElevation_m, maxElevation_m, 1, cellsize);
      b = int(elevation);
      //draw this
      pushMatrix();
      translate(x-200, y-400, z);
      fill(c, 200);
      stroke(c);
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
     
      if (i%10==2) {
      if (j%10==2) {
      textFont(DIN);
      fill(250);
      textSize(8);
      text(b, cellsize, cellsize, z);
    }
      }
       popMatrix();
    }
    }
 //     save( fileName +"site"+".jpg");
 //uncomment to save to folder for drawings


    }
      void mousePressed(){
      noLoop();
      }

    
 
  




