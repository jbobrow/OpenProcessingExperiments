
// This version is for Mams Gallery
// Matt: There are some notes for you, where you need to make a couple of changes to the code
// There are 2 lines that need removing to enable you save the image
// Then there'll be a bit of code in purple that says how the image will be saved
// Change it's name each time you run to prevent the last image from being overwritten.

Sprawl pixel; // declare object

void setup(){
  frameRate(300); // The speed at which the program runs (fps)
  size(400, 400); // This is the size of the background in pixels
  background(0,0,0); // background colour (r,g,b)
  smooth();
  
  //create object and pass in parameters
  pixel = new Sprawl(random(0,width), random(0,height));
}

void draw(){
  pixel.colour();
  pixel.move();
  pixel.display();
}

class Sprawl {
 // declare float values for pixel position and speed 
  float x;
  float y;
  float speed =5.0; // how far the pixel can move at each iteration of the program (in pixels)
                    
  // declare float values for pixel colour
  float q;
  float w;
  float e;
  
  Sprawl(float tempX, float tempY){  
    x = tempX;
    y = tempY;
  }
  
 // new pixel position. Export .jpg if pixel leaves the frame
  void move(){
    x += random(-speed, speed); 
    y += random(-speed, speed);
    println("x " + x + " : " + "y " + y + " : " + frameCount); // tell me where you are
    
      /*  MATT: DELETE EVERYTHING ON THIS LINE
      
      if((y > height || y < 0 || x > width || x < 0)){ 
        saveFrame("mamsGallery#.jpg"); // MATT: change the file name "mamsGallery#" for each new image saved
        exit();
          }
          
      MATT: DELETE EVERYTHING ON THIS LINE */   
      
      // The following is for use on the Open Processing website - Press mouse button to begin a new sequence    
      if (mousePressed){ 
        background(0);
        x = random(0,width);
        y = random(0,height);
          }
  }
  
  // Give the new pixel a random colour, r,g,b
  void colour(){             
    q = random(0.0,255.0); 
    w = random(0.0,255.0);
    e = random(0.0,255.0);
    stroke(q,w,e);
  }

  // plot a pixel at x,y   
  void display(){
    point(x, y);
  }
 }




