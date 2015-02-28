
//Image manupilator
//Kutay Cengil IED Barcelona Video Design
//Processing project 10 

PImage myImage;
color myColor;
int pW; // the width of the image
int pH; // the height of the image
 void setup(){
 // Loading image to the sketch that we gonna manupilate
  myImage = loadImage("img.jpg");
  size(500, 302);
  background(255);
 
 myImage.filter(BLUR,0.1); //Adding some simple filters for more strong visual
 myImage.filter(THRESHOLD,0.2);
 
 //According to the need efects are possible to change 
 // myImage.filter(POSTERIZE,);
 // myImage.filter(INVERT);
  
  pW = myImage.width;
  pH = myImage.height;
 
  // Color change
  box( color(243,243,233),color(145,149,148), color(235,243,138));
 
 
}
 
 //For the Threshold filter since it is converting image to black and white pixels.
void box(color c1, color c2, color c3){
    for(int x=0; x<pW; x++){
    for(int y =0; y<pH; y++){
      color imgPixel = myImage.get(x,y);
      myColor = color(imgPixel);
 
      // If the color is black, we are using the C1 color
      if(myColor==color(0)){
        stroke(color(c1));
      }
 
       // Start checking every pixel for white
 
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
        //four directions, then it must be a background pixel    
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
 

