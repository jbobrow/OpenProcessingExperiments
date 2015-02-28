
/****************************************************************
  This program makes a sort of kinetic color halftone of a given 
  image.  It takes the average color (in each channel) within a tile
  of pixels, and uses that as a fill color for a semi-opaque 
  semicircle. 
****************************************************************/

PImage unmodified;              //The image to be modified
final int pxPerTile = 10;       //How big each tiles of pixels will be
float radius;                   //Radius of the semicircles

circle[] tiled;                 //an array of circles that will create
                                //the new image

int tileIterator;               //variable for iterating trhough the
                                //tiled array

float[] cosX = new float[21];   //since the semicircles are composed of triangles
float[] sinY = new float[21];   //this will store all the edge points of the
                                //in one place

void setup(){

  unmodified = loadImage("zebra.jpg");
  size(unmodified.width, unmodified.height, P3D);
  noStroke();
    tileIterator = 0;
        
  int tilesX = (int) (width / pxPerTile);
  int tilesY = (int) (height / pxPerTile);
  int totalTiles = tilesX * tilesY;

  tiled = new circle [totalTiles];        //initialize tiled
  for (int i = 0; i < totalTiles; i++){   //and populate it with objects
    tiled[i] = new circle();
  }  
  
  radius = pxPerTile / 2.0;                //radius for the semiCircles
  
  for (int i = 0; i < 21; i++){            //creates relative x and y coords
    float frac = (float)i/20.0;            //for the triangles to make them
    float theta = frac * TWO_PI;           //form a semicircle
    cosX[i] = radius * cos(theta);  
    sinY[i] = radius * sin(theta);
  }

  image(unmodified, 0, 0);

  tileInfo(tilesX, tilesY);                //see method below

}

void draw(){

  background(0);

  for (int i = 0; i < tiled.length; i++){
    tiled[i].generateCircles();
  }
  
  blend(0, 0, 400, 400, 0, 0, 400, 400, ADD);    //Interpolates the pixels over each using an additive method

}


/*tileInfo is used to jump to the top-left corner of each of the tiles
  and then calls pxAvg, which will actually calculate the average pixel
  color in each tile. */

void tileInfo(int tX, int tY){

  for (int i = 0; i < tX; i++){
    for (int j = 0; j < tY; j++){

      pxAvg(i * pxPerTile, j * pxPerTile);

    }
  }
}



/*pxAvg will iterate through all the pixels in a tile and find the average
  color value in each channel.  It will then set the colors of one of the
  cirlce objects.  It takes an x and y offset value so that it will start
  from the upper left corner of the tile.*/

void pxAvg(int xOff, int yOff){  

  float tmpR = 0;          //These variables are used to some up the values
  float tmpG = 0;          //of the different color channels
  float tmpB = 0;

  for (int i = 0; i < pxPerTile; i++){    //nested for loop iterates through
    for(int j = 0; j < pxPerTile; j++){   //the pixels

      int x = i + xOff;                   
      int y = j + yOff;

      tmpR += red(get(x, y));
      tmpG += green(get(x, y));
      tmpB += blue(get(x, y));
      
      tiled[tileIterator].setPos(x, y);  //set the position for the center of the
                                         //semicircles
    }
  }

  float area = sq(pxPerTile);            

  float rFin   = tmpR / area;           //takes the total color channel value
  float gFin = tmpG / area;             //and makes it an average
  float bFin  = tmpB / area;

  tiled[tileIterator].setColors(rFin, gFin, bFin);  //passes the averaged color
                                                    //info to the circles themselves
  tileIterator++;

}

//==============================================================================
//                            Circle class
//==============================================================================

class circle{

  float redAlpha;            //these variables will give the 3 semicircles in each grid location its colors
  float blueAlpha;
  float greenAlpha;
  
  int px, py;                //position of the circles
  
  float rotR;                //rotation rate of each of the circles.  R for Red, G for Green, and B for Blue
  float rotG;
  float rotB;
  final float rotConst = 500;  //Constant that the rotation is based on

  //-----------------
  circle(){
    
    rotR = rotConst + random(-250, 250);  //generate rotation rates for each of the three semicirlces in the 
    rotG = rotConst + random(-250, 250);  //object
    rotB = rotConst + random(-250, 250);
  }

  //-----------------
  void setColors(float r, float g, float b) {    //sets the alpha value for each circle based on the average
    redAlpha = r;                                //color value for that pixel with in a tile on the grid
    greenAlpha = g;
    blueAlpha = b;
  }

  //-----------------
  void setPos(int x, int y){                     //set the position of the tile
    px = x;
    py = y;  
  }

  //-----------------
  void generateCircles(){
  
    pushMatrix();          
    translate(px, py);                            //translate to the point where the circles will be drawn from
    
    pushMatrix();
    rotate(millis() / rotB);                     //rotate based on millis() divided by the rotation rate for the individual circle
    fill(0, 0, 255, blueAlpha);                  //since the background is black, (0, 0, blueAlpha) is equal to (0, 0, 255, blueAlpha)
    circ();
    popMatrix();

    pushMatrix();
    translate(0,0, 0.1);
    rotate(millis() / rotR);
    fill(255, 0, 0, redAlpha);
    circ();
    popMatrix();

    pushMatrix();
    translate(0,0, 0.2);
    rotate(millis() / rotG);
    fill(0, 255, 0, greenAlpha);
    circ();
    popMatrix();
    

    
    popMatrix();

  }

  //-----------------
  void circ(){                            //circ() will draw the circles, using pre-cached coordinates.
   
    beginShape(TRIANGLE_STRIP);

    for(int i = 0; i < 11; i++){

      vertex(0, 0);
      vertex(cosX[i], sinY[i]);
    }

    endShape();
  }

}

