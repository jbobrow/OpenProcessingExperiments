
//Iv Shqevi
//Lab 6
//redrawing a picture of me in an art gallery.
int num = 20;
  
PImage gallery;
  
void setup(){
  size(300,300);
  gallery = loadImage("gallery.jpg");
  background(0);
  smooth();
  frameRate(5000);
}
    
 
void draw(){       //programing it to reed RGB value from the my image
    int x = int (random(gallery.width));
    int y = int (random(gallery.height));  
    int Pixels = x + y*gallery.width;
    loadPixels();
    float r= red(gallery. pixels[Pixels]);    // reads red green and blue values of the image
    float g= green(gallery. pixels[Pixels]);  
    float b= blue(gallery .pixels[Pixels]);  
      
    noStroke();
    fill(r,g,b); //fills the rectangles with the rgb values it read from the obove code
    rect (x,y,random (num),random(num));
  }

