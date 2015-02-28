
/**
by wes 11/20/09
wes@pitchinteractive.com
www.pitchinterctive.com
**/
float fontSize = 8;
PFont font;
PImage img;
float tileSize = 13; //distance between each point
String imgName = "spring.jpg"; //change this to your image file name. The image should be in the data folder or same folder as the .pde file

void setup() {
  //set your font
  font = createFont("AdvoCut",10);
  //load your image
  img = loadImage(imgName);
  //set size of stage to the image dimensions
  //size(img.width,img.height); 
  size(924,648);//resized manually to make this work for OP
  smooth();
  render();
}

void render() {
  background(0);
  float x=0, y =10;
  
  while(y < height) {
    int imgX = (int) map(x,0,width,0,img.width);
    int imgY = (int) map(y,0,height,0,img.height);
    //get curr color of pixel
    color c = img.pixels[imgY * img.width + imgX];
    //get greyscale to determine rotation
    int greyscale = round(red(c)*0.222 + green(c)*0.707 + blue(c)*0.071);
    //convert the color to a hex value (to display)
    String h = hex(c,6);
    pushMatrix();
    translate(x,y);
    
    //define text
    textFont(font, fontSize);
    //set color to pixel color value
    fill(c);
    //rotate in relation to greyscale value
    rotate(greyscale/255.0 * PI);
    //set text
    text(h, 0, 0);
    //increment x val
    x += tileSize;
    popMatrix();
    
    //line breaks
    if(x + tileSize >= width) {
      x = 0;
      //increment y
      y += tileSize;
    }
  }
}

