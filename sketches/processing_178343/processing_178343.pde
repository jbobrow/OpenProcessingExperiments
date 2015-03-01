
//Declare a PImage variable type
PImage Blue_Moon_Landscape;

//Load an image file from HDD
/*Don't forget to add the file
to your sketch "data" folder */
void setup() {
  size (1000, 600);
  
Blue_Moon_Landscape = loadImage("Blue_Moon_Landscape.jpg");
  
}

//Draw the image to the screen at (0,0)
void draw () {
  image(Blue_Moon_Landscape, 0, 0, 1000, 600); 
}





