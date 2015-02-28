

/**
 * pixel mapping. Each pixel is translated into a new element
 * 
 * MOUSE
 * position x/y        : various parameters (depending on draw mode)
 * 
 * KEYS
 * 1-9                 : switch draw mode
 * s                   : save png
  */
  
  
PImage photo;
int drawMode = 1;
//drawMode = 1, means that this is the default selection when code is run

void setup () {
  size (1000, 670); //size should be multiple  of image with and height
  smooth();
  photo = loadImage ("03.jpg");
  println (photo.width+" x "+photo.height);

}  

void draw () {
  
  background (255);
  
  float mouseXFactor = map(mouseX, 0,width, 0.05,1);
  float mouseYFactor = map(mouseY, 0,height, 0.05,1);

  for (int gridX = 0; gridX < photo.width; gridX++) {
    for (int gridY = 0; gridY < photo.height; gridY++) {
      // grid position + tile size
      float tileWidth = width / (float)photo.width;
      float tileHeight = height / (float)photo.height;
      float posX = tileWidth*gridX;
      float posY = tileHeight*gridY;

      // get current color
      color c = photo.pixels[gridY*photo.width+gridX];
      // greyscale conversion
      int greyscale =round(red(c)*0.222+green(c)*0.707+blue(c)*0.071);
  
  switch(drawMode) {
      case 1:
        // greyscale to stroke weight
        float w1 = map(greyscale, 0,255, 15,0.1);
        stroke(0);
        strokeWeight(w1 * mouseXFactor);
        line(posX, posY, posX-2, posY+2); 
        break;
       case 2:
        // greyscale to ellipse area
        fill(0);
        noStroke();
        float r2 = 1.1284 * sqrt(tileWidth*tileWidth*(0.5-greyscale/200.0));
        r2 = r2 * mouseXFactor * 3;
        ellipse(posX, posY, r2, r2);
        break;
        case 3:
        // greyscale to line length
        float l2 = map(greyscale, 0,255, 30,-1.0);
        l2 = l2 * mouseXFactor;   
        stroke(0);
        strokeWeight(15 * mouseYFactor);
        line(posX, posY, posX+l2, posY+l2);
        break;
        case 4:
        // greyscale to rotation, line length and stroke weight
        stroke(0);
        float w4 = map(greyscale, 0,255, 10,0);
        strokeWeight(w4 * mouseXFactor + 0.1);
        float l4 = map(greyscale, 0,255, 35,0);
        l4 = l4 * mouseYFactor;
        pushMatrix();
        translate(posX, posY);
        rotate(greyscale/255.0 * PI);
        line(0, 0, 0+l4, 0+l4);
        popMatrix();
        break;
        case 5:
        // greyscale to line relief
        float w5 = map(greyscale,0,255,5,0.2);
        strokeWeight(w5 * mouseYFactor + 0.1);
        // get neighbour pixel, limit it to image width
        color c2 = photo.get(min(gridX+1,photo.width-3), gridY);
        stroke(c2);
        int greyscale2 = int(red(c2)*0.222 + green(c2)*0.707 + blue(c2)*0.071);
        float h5 = 50 * mouseXFactor;
        float d1 = map(greyscale, 0,255, h5,0);
        float d2 = map(greyscale2, 0,255, h5,0);
        line(posX-d1, posY+d1, posX+tileWidth-d2, posY+d2);
        break;
         case 6:
        // pixel color to fill, greyscale to rect size
        float w9 = map(greyscale, 0,255, 25,0);
        noStroke();
        fill(c);
        rect(posX, posY,w9 * mouseXFactor, w9 * mouseXFactor); 
        break;
         case 7:
        stroke(c);
        float w7 = map(greyscale, 0,255, 5,0.1);
        strokeWeight(w7);
        fill(255,255* mouseXFactor);
        pushMatrix();
        translate(posX, posY);
        rotate(greyscale/255.0 * TWO_PI* mouseYFactor);
        rect(0,0,15,15);
        popMatrix();
        break;
        case 8:
        noStroke();
        fill(greyscale,greyscale * mouseXFactor,255* mouseYFactor);
        rect(posX,posY,3.5,3.5,7);
        rect(posX-4,posY,4.5,4.5);
        rect(posX,posY+10,3.5,3.5,7);
        rect(posX-20,posY+14,5.5,5.5,7);
        break;
        case 9:
        stroke(255,greyscale,0);
        noFill();
        pushMatrix();
        translate(posX, posY);
        rotate(greyscale/255.0 * PI);
        strokeWeight(1);
        rect(0,0,15* mouseXFactor,15* mouseYFactor);
        float w10 = map(greyscale, 0,255, 30,0.1);
        strokeWeight(w10);
        stroke(0,70);
        ellipse(0,0,10,15);
        popMatrix();
        break;
  }
    }
  }

}









void keyReleased() {
  if (key == 's' || key == 'S') saveFrame ("screenshot.png");
  

  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key == '3') drawMode = 3;
  if (key == '4') drawMode = 4;
  if (key == '5') drawMode = 5;
  if (key == '6') drawMode = 6;
  if (key == '7') drawMode = 7;
  if (key == '8') drawMode = 8;
  if (key == '9') drawMode = 9;
}




