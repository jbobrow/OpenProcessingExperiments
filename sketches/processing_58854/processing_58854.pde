
/*****************************************
 * Assignment 06
 * Name:         Shuyi Lin
 * E-mail:       slin01@brynmawr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    4/10/2012
 * 
 *This is a picture taken from www.publicdomainpictures.net of a tree in a safari. I decided to 
 process the image five different ways and crop the processed images in certain way to mash it together
 into one image. Starting from the left, its the convolution, then the red tint filter, then the lines, 
 threshold and finally the negative. 
 Picture credited to Anna Cervova from http://www.publicdomainpictures.net/view-image.php?image=9111&picture=tree
 
 ***********************************************/
//size for the line
int s=10;

//matrix for Sharpen
float[][] matrix = {
  {
    -1, -1, -1
  }
  , 
  {
    -1, 9, -1
  }
  , 
  {
    -1, -1, -1
  }
};
;


//convolution code from processing tutorial, credit to Daniel Shiffman; 
color convolution(int x, int y, PImage img) {
  int offset = matrix.length/2;
  float r = 0.0, g = 0.0, b = 0.0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j= 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-offset;
      int newY = y+j-offset;
      int idx = img.width*newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, img.pixels.length-1);
      // Calculate the convolution
      r += (red(img.pixels[idx]) * matrix[i][j]);
      g += (green(img.pixels[idx]) * matrix[i][j]);
      b += (blue(img.pixels[idx]) * matrix[i][j]);
    }
  }

  return color(r, g, b);
}

void setup () {
  PImage img=loadImage ("037.jpg");
  PImage img2=loadImage ("037.jpg");
  PImage img3=loadImage ("037.jpg");
  PImage img4=loadImage ("037.jpg");
  PImage img5=loadImage ("037.jpg");
  size (1000, 666);

  //convolution matrix applied to image
  int matrixsize = 3;
  img4.loadPixels();
  for (int y = 0; y <img4.height; y++) {
    for (int x = 0; x < img4.width; x++ ) {
      color c = convolution(x, y, img);
      int loc = x + y*img4.width;
      img4.pixels[loc] = c;
    }

    img4.updatePixels();
  }

  //Threshold applied to image
  img.loadPixels ();
  color black =color (0);
  color rd=color (225, 0, 0);
  color pink=color (222, 96, 134,100);
  for (int i=0; i<img.pixels.length; i++) {
    color c=img.pixels[i];
    float total=red (c)+green (c)+blue(c);
    if (total<190) {
      img.pixels[i]=black;
    }
    else if (total<400) {
      img.pixels [i]=rd;
    }

    else {
      img.pixels[i]=pink;
    }
  }

  //Redish tint filter
  img2.loadPixels ();
  for (int i=0; i<img2.pixels.length; i++) {
    color c=img2.pixels[i];
    img2.pixels[i]=color (red(c), 0, 49);  
    img2.updatePixels ();
  }


//formation of lines
  for (int y=0; y<img3.height; y+=s) {
    for (int x=0; x<img3.width; x+=s) {
      int i = x + width*y;
      color c = img3.pixels[i];
      stroke (c);
      strokeWeight (7);
      line (x, y, x+s, y+s);
    }
  }

  img3.loadPixels();
  loadPixels();
  for (int y=0; y<img3.height; y++) {
    for (int x=0; x<img3.width; x++) {
      int i = x + width*y;
      img3.pixels[i] = pixels[i];
    }
  }
  updatePixels();
  img3.updatePixels();


  //negative of image  
  img5.loadPixels ();
  for (int i=0; i<img5.pixels.length; i++) {
    color c = img5.pixels[i];
    img5.pixels[i] = color(255-red(c), 255-green(c), 255-blue(c));
  }
  img5.updatePixels();

  //arrangement of the 5 processed images

  //Sharpened Image
  PImage a=img4.get (0, 0, width/5, height);
  image (a, 0, 0, width/5, height);

  //Reddish tint filter
  PImage b=img2.get (200, 0, width/5, height);
  image (b, width/5, 0, width/5, height);

  //lines
  PImage c=img3.get (400, 0, width/5, height);
  image (c, 0.4*width, 0, width/5, height);
  
  //Threshold
  PImage d= img.get (600, 0, width/5, height);
  image (d, 0.6*width, 0, width/5, height);

  //Negative
  PImage e=img5. get(800, 0, width/5, height);
  image (e, 0.8*width, 0, width/5, height);
}



