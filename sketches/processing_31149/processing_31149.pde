
 

   

int NUMIMG =4; //number of images  

int DIST = 60; // size of bright "hole"  

   

PImage imgActive;  

   

   

float xx=0;  

float yy=0;  

   

PImage [] img = new PImage[NUMIMG];  

   

   


void setup() {  

   

  size(500,410);  

   

  noCursor();  

  img [0] = loadImage("123.jpg"); //images  

  img [1] = loadImage("234.jpg");  

  img [2] = loadImage("345.jpg");  

  img [3] = loadImage("456.jpg");  

   imgActive = img[0];  

      


  smooth();  

   

  loadPixels();  

}  

   

void keyPressed () { 

  switch (key) {  

  case'q':  

imgActive = img[0];  

    break;  

  case'w':  

imgActive = img[1];  

    break;  

  case'e':  

imgActive = img[2];  

    break;  

  case'r':  

imgActive = img[3];  

   break;  

  }  

}  

   

   

   

   

void draw() {  

  
  
  
  
  
  
  
  
xx =xx+11;  

yy =yy+13;  

   

   

if( xx>width) xx=random(width); // make the "hole" appeare in random place  

if( yy>height) yy=random(height);  

   

   

   

   

 imgActive.loadPixels();  

  for (int x = 0; x < imgActive.width; x++) {  

    for (int y = 0; y < imgActive.height; y++ ) {  

      // Calculate the 1D location from a 2D grid  

      int loc = x + y*imgActive.width;  

      // Get the R,G,B values from image  

      float r,g,b;  

      r = red (imgActive.pixels[loc]);  

      g = green (imgActive.pixels[loc]);  

      b = blue (imgActive.pixels[loc]);  

      // Calculate an amount to change brightness based on proximity to the mouse  

      float maxdist =DIST;//  

      dist(7,7,width,height);  

      dist (4,4,width, height);  

      float d = dist(x,y,xx,yy);  

      float e = dist(x,y,xx,yy);  

      float adjustbrightness = 100*(maxdist-d)/maxdist;  

      r += adjustbrightness;  

      g += adjustbrightness;  

      b += adjustbrightness;  

      // Constrain RGB to make sure they are within 0-255 color range  

      r = constrain(r,0,255);  

      g = constrain(g,0,255);  

      b = constrain(b,0,255);  

      // Make a new color and set pixel in the window  

      color c = color(r,g,b,20);  

      // color c = color(r);  

      pixels[y*width + x] = c;  






    }  

  }  

  updatePixels();  







fill(158,101,170,35);  

ellipse(mouseX, mouseY,100,100);  

fill(134,170,105,35);  

triangle(mouseX,mouseY,100,110,200,170);  

fill(119,207,211,35);  

triangle(mouseX,mouseY,100,450,250,450);  

fill(193,35,101,35);  

triangle(mouseX,mouseY,450,100,450,250);  

fill(95,209,158,35);  

triangle(mouseX,mouseY,85,256,170,256);  

fill(227,232,101,35);  

triangle(mouseX,mouseY,280,300,475,450);  

fill(247,127,127,35);  

triangle(mouseX,mouseY,350,65,400,75);  

fill(240,161,58,35);  

triangle(mouseX,mouseY,45,45,75,75);  

   

ellipse(mouseX, mouseY, 15,15);  


fill(158,101,170,35);  

ellipse(mouseY, mouseX,100,100);  

fill(134,170,105,35);  

triangle(mouseY,mouseX,100,110,200,170);  

fill(119,207,211,35);  

triangle(mouseY,mouseX,100,450,250,450);  

fill(193,35,101,35);  

triangle(mouseY,mouseX,450,100,450,250);  

fill(95,209,158,35);  

triangle(mouseY,mouseX,85,256,170,256);  

fill(227,232,101,35);  

triangle(mouseY,mouseX,280,300,475,450);  

fill(247,127,127,35);  

triangle(mouseY,mouseX,350,65,400,75);  

fill(240,161,58,35);  

triangle(mouseY,mouseX,45,45,75,75);  

   

ellipse(mouseY, mouseX, 15,15);  

   

fill(219,110,0,35);  

triangle(mouseX,mouseY,13,17,18,31);  

triangle(mouseY,mouseX,13,17,18,31);  

   

fill(0,49,219,35);  

triangle(mouseX,mouseY,250,35,275,50);  

triangle(mouseY,mouseX,250,35,275,50);  




} 



