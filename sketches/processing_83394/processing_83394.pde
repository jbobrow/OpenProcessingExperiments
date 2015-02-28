
/*Processing skecth based on Brightness Mirror from Daniel Shiffmans Learning Processing
An image is loaded and scaled up 8 times
each image pixel is used to color a letter and set its size based on brightness
the letter is loaded over and over from a string of text
*/

//size of each cell in the grid, ratio of window size to video size
int imgScale = 8;
//variable for a timer
int counter;
//variable to alter size of text
float fontScale;
//numbero f columns and rows
int cols,rows;
String file = "Santa.jpg";
boolean reset = false;

//a string and font and an image object
String chars = "Merry Christmas!!!";
PFont f;
PImage img;

void setup(){
  // load image
  img = loadImage(file);
  img.resize(80, 0);
   //set window size relative to image and image scale for each pixel
  size(640,480);
  println(img.width*imgScale);
  println(img.height*imgScale);
   cols = width/imgScale;
  rows = height/imgScale;
  
  //load font - use a fixed width font
  f = loadFont("Courier-Bold-20.vlw");
  frameRate(2);
}

void draw(){
  fontScale++;
  if(fontScale>10){
    fontScale=10;
    if(reset==false){
    reset=true;
    counter=millis();
    }
    }
    if(millis()-counter>2000 && reset == true){
      fontScale=0;
      reset=false;
  
    }
  
  background(0);
  //use a variable to count thro chars in string
  int charcount = 0;
  
  //begin loop for rows
  for(int j = 0; j < rows; j++){
    //begin loop for columns
    for(int i = 0; i < cols; i++){
      //where are we pixel-wise?
      int x = i*imgScale;
      int y = j*imgScale;
      
     //get position in pixel array
     int loc = i + j*img.width;
     //pick out the color of the pixel in the image
     float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
       float b = blue(img.pixels[loc]);
     color c = color(r,g,b);
     //pick out the brightness ofthe pixel
     float bright = brightness(img.pixels[loc]);
     //set the font size relative to the brightness and fontScale
    
  float fontSize = (fontScale*2)*(bright/255);
 
      //display an individual caharcater from string instead of rectangle
      textFont(f);
         textSize(fontSize);
      fill(c);
     //fill(49,139,30,200);
      text(chars.charAt(charcount),x,y);
      //go on to next character
      charcount = (charcount+1) % chars.length();
    }
  }

}

//record image if a key is pressed
void keyPressed(){
  saveFrame("####.jpg");
}


