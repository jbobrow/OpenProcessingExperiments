
//Working with Images in Processing

//Declare a PImage variable type
PImage snowflake;

//Load an image file from HDD
/*Don't forget to add the file
to your sketch 'data' folder */
void setup() {
  size(500, 384);
  snowflake = loadImage("snowflake.jpg");
}

//Draw the image to the screen at (0,0)
void draw() {
 //image(snowflake, 0, 0); 
 image(snowflake, 0, 0, 250, 192);
}

