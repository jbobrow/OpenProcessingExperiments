
PImage img;

void setup(){
  size(500,700);
  img = loadImage("fogs copy.jpg"); 
  smooth();
}

void draw(){
  frameRate (5);
  background (255);
  
  loadPixels(); 
  
  for (int y = 0; y < img.height; y+=5 ) {
    // skip every 5 pixels along the x-axis
    for (int x = 0; x < img.width+5; x+=5) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Color according to the image
      stroke(img.pixels[loc]);
      fill(img.pixels[loc]);
      //Draw a triangle pointing up or pointing down
      //rect (0,0, 500,600);
      //if (x %5 == 0) ellipse(x+5,y-5, 5,5);
      //else ellipse (x,y, 5,5);
      
      //for (int w = 0; w < 1; w ++){
      //paintCircles();
float x1 = random (0, 10);
float y1 = random (0, 15);
stroke(150);

  ellipse ( x, y, x1,y1);

    
    }
      
    }
 
  
  
     
    }
  


void paintCircles (){
      
  for (int x = 0; x< width; x = x+ 5)
  for (int y = 0; y< height; y = y + 5) {
  noStroke();
  
/*float r = random (0,255);
float g = random (0,255);
float b = random (0,255);
float a = random (0,255);*/
/*float x1 = random (0, 50);
float y1 = random (0, 75);
stroke(150);
  //fill (0,0,0,10);
  ellipse ( x, y, x1,y1);*/
    }
}


