
PImage type;
int x,y;


void setup(){
  
  colorMode(HSB,360,100,100);
  size(600,600);
  smooth();
  //image should be black and white type:
  type = loadImage("type.png");
  background(233,90,85);
  strokeWeight(5); //create thin, delicate lines
  //goes through 5,000 iterations!
  for (int i = 8000; i < 50000; i++){
     //get random x and y coordinates
     x = int(random(width));
     y = int(random(height));

     //gets the color values of the current pixel
     color cp = type.get(x,y);

     //determines their brightness
     float b = brightness(cp);

     //b == 0 is black
     //checks for instances in which the chosen pixel is black
     if (b == 0){
        float ellSize = random (5,13); //choose a random ellipse size between 5 and 15
        ellipse(x,y,ellSize,ellSize);
        
     }
  }
}

void draw(){
 smooth();
ellipse(405,332,3,3);
fill(223,1,2);
smooth();
line(322,359,314,339);
line(340,364,351,338);
  
  
  println("x: " + mouseX);
  println("y: " + mouseY);



}

