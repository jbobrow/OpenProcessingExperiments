



PImage img;  //image of lightning storm

void setup() {
  size(300, 300);
  img = loadImage("img.jpg");
  noStroke();
  smooth();
}

int r = 1; // the number of spaces that will be used to create image

void draw() {
  background(0);


  for (int y=r; y <= 299; y+=r) {    
    for (int x=r; x <= 299; x+=r) {



      
      float b = r * (brightness(img.pixels[x + (y * 300)]) / 255);  //making the brightness factor an integer between 0 and 1 so that it is easier to use and understand

      if (b >=.75) {        //if the brighntess in the image is within this range the following occurs
        fill(0, 50, 255);
        ellipse(x, y, b, b);
      }



      if (b<.75 && b> .25) {    //a different set of parameters defined here regarding the brightness factor
        fill(0, 200, 175);
        ellipse(x, y, 1.25*b, 1.25*b);
      }

      else {                 //the final paramter for any part of the image where the brightness factor did not satisfy the previous paramter, the following is down
        fill(0, 255, 125);
        ellipse(x, y, 1.25*b, 1.25*b);
      }
    }
  }
}


//the code creates ellipses of slightly varying sizes and fills based on the brightness of the base image


