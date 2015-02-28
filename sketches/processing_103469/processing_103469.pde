
// Draw a grid based on perlin values stored in an image array
// C. Gregg
// 3rd July 2013
//
// 

PImage noiseMap; // Image to hold Perlin data

int offsetX, offsetY; // values to offset position of grid on screen
int cellSize = 20; // size of each cell
int gridX = 30; // horizontal resolution of perlin field
int gridY = 30; // vertical resolution of perlin field

// Perlin noise settings
float xOff, yOff, zOff; // perlin offset
float  xInc = 0.01; //
float  yInc = 0.01;
float increment = 0.01;
float zincrement = 0.02;


void setup() {
  size(1000, 1000, P3D);
  offsetX = width/2-cellSize*(gridX/2);
  offsetY = height/2-cellSize*(gridY/2);
//noStroke();

strokeWeight(0.5);
stroke(0,0,100);

  noiseMap = createImage(gridX, gridY, RGB); // create image to store Perlin noise

}


void draw() {
  // create camera
  
  background(255);
  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
  // default eyeZ = (height/2.0) / tan(PI*30.0 / 180.0)
camera(500, 1500, 500, width/2.0, height/2.0, 0, 0, 1, 0);
 //println(mouseY*10);
  pushMatrix();

  translate(offsetX, offsetY);
  
  // create perlin image
  noiseDetail(20,0.6f);
  
  noiseMap.loadPixels();
    xOff = 0.0;
  for (int i = 0; i<gridX; i++) {
    xOff +=increment;
    yOff = 0.0;
    for (int j = 0; j<gridY; j++) {
       yOff +=increment;
        float val = map(noise(xOff, yOff,zOff), 0, 1, 0, 255);
     noiseMap. pixels[i+j*noiseMap.width] = color(val,0,0);
      //print(  grid[i][j]+" " );
    }
  
  }
zOff +=zincrement;
  noiseMap.updatePixels();
 //image(noiseMap,0,0);
  
  
  
  // draw grid
  noiseMap.loadPixels();
    for (int i = 0; i<gridX-1; i++) {
    for (int j = 0; j<gridY-1; j++) {
     // println(i+" "+j+" "+grid[i][j]);
        // float col = map(grid[i][j] , 50, 176, 0, 255);
      //   println(col);
   //   fill(col,col,col);
  // color zVal = noiseMap.pixels[i+j*noiseMap.width];
   int r = (noiseMap.pixels[i+j*noiseMap.width] >> 16) & 0xFF;
fill(0,0,r);
 //  println(i+" "+j+" "+noiseMap.get(i,j));
      float z1 =(noiseMap.pixels[i+j*noiseMap.width]>> 16) & 0xFF;//grid[i][j]
       float z2 =(noiseMap.pixels[i+(j+1)*noiseMap.width]>> 16) & 0xFF;//grid[i][j+1]
       float z3 =(noiseMap.pixels[(i+1)+(j+1)*noiseMap.width]>> 16) & 0xFF;//grid[i+1][j+1]
       float z4 =(noiseMap.pixels[(i+1)+j*noiseMap.width]>> 16) & 0xFF;//grid[i+1][j]
      beginShape();
  
      vertex(i*cellSize, j*cellSize, z1);
      vertex(i*cellSize, (j+1)*cellSize, z2);
      vertex((i+1)*cellSize, (j+1)*cellSize, z3);
      vertex((i+1)*cellSize, j*cellSize, z4);
      endShape(CLOSE);
    }
  }
  popMatrix();
  
}


