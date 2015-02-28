
/////////////////////////////////////////////////////////////
// Another simple example of image manipulation
// using Processing
//
// in this example, we take an image which has been 
// modified in Gimp, and we create "Warholize" it
// 
// Source: www.Arkadian.eu
//
/////////////////////////////////////////////////////////////
PImage myImage;
int randomX = 0;
int randomY = 0;
int a = 2000;
int myRed;
int myGreen;
int myBlue;
color myColor;

int pW; // the width of the image
int pH; // the height of the image

/////////////////////////////////////////////////////////////
void setup(){
  
  // Images must be in the "data" directory to load correctly
  myImage = loadImage("AW10.JPG");
  size(myImage.width * 3, myImage.height * 3);
  background(255);

  myImage.filter(THRESHOLD, 0.3);

  pW = myImage.width;
  pH = myImage.height;

  // Line 1, Box 1
  box( color(42,37,119),color(145,189,18), color(255,253,18));

  // Line 1, Box 2 
  translate(pW,0);
  box( color(228,21,41),color(228,189,18), color(8,129,242));

  // Line 1, Box 3
  translate(pW,0);
  box( color(228,21,41),color(235,149,190), color(44,35,124));

  // Line 2, Box 1
  translate(-2*pW,pH);
  box( color(120,68,150),color(125,185,248), color(247,133,19));

  // Line 2, Box 2   
  translate(pW,0);
  box( color(0),color(255), color(225,21,39));

  // Line 2, Box 3
  translate(pW,0);
  box( color(235,103,16),color(255,253,163), color(139,180,18));

  // Line 3, Box 1
  translate(-2*pW,pH);
  box( color(227,10,123),color(255), color(39,111,100));

  // Line 3, Box 2    
  translate(pW,0);
  box( color(233,34,39),color(154,189,61), color(255,249,18));

  // Line 3, Box 3 
  translate(pW,0);
  box( color(42,37,119),color(235,122,18), color(228,11,126));
}


/////////////////////////////////////////////////////////////
void draw(){
  // uncomment the code below, 
  // if you want to save the image
  // and exit the application
  //
  //  saveFrame("andy_warhol.png"); 
  //  exit();

}

/////////////////////////////////////////////////////////////
void box(color c1, color c2, color c3){
  // Note
  // c1 = head, c2 = face, c3 = background

  for(int x=0; x<pW; x++){
    for(int y =0; y<pH; y++){
      color imgPixel = myImage.get(x,y);
      myColor = color(imgPixel);

      // If the color is black, we are using the C1 color
      if(myColor==color(0)){
        stroke(color(c1));
      }

      // If the color is white, we need to find out if the pixel
      // is within the area defined by the black line
      // or if it's just a pixel from the background.
      //
      // The way to figure this out, is to start checking every pixel
      // from all four directions.  

      if(myColor!=color(0)){
        int myLeft = 0;
        int myRight = 0;
        int myTop = 0;
        int myBottom = 0;

        for (int Left = 0; Left <= x; Left++){
          if (color(myImage.get(Left,y)) == color(0)){
            myLeft = myLeft + 1;
          } 
        }

        for (int Right = x; Right < pW; Right++){
          if (color(myImage.get(Right,y)) == color(0)){
            myRight = myRight + 1;
          } 
        }

        for (int Top = 0; Top <= y; Top++){
          if (color(myImage.get(x,Top)) == color(0)){
            myTop = myTop + 1;
          } 
        }

        for (int Bottom = y; Bottom < pH; Bottom++){
          if (color(myImage.get(x,Bottom)) == color(0)){
            myBottom = myBottom + 1;
          } 
        }

        // if we didn't find a black pixel from one of the 
        //for directions, then it must be a background pixel    
        if( myRight == 0  || myLeft==0 || myTop ==0 || myBottom == 0){
          stroke(color(c3)); //background  
        }  

        // otherwise, the pixel is located within the outer line
        //of the shape we are painting
        else{  
          stroke(color(c2));
        }
      } 
      point(x,y); 
    }
  }
}




