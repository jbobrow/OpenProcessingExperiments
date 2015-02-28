
float x = 0.0; float y = 0.0;
PImage img;

void setup(){ size(400, 600); smooth(); 
 img = loadImage ("sunrays.png");
 background(img); 
 }
 
void draw(){ //click mouse to clear 

if(mousePressed)
 image (img, 0, 0); //x,y position of image
frameRate(15); x += 5; y = -x + 250;

stroke(#FFEC7D, y); noFill(); ellipse(380,20, x, x);
if (x > 550){ x = 0;
} }

