
//Prince
PImage type;
int x,y;
 
void setup(){
 
  size(500,500);
  smooth();
  //image should be black and white type:
  type = loadImage("Prince.jpg");
  background(101,19,134);
  strokeWeight(.5); //create thin, delicate lines
  //goes through 5,000 iterations!
  for (int i = 0; i < 5000; i++){
     //get random x and y coordinates
     x = int(random(width));
     y = int(random(height));
 
     //gets the color values of the current pixel
     color cp = type.get(x,y);
 
     //determines their brightness
     float b = brightness(cp);
 
     //b == 0 is black
     //checks for instances in which the chosen pixel is black
     if (b < 45){
        float ellSize = random(5,30); //choose a random ellipse size between 5 and 15
        rect(x,y,ellSize,ellSize);
     }
  }
}
 
void draw(){
 
}


