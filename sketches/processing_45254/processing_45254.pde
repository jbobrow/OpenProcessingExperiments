
PImage img;       
int cellsize = 5; 
int cols, rows;   

void setup() {
 
  img = loadImage( "rain.jpg" ); 
  cols = img.width/cellsize;             
  rows = img.height/cellsize;    
  
  size(400,300, P3D);  
}

void draw() {
  background(0);
  img.loadPixels();

    for(int i=img.pixels.length-1;i>100;i--){
img.pixels[i]=img.pixels[i-100];
}
  for (int i = 0; i < cols; i++ ) {
   
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; 
      int y = j*cellsize + cellsize/2; 
      int loc = x + y*width;           
      color c = img.pixels[loc];      

     
      float z = (mouseX/(float)width) * brightness(img.pixels[loc])+ 100.0;


      pushMatrix();
      translate(x,y,z); 
      fill(c);
      stroke(c);
      rectMode(CENTER);
      triangle(0,0, 0,0,cellsize,cellsize);
      popMatrix();

    }
  }
  //saveFrame();
}

