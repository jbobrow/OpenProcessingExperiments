
/*Credits to and Referenced from Explode Tutorial 
http://processing.org/learning/3d/explode.html
Images taken from 
http://www.flickr.com/photos/crispy789/2746530944/sizes/o/in/photostream/
and http://www.flickr.com/photos/crispy789/2727740290/sizes/o/in/set-72157605749209031/
*/

PImage Sydney;
PImage bgImage;
int cellsize = 2;
int columns, rows;  
 
void setup() {
  size(800, 600, P3D);
  Sydney = loadImage("Sydney.jpg"); //Colourful image once the particles gather together
  bgImage = loadImage("bgImage.jpg"); //Black and White image of dull Sydney
  columns = width/cellsize;           
  rows = height/cellsize;    
}
 
void draw(){
  background(bgImage);
  particles(); //Follows the mouse
}

void particles(){ //Different pieces or particles coming together to form Sydney
  loadPixels();
  for ( int i = 0; i < columns;i++) {
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/5;
      int y = j*cellsize + cellsize/5;
      int loc = x+ y*width;         
      color c = Sydney.pixels[loc];    
      float z = (mouseX/(float)width*2) * brightness(Sydney.pixels[loc]) - 200;
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,mouseY-300,cellsize,cellsize);
      popMatrix();
    }
  }
}


