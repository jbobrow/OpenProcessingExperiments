
//import processing.video.*;

//Capture cam;
PImage img;
boolean stroke = false;
int grootte = 10;

void setup() {
  img = loadImage("schilderij.jpg");
//  cam = new Capture(this, 640, 480, 15);
  size(img.width, img.height);
  background(255);
  smooth();
  
  println(width);
  println(height);
}

void draw() {

  if (keyPressed){     
    switch(key) {
      case 'x' :
        grootte++;
        break;
      case 'z' :
        grootte--;
        break;
      case ' ' :
        if(stroke == false) stroke = true;
        else stroke = false;
        break;
    }
  }

  
  int x = mouseX;
  int y = mouseY;
  int loc = x + y*img.width;
  
  // Look up the RGB color in the source image
//  cam.read();
//  cam.loadPixels();
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  
  pushStyle();
    
    if(stroke == false) noStroke();
    // Draw an ellipse at that location with that color
    fill(r,g,b,225);
    //ellipse(x,y,grootte);
    triangle(x,y+(grootte*random(-2,2)),x+(grootte*random(-2,2)),y-(grootte*random(-2,2)), x-(grootte*random(-2,2)), y-(grootte*random(-2,2)));
  popStyle();
}


